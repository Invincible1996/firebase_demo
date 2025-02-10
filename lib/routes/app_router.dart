import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_demo/home_page.dart';
import 'package:firebase_demo/login_page.dart';
import 'package:firebase_demo/register_page.dart';
import 'package:firebase_demo/splash_page.dart';
import 'package:firebase_demo/pages/main_page.dart';
import 'package:firebase_demo/pages/user_page.dart';
import 'package:firebase_demo/pages/user_name_page.dart';
import 'package:firebase_demo/pages/shop_cart_page.dart';
import 'package:firebase_demo/pages/notification_page.dart';
import 'package:firebase_demo/pages/help_feedback_page.dart';
import 'package:firebase_demo/pages/privacy_settings_page.dart';
import 'package:firebase_demo/pages/account_settings_page.dart';
import 'package:firebase_demo/pages/about_us_page.dart';
import 'package:firebase_demo/pages/shipping_address_page.dart';
import 'package:firebase_demo/pages/add_shipping_address_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.cupertino(); // 设置默认路由类型为 Cupertino

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: '/register',
        ),
        AutoRoute(
          page: UserNameRoute.page,
          path: '/user-name',
        ),
        AutoRoute(
          page: NotificationRoute.page,
          path: '/notification',
        ),
        AutoRoute(
          page: HelpFeedbackRoute.page,
          path: '/help-feedback',
        ),
        AutoRoute(
          page: PrivacySettingsRoute.page,
          path: '/privacy-settings',
        ),
        AutoRoute(
          page: AccountSettingsRoute.page,
          path: '/account-settings',
        ),
        AutoRoute(
          page: AboutUsRoute.page,
          path: '/about-us',
        ),
        AutoRoute(
          page: ShippingAddressRoute.page,
          path: '/shipping-address',
        ),
        AutoRoute(
          page: AddShippingAddressRoute.page,
          path: '/add-shipping-address',
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home'),
            AutoRoute(page: UserRoute.page, path: 'user'),
            AutoRoute(page: ShopCartRoute.page, path: 'cart'),
          ],
        ),
      ];
}
