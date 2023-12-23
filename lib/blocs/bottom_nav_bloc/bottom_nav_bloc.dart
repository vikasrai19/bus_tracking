import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavStateIdle()) {
    // Change bottom nav bar
    on<ChangeBottomNavEvent>((event, emit) {
      emit(BottomNavLoadedState(selectedIndex: event.selectedIndex));
    });
  }
}
