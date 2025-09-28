import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import '../../domain/entities/chart_data.dart';

abstract class DashboardLocalDataSource {
  Future<List<ChartData>?> getCachedSalesData();
  Future<List<ChartData>?> getCachedRevenueData();
  Future<List<CategoryData>?> getCachedCategoryData();
  Future<void> cacheSalesData(List<ChartData> data);
  Future<void> cacheRevenueData(List<ChartData> data);
  Future<void> cacheCategoryData(List<CategoryData> data);
  Future<void> clearCache();
}

@injectable
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final SharedPreferences sharedPreferences;

  DashboardLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ChartData>?> getCachedSalesData() async {
    final jsonString = sharedPreferences.getString('cached_sales_data');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => ChartData.fromJson(json)).toList();
    }
    return null;
  }

  @override
  Future<List<ChartData>?> getCachedRevenueData() async {
    final jsonString = sharedPreferences.getString('cached_revenue_data');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => ChartData.fromJson(json)).toList();
    }
    return null;
  }

  @override
  Future<List<CategoryData>?> getCachedCategoryData() async {
    final jsonString = sharedPreferences.getString('cached_category_data');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => CategoryData.fromJson(json)).toList();
    }
    return null;
  }

  @override
  Future<void> cacheSalesData(List<ChartData> data) async {
    final jsonList = data.map((item) => item.toJson()).toList();
    await sharedPreferences.setString('cached_sales_data', json.encode(jsonList));
  }

  @override
  Future<void> cacheRevenueData(List<ChartData> data) async {
    final jsonList = data.map((item) => item.toJson()).toList();
    await sharedPreferences.setString('cached_revenue_data', json.encode(jsonList));
  }

  @override
  Future<void> cacheCategoryData(List<CategoryData> data) async {
    final jsonList = data.map((item) => item.toJson()).toList();
    await sharedPreferences.setString('cached_category_data', json.encode(jsonList));
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove('cached_sales_data');
    await sharedPreferences.remove('cached_revenue_data');
    await sharedPreferences.remove('cached_category_data');
  }
}
