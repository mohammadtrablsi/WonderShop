import 'package:wonder_shop/Features/categories/presention/views/categoriesView.dart';
import 'package:wonder_shop/Features/home/presentation/views/home_view.dart';
import 'package:wonder_shop/Features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splashView.dart';
import '../../Features/onBoarding/presention/views/onBoarding.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLogin = '/loginView';
  static const kOnBoardingView = '/onBoarding';
  static const kCategoriesView = '/categoriesView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/kkkk',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
