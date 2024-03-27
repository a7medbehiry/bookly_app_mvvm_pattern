import 'package:bookly_app/Features/home/data/repositories/home_repository_implementation.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getServiceLocator = GetIt.instance;

void setupServiceLocator() {
  getServiceLocator.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getServiceLocator.registerSingleton<HomeRepositoryImplementation>(
    HomeRepositoryImplementation(
      apiService: getServiceLocator.get<ApiService>(),
    ),
  );
}
