import 'package:wonder_shop/Features/home/presentation/views/book_details_view.dart';
import 'package:wonder_shop/Features/home/presentation/views/home_view.dart';
import 'package:wonder_shop/Features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splashView.dart';
import '../../Features/login/presentation/views/login_view.dart';
import '../../Features/onBoarding/presention/views/onBoarding.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLogin = '/loginView';
  static const kOnBoardingView = '/onBoarding';

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
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
