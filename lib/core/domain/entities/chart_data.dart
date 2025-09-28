import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chart_data.g.dart';

@JsonSerializable()
class ChartData extends Equatable {
  final DateTime date;
  final double value;
  final String label;

  const ChartData({
    required this.date,
    required this.value,
    required this.label,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) => _$ChartDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChartDataToJson(this);

  @override
  List<Object?> get props => [date, value, label];
}

@JsonSerializable()
class CategoryData extends Equatable {
  final String category;
  final double percentage;
  final String colorHex;

  const CategoryData({
    required this.category,
    required this.percentage,
    required this.colorHex,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);

  @override
  List<Object?> get props => [category, percentage, colorHex];
}

@JsonSerializable()
class DashboardMetrics extends Equatable {
  final double totalSales;
  final double totalRevenue;
  final double averageSales;
  final int dataPoints;

  const DashboardMetrics({
    required this.totalSales,
    required this.totalRevenue,
    required this.averageSales,
    required this.dataPoints,
  });

  factory DashboardMetrics.fromJson(Map<String, dynamic> json) => _$DashboardMetricsFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardMetricsToJson(this);

  @override
  List<Object?> get props => [totalSales, totalRevenue, averageSales, dataPoints];
}
