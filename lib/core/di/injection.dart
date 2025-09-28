import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../data/datasources/dashboard_remote_datasource.dart';
import '../data/repositories/dashboard_repository_impl.dart';
import '../domain/repositories/dashboard_repository.dart';
import '../domain/usecases/get_dashboard_data.dart';
import '../presentation/bloc/dashboard_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External dependencies
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Data sources - using only remote for now to avoid SharedPreferences issues
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // Repository - simplified without local caching for now
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: getIt<DashboardRemoteDataSource>(),
      localDataSource: null, // Disable local caching temporarily
    ),
  );

  // Use cases
  getIt.registerLazySingleton<GetDashboardData>(
    () => GetDashboardData(getIt<DashboardRepository>()),
  );

  // Bloc
  getIt.registerFactory<DashboardBloc>(
    () => DashboardBloc(getDashboardData: getIt<GetDashboardData>()),
  );
}
