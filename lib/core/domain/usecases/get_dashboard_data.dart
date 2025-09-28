import '../entities/chart_data.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardData {
  final DashboardRepository repository;

  GetDashboardData(this.repository);

  Future<DashboardDataResult> call() async {
    try {
      final salesData = await repository.getSalesData();
      final revenueData = await repository.getRevenueData();
      final categoryData = await repository.getCategoryData();
      final metrics = await repository.getDashboardMetrics();

      return DashboardDataResult.success(
        salesData: salesData,
        revenueData: revenueData,
        categoryData: categoryData,
        metrics: metrics,
      );
    } catch (e) {
      return DashboardDataResult.failure(e.toString());
    }
  }
}

class DashboardDataResult {
  final bool isSuccess;
  final String? error;
  final List<ChartData>? salesData;
  final List<ChartData>? revenueData;
  final List<CategoryData>? categoryData;
  final DashboardMetrics? metrics;

  DashboardDataResult._({
    required this.isSuccess,
    this.error,
    this.salesData,
    this.revenueData,
    this.categoryData,
    this.metrics,
  });

  factory DashboardDataResult.success({
    required List<ChartData> salesData,
    required List<ChartData> revenueData,
    required List<CategoryData> categoryData,
    required DashboardMetrics metrics,
  }) {
    return DashboardDataResult._(
      isSuccess: true,
      salesData: salesData,
      revenueData: revenueData,
      categoryData: categoryData,
      metrics: metrics,
    );
  }

  factory DashboardDataResult.failure(String error) {
    return DashboardDataResult._(
      isSuccess: false,
      error: error,
    );
  }
}
