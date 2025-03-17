import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Services/dio_helper/api_service.dart';

final getit = GetIt.instance;

void setupServeslocator() {
  getit.registerSingleton<ApiService>(ApiService());
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getit.get<ApiService>()));
}
