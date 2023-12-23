import 'package:bus_tracking/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileModel? profile;

  ProfileLoadedState({this.profile});
}

class ProfileErrorState extends ProfileState {
  final String? message;

  ProfileErrorState({this.message});
}
