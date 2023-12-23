import 'dart:convert';

import 'package:bus_tracking/blocs/profile_bloc/profile_event.dart';
import 'package:bus_tracking/blocs/profile_bloc/profile_state.dart';
import 'package:bus_tracking/constants/server_constants.dart';
import 'package:bus_tracking/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<GetProfileData>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        http.Response response = await http.get(
          Uri.https(
            ServerConstants.serverUrl,
            'mobile/api/users/profile',
            {'userId': event.userId!},
          ),
        );

        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (response.statusCode == 200) {
          ProfileModel profile = ProfileModel.fromJson(responseBody);
          emit(ProfileLoadedState(profile: profile));
        } else {
          emit(ProfileErrorState(message: responseBody['message']));
        }
      } catch (e) {
        emit(ProfileErrorState(message: e.toString()));
      }
    });
  }
}
