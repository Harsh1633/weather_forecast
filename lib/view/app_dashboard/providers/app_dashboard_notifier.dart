
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'app_dashboard_notifier.g.dart';


@riverpod
class AppDashboardNotifier extends _$AppDashboardNotifier{


  @override
  int build() {
    return 0;
  }

  void updateIndex(int index){
    state = index;
  }
}