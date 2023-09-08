// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:test_app_effective/domain/models/hotel.dart' as _i7;
import 'package:test_app_effective/presentation/pages/book_page.dart' as _i1;
import 'package:test_app_effective/presentation/pages/home_page.dart' as _i2;
import 'package:test_app_effective/presentation/pages/order_page.dart' as _i3;
import 'package:test_app_effective/presentation/pages/room_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BookRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OrderPage(),
      );
    },
    RoomsRoute.name: (routeData) {
      final args = routeData.argsAs<RoomsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RoomsPage(
          key: args.key,
          hotel: args.hotel,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BookPage]
class BookRoute extends _i5.PageRouteInfo<void> {
  const BookRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BookRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OrderPage]
class OrderRoute extends _i5.PageRouteInfo<void> {
  const OrderRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RoomsPage]
class RoomsRoute extends _i5.PageRouteInfo<RoomsRouteArgs> {
  RoomsRoute({
    _i6.Key? key,
    required _i7.Hotel hotel,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          RoomsRoute.name,
          args: RoomsRouteArgs(
            key: key,
            hotel: hotel,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomsRoute';

  static const _i5.PageInfo<RoomsRouteArgs> page =
      _i5.PageInfo<RoomsRouteArgs>(name);
}

class RoomsRouteArgs {
  const RoomsRouteArgs({
    this.key,
    required this.hotel,
  });

  final _i6.Key? key;

  final _i7.Hotel hotel;

  @override
  String toString() {
    return 'RoomsRouteArgs{key: $key, hotel: $hotel}';
  }
}
