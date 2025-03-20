import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service/api_serves.dart';

final getit = GetIt.instance;
// -------------------------- we use this method to To prevent dependency injection -------------------------- //
void setupServeslocator() {
  getit.registerSingleton<ApiServes>(ApiServes(Dio()));
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getit.get<ApiServes>()));
}
