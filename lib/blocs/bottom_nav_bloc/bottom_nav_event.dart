abstract class BottomNavEvent {}

class ChangeBottomNavEvent extends BottomNavEvent {
  final int? selectedIndex;

  ChangeBottomNavEvent({this.selectedIndex});
}
