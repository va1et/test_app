import 'package:auto_route/auto_route.dart';
import 'package:test_app_effective/presentation/routes/app_routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/rooms',
          page: RoomsRoute.page,
        ),
        AutoRoute(
          path: '/book',
          page: BookRoute.page,
        ),
        AutoRoute(
          path: '/order',
          page: OrderRoute.page,
        ),
      ];
}
