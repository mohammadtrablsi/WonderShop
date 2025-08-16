import 'package:wonder_shop/Features/categories/presention/views/categoriesView.dart';
import 'package:go_router/go_router.dart';
import 'package:wonder_shop/Features/productDetails/presention/views/productDetailsView.dart';

import '../../Features/Splash/presentation/views/splashView.dart';
import '../../Features/onBoarding/presention/views/onBoarding.dart';
import '../../Features/products/presention/views/productsView.dart';

abstract class AppRouter {
  static const kBookDetailsView = '/bookDetailsView';
  static const kLogin = '/loginView';
  static const kOnBoardingView = '/onBoarding';
  static const kCategoriesView = '/categoriesView';
  static const kProductsView = '/productsView';
  static const kProductDetailsView = '/productDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: kProductsView,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '$kProductDetailsView/:id/:tag',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final tag = state.pathParameters['tag']!;
          return ProductDetailsView(productId: int.parse(id), tag: tag,);
        },
      ),
    ],
  );
}
