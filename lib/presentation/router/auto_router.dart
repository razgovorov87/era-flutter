import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'auto_router.gr.dart';

@Singleton(scope: 'base')
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AdaptiveRoute(
          path: '/',
          page: HomeRoute.page,
        ),
        AdaptiveRoute(
          path: '/article',
          page: ArticleRoute.page,
        ),
      ];
}
