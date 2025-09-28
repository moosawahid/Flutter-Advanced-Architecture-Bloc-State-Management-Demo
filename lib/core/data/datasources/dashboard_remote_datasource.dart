import 'package:dio/dio.dart';
import '../../domain/entities/chart_data.dart';

abstract class DashboardRemoteDataSource {
  Future<List<ChartData>> getSalesData();
  Future<List<ChartData>> getRevenueData();
  Future<List<CategoryData>> getCategoryData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ChartData>> getSalesData() async {
    await Future.delayed(const Duration(seconds: 1));
    return _generateMockSalesData();
  }

  @override
  Future<List<ChartData>> getRevenueData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _generateMockRevenueData();
  }

  @override
  Future<List<CategoryData>> getCategoryData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _generateMockCategoryData();
  }

  List<ChartData> _generateMockSalesData() {
    final now = DateTime.now();
    return List.generate(30, (index) {
      final date = now.subtract(Duration(days: 29 - index));
      final sales = 1000 + (index * 50) + (index % 3) * 200;
      return ChartData(
        date: date,
        value: sales.toDouble(),
        label: _formatDate(date),
      );
    });
  }

  List<ChartData> _generateMockRevenueData() {
    final now = DateTime.now();
    return List.generate(12, (index) {
      final date = DateTime(now.year, index + 1);
      final revenue = 50000 + (index * 10000) + (index % 2) * 20000;
      return ChartData(
        date: date,
        value: revenue.toDouble(),
        label: _formatMonth(date),
      );
    });
  }

  List<CategoryData> _generateMockCategoryData() {
    return [
      const CategoryData(category: 'Electronics', percentage: 35, colorHex: '#2196F3'),
      const CategoryData(category: 'Clothing', percentage: 25, colorHex: '#4CAF50'),
      const CategoryData(category: 'Books', percentage: 20, colorHex: '#FF9800'),
      const CategoryData(category: 'Home & Garden', percentage: 15, colorHex: '#9C27B0'),
      const CategoryData(category: 'Sports', percentage: 5, colorHex: '#F44336'),
    ];
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}';
  }

  String _formatMonth(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[date.month - 1];
  }
}
