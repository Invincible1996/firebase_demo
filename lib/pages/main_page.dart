import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/app_router.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ShopCartRoute(),
        UserRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            backgroundColor: const Color(0xFFB52C20),
            indicatorColor: Colors.white.withOpacity(0.2),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.white70),
                selectedIcon: Icon(Icons.home, color: Colors.white),
                label: '首页',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white70),
                selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
                label: '购物车',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: Colors.white70),
                selectedIcon: Icon(Icons.person, color: Colors.white),
                label: '我的',
              ),
            ],
          ),
        );
      },
      animatePageTransition: false,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
