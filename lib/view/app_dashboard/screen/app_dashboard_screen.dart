import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/pages/page1.dart';
import 'package:weather_forecast/pages/page2.dart';
import 'package:weather_forecast/view/app_dashboard/providers/app_dashboard_notifier.dart';
import 'package:weather_forecast/view/home/screen/home_screen.dart';
import 'package:weather_forecast/view/list_display/screen/list_display_screen.dart';
import 'package:weather_forecast/view/search/screen/search_screen.dart';
import 'package:weather_forecast/widgets/app_bottom_navigation_bar/app_bottom_nav.dart';

class AppDashboardScreen extends ConsumerStatefulWidget {
  const AppDashboardScreen({super.key});

  @override
  ConsumerState<AppDashboardScreen> createState() => _AppDashboardScreenState();
}

class _AppDashboardScreenState extends ConsumerState<AppDashboardScreen> {
  late PageController pageController;
  late ProviderSubscription<int> navListener;

  @override
  void initState() {
    super.initState();

    final initialIndex = ref.read(appDashboardNotifierProvider);

    pageController = PageController(initialPage: initialIndex);

    // ✅ Correct way to listen in initState
    navListener = ref.listenManual<int>(
      appDashboardNotifierProvider,
      (previous, next) {
        if (pageController.hasClients) {
          pageController.jumpToPage(next);
        }
      },
    );
  }

  @override
  void dispose() {
    navListener.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF152334),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          ListDisplayScreen(),
          SearchScreen(),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
