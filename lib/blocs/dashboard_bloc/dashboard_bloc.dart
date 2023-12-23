import 'dart:convert';

import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:bus_tracking/constants/server_constants.dart';
import 'package:bus_tracking/models/dashboard_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardIdleState()) {
    on<GetDashboardData>((event, emit) async {
      emit(DashboardLoadingState());
      try {
        http.Response response = await http.get(
          Uri.https(ServerConstants.serverUrl, 'mobile/api/users/dashboard',
              {'userId': event.userId}),
        );
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (response.statusCode == 200) {
          DashboardModel dashboard = DashboardModel.fromJson(responseBody);
          emit(DashboardLoadedState(dashboard));
        } else {
          emit(DashboardErrorState(message: responseBody['message']));
        }
      } catch (e) {
        emit(DashboardErrorState(message: e.toString()));
      }
    });
  }
}
