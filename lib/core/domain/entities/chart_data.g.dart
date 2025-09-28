// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartData _$ChartDataFromJson(Map<String, dynamic> json) => ChartData(
  date: DateTime.parse(json['date'] as String),
  value: (json['value'] as num).toDouble(),
  label: json['label'] as String,
);

Map<String, dynamic> _$ChartDataToJson(ChartData instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'value': instance.value,
  'label': instance.label,
};

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  category: json['category'] as String,
  percentage: (json['percentage'] as num).toDouble(),
  colorHex: json['colorHex'] as String,
);

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'category': instance.category,
      'percentage': instance.percentage,
      'colorHex': instance.colorHex,
    };

DashboardMetrics _$DashboardMetricsFromJson(Map<String, dynamic> json) =>
    DashboardMetrics(
      totalSales: (json['totalSales'] as num).toDouble(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      averageSales: (json['averageSales'] as num).toDouble(),
      dataPoints: (json['dataPoints'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardMetricsToJson(DashboardMetrics instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalRevenue': instance.totalRevenue,
      'averageSales': instance.averageSales,
      'dataPoints': instance.dataPoints,
    };
