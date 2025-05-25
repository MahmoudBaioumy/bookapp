import 'package:bookapp/features/auth/data/repo/auth_repo.dart';
import 'package:bookapp/features/cart/data/repo/cart_repo_imple.dart';
import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:bookapp/features/profile/data/repo/profile_repo_impl.dart';
import 'package:bookapp/features/wishist/data/model/show_wishlist_model.dart';
import 'package:get_it/get_it.dart';

import '../../features/wishist/data/repo/wishlist_repo.dart';
import 'api_service/api_serves.dart';

final getit = GetIt.instance;
// -------------------------- we use this method to To prevent dependency injection -------------------------- //
void setupServeslocator() {
  getit.registerSingleton<ApiServes>(ApiServes());
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getit.get<ApiServes>()));
  getit.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getit.get<ApiServes>()));
  getit.registerSingleton<CartRepoImple>(CartRepoImple(getit.get<ApiServes>()));
  getit.registerSingleton<wishlistRepoImple>(wishlistRepoImple(getit.get<ApiServes>()));
  getit.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(getit.get<ApiServes>()),
  );
}
