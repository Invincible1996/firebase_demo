// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutUsPage(),
      );
    },
    AccountSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountSettingsPage(),
      );
    },
    AddShippingAddressRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<AddShippingAddressRouteArgs>(
          orElse: () => AddShippingAddressRouteArgs(
                name: queryParams.optString('name'),
                phone: queryParams.optString('phone'),
                address: queryParams.optString('address'),
                isDefault: queryParams.optString('isDefault'),
                editIndex: queryParams.optString('editIndex'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddShippingAddressPage(
          key: args.key,
          name: args.name,
          phone: args.phone,
          address: args.address,
          isDefault: args.isDefault,
          editIndex: args.editIndex,
        ),
      );
    },
    HelpFeedbackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpFeedbackPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    PrivacySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacySettingsPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ShippingAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShippingAddressPage(),
      );
    },
    ShopCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShopCartPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UserNameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserNamePage(),
      );
    },
    UserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserPage(),
      );
    },
  };
}

/// generated route for
/// [AboutUsPage]
class AboutUsRoute extends PageRouteInfo<void> {
  const AboutUsRoute({List<PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountSettingsPage]
class AccountSettingsRoute extends PageRouteInfo<void> {
  const AccountSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AccountSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddShippingAddressPage]
class AddShippingAddressRoute
    extends PageRouteInfo<AddShippingAddressRouteArgs> {
  AddShippingAddressRoute({
    Key? key,
    String? name,
    String? phone,
    String? address,
    String? isDefault,
    String? editIndex,
    List<PageRouteInfo>? children,
  }) : super(
          AddShippingAddressRoute.name,
          args: AddShippingAddressRouteArgs(
            key: key,
            name: name,
            phone: phone,
            address: address,
            isDefault: isDefault,
            editIndex: editIndex,
          ),
          rawQueryParams: {
            'name': name,
            'phone': phone,
            'address': address,
            'isDefault': isDefault,
            'editIndex': editIndex,
          },
          initialChildren: children,
        );

  static const String name = 'AddShippingAddressRoute';

  static const PageInfo<AddShippingAddressRouteArgs> page =
      PageInfo<AddShippingAddressRouteArgs>(name);
}

class AddShippingAddressRouteArgs {
  const AddShippingAddressRouteArgs({
    this.key,
    this.name,
    this.phone,
    this.address,
    this.isDefault,
    this.editIndex,
  });

  final Key? key;

  final String? name;

  final String? phone;

  final String? address;

  final String? isDefault;

  final String? editIndex;

  @override
  String toString() {
    return 'AddShippingAddressRouteArgs{key: $key, name: $name, phone: $phone, address: $address, isDefault: $isDefault, editIndex: $editIndex}';
  }
}

/// generated route for
/// [HelpFeedbackPage]
class HelpFeedbackRoute extends PageRouteInfo<void> {
  const HelpFeedbackRoute({List<PageRouteInfo>? children})
      : super(
          HelpFeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpFeedbackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacySettingsPage]
class PrivacySettingsRoute extends PageRouteInfo<void> {
  const PrivacySettingsRoute({List<PageRouteInfo>? children})
      : super(
          PrivacySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShippingAddressPage]
class ShippingAddressRoute extends PageRouteInfo<void> {
  const ShippingAddressRoute({List<PageRouteInfo>? children})
      : super(
          ShippingAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShippingAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShopCartPage]
class ShopCartRoute extends PageRouteInfo<void> {
  const ShopCartRoute({List<PageRouteInfo>? children})
      : super(
          ShopCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShopCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserNamePage]
class UserNameRoute extends PageRouteInfo<void> {
  const UserNameRoute({List<PageRouteInfo>? children})
      : super(
          UserNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserNameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
