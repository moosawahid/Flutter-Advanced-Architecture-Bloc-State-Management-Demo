import '../../domain/entities/chart_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../datasources/dashboard_local_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource? localDataSource;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    this.localDataSource,
  });

  @override
  Future<List<ChartData>> getSalesData() async {
    try {
      // Try to get cached data first
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedSalesData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }

      // If no cache, fetch from remote
      final remoteData = await remoteDataSource.getSalesData();
      
      // Cache the data
      if (localDataSource != null) {
        await localDataSource!.cacheSalesData(remoteData);
      }
      
      return remoteData;
    } catch (e) {
      // If remote fails, try to return cached data
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedSalesData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }
      rethrow;
    }
  }

  @override
  Future<List<ChartData>> getRevenueData() async {
    try {
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedRevenueData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }

      final remoteData = await remoteDataSource.getRevenueData();
      if (localDataSource != null) {
        await localDataSource!.cacheRevenueData(remoteData);
      }
      return remoteData;
    } catch (e) {
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedRevenueData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }
      rethrow;
    }
  }

  @override
  Future<List<CategoryData>> getCategoryData() async {
    try {
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedCategoryData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }

      final remoteData = await remoteDataSource.getCategoryData();
      if (localDataSource != null) {
        await localDataSource!.cacheCategoryData(remoteData);
      }
      return remoteData;
    } catch (e) {
      if (localDataSource != null) {
        final cachedData = await localDataSource!.getCachedCategoryData();
        if (cachedData != null && cachedData.isNotEmpty) {
          return cachedData;
        }
      }
      rethrow;
    }
  }

  @override
  Future<DashboardMetrics> getDashboardMetrics() async {
    final salesData = await getSalesData();
    final revenueData = await getRevenueData();

    final totalSales = salesData.fold(0.0, (sum, data) => sum + data.value);
    final totalRevenue = revenueData.fold(0.0, (sum, data) => sum + data.value);
    final averageSales = salesData.isEmpty ? 0.0 : totalSales / salesData.length;

    return DashboardMetrics(
      totalSales: totalSales,
      totalRevenue: totalRevenue,
      averageSales: averageSales,
      dataPoints: salesData.length,
    );
  }

  @override
  Future<void> refreshData() async {
    // Clear cache and fetch fresh data
    if (localDataSource != null) {
      await localDataSource!.clearCache();
    }
    
    // Fetch all data fresh
    await getSalesData();
    await getRevenueData();
    await getCategoryData();
  }
}
