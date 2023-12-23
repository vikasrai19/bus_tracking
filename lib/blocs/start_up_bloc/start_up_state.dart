abstract class StartUpState {}

class StartUpIdleState extends StartUpState {}

class StartUpFirstTimeState extends StartUpState {}

class StartUpLoadedState extends StartUpState {}

class SignedInState extends StartUpState {}

class StartUpErrorState extends StartUpState {
  final String? error;

  StartUpErrorState({this.error});
}
