import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/chart_data.dart';
import '../../domain/usecases/get_dashboard_data.dart';

// Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class LoadDashboardData extends DashboardEvent {}

class RefreshDashboardData extends DashboardEvent {}

// States
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<ChartData> salesData;
  final List<ChartData> revenueData;
  final List<CategoryData> categoryData;
  final DashboardMetrics metrics;

  const DashboardLoaded({
    required this.salesData,
    required this.revenueData,
    required this.categoryData,
    required this.metrics,
  });

  @override
  List<Object?> get props => [salesData, revenueData, categoryData, metrics];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Bloc
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardData getDashboardData;

  DashboardBloc({required this.getDashboardData}) : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<RefreshDashboardData>(_onRefreshDashboardData);
  }

  Future<void> _onLoadDashboardData(
    LoadDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());

    final result = await getDashboardData();

    if (result.isSuccess) {
      emit(DashboardLoaded(
        salesData: result.salesData!,
        revenueData: result.revenueData!,
        categoryData: result.categoryData!,
        metrics: result.metrics!,
      ));
    } else {
      emit(DashboardError(message: result.error!));
    }
  }

  Future<void> _onRefreshDashboardData(
    RefreshDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    // Keep current state but show loading indicator
    if (state is DashboardLoaded) {
      emit(DashboardLoaded(
        salesData: (state as DashboardLoaded).salesData,
        revenueData: (state as DashboardLoaded).revenueData,
        categoryData: (state as DashboardLoaded).categoryData,
        metrics: (state as DashboardLoaded).metrics,
      ));
    } else {
      emit(DashboardLoading());
    }

    final result = await getDashboardData();

    if (result.isSuccess) {
      emit(DashboardLoaded(
        salesData: result.salesData!,
        revenueData: result.revenueData!,
        categoryData: result.categoryData!,
        metrics: result.metrics!,
      ));
    } else {
      emit(DashboardError(message: result.error!));
    }
  }
}
