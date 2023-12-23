import 'dart:convert';

import 'package:bus_tracking/blocs/auth_bloc/auth_event.dart';
import 'package:bus_tracking/blocs/auth_bloc/auth_state.dart';
import 'package:bus_tracking/constants/server_constants.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/widgets/custom_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SignInUserEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final Map<String, dynamic> body = {
          'email': event.email,
          'password': event.password,
        };
        http.Response data = await http.post(
          Uri.https(ServerConstants.serverUrl, 'mobile/api/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        );
        if (data.statusCode == 201) {
          showSnackbar(event.context!, 'Login Successful');
          final responseData = jsonDecode(data.body);
          HelperFunction helperInstance = HelperFunction.instance;
          helperInstance.saveIsFirstTime(false);
          helperInstance.saveUserId(responseData['userId']);
          helperInstance.saveUserName(responseData['name']);
          helperInstance.saveEmail(responseData['email']);
          helperInstance.savePhoneNumber(responseData['mobileNo']);
          helperInstance.saveCollegeBusId(responseData['collegeBusId']);
          helperInstance.saveLoggedIn(true);
          emit(AuthSuccessState());
        } else {
          showSnackbar(
            event.context!,
            'Please check your credentials',
            actionLabel: '',
          );
          emit(AuthErrorState(message: jsonDecode(data.body)['message']));
        }
      } catch (e) {
        showSnackbar(event.context!, 'Something went wrong! Please try again');
        emit(AuthErrorState(message: e.toString()));
      }
    });
  }
}
