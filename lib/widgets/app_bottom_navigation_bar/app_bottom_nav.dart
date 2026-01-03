import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/view/app_dashboard/providers/app_dashboard_notifier.dart';

class AppBottomNav extends ConsumerStatefulWidget {
  const AppBottomNav({super.key});

  @override
  ConsumerState<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends ConsumerState<AppBottomNav> {


  final List<IconData> _tabsIcon = [
    Icons.home,
    Icons.search,
    Icons.list,
    Icons.settings
  ];
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(appDashboardNotifierProvider);
    final notifier = ref.read(appDashboardNotifierProvider.notifier);


    return Stack(
      children: [
        // Background gradient
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryBlue, Colors.grey[900]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border(
                    top: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignInside,
                        color: Colors.white.withOpacity(0.2)))),
          ),
        ),
        // Bottom Navigation Bar
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCubic,
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: notifier.updateIndex,
              currentIndex: selectedIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: List.generate(_tabsIcon.length, (index) {
                final isActive = index == selectedIndex;
                return BottomNavigationBarItem(
                  label: '',
                  icon: isActive
                      ? _buildActiveTab( _tabsIcon[index], index)
                      : _buildInactiveTab( _tabsIcon[index], index),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildInactiveTab(IconData imageName, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 28.04,
            padding: const EdgeInsets.only(left: 1.52, right: 0.81, bottom: 2),
            child: Icon(imageName,size: 20,color: Colors.grey,),
          ),
        ],
      ),
    );
  }

  /// Builds the active tab UI
  Widget _buildActiveTab( IconData imageName, int itemIndex) {
    return Container(
      margin: EdgeInsets.only(left: itemIndex == 0 ? 8 : 0 ,right: itemIndex == _tabsIcon.length -1 ? 5 : 0),
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        // color: const Color(0xFF111C2C),
        gradient: LinearGradient(
          colors: [
            AppColors.boxShadow,AppColors.blueBorder,
          ]
        ),

        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.blueBorder),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width:,
              padding: const EdgeInsets.only(left: 1.52, right: 0.81, bottom: 2),
              child:  Icon(imageName,size: 28,color: AppColors.gold,),
            ),
          ],
        ),
      ),
    );
  }
}

