import '../entities/chart_data.dart';

abstract class DashboardRepository {
  Future<List<ChartData>> getSalesData();
  Future<List<ChartData>> getRevenueData();
  Future<List<CategoryData>> getCategoryData();
  Future<DashboardMetrics> getDashboardMetrics();
  Future<void> refreshData();
}
