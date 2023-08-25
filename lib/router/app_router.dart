import 'package:go_router/go_router.dart';
import 'package:wts_test_app/router/app_pages.dart';
import 'package:wts_test_app/screens/catalog_screen.dart';
import 'package:wts_test_app/screens/products_screen.dart';

class AppRouter {
  AppRouter();

  GoRouter get goRouter => _goRouter;

  late final GoRouter _goRouter = GoRouter(routes: [
    GoRoute(
      path: AppPages.catalog.toPath,
      builder: (context, state) => const CatalogScreen(),
    ),
    GoRoute(
      path: "${AppPages.products.toPath}/:id",
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductsScreen(catalogId: int.parse(id));
      },
    )
  ]);
}
