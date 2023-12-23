abstract class BottomNavState {}

class BottomNavStateIdle extends BottomNavState {}

class BottomNavLoadedState extends BottomNavState {
  final int? selectedIndex;

  BottomNavLoadedState({this.selectedIndex});
}
