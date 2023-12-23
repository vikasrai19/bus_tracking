import 'package:bus_tracking/blocs/start_up_bloc/start_up_event.dart';
import 'package:bus_tracking/blocs/start_up_bloc/start_up_state.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpBloc extends Bloc<StartUpevent, StartUpState> {
  StartUpBloc() : super(StartUpIdleState()) {
    on<StartUpAuthEvent>((event, emit) {
      HelperFunction instance = HelperFunction.instance;
      bool isFirstTime = instance.getIsFirstTime();
      if (isFirstTime) {
        emit(StartUpFirstTimeState());
      } else {
        bool isLoggedIn = instance.getIsLoggedIn();
        if (isLoggedIn) {
          emit(SignedInState());
        } else {
          emit(StartUpLoadedState());
        }
      }
    });
  }
}
