import 'dart:convert';

import 'package:bus_tracking/blocs/bus_detail_bloc/bus_detail_event.dart';
import 'package:bus_tracking/blocs/bus_detail_bloc/bus_details_state.dart';
import 'package:bus_tracking/constants/server_constants.dart';
import 'package:bus_tracking/models/bus_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class BusDetailBloc extends Bloc<BusDetailsEvent, BusDetailsState> {
  BusDetailBloc() : super(BusDetailsInitialState()) {
    on<GetBusDetails>((event, emit) async {
      emit(BusDetailsLoadingState());
      try {
        http.Response response = await http.get(Uri.https(
            ServerConstants.serverUrl, 'mobile/api/users/busDetails', {
          'collegeBusId': event.collegeBusId,
        }));

        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (response.statusCode == 200) {
          BusDetailsModel busDetail = BusDetailsModel.fromJson(responseBody);
          emit(BusDetailsLoadedState(busDetail: busDetail));
        } else {
          emit(BusDetailsErrorState(message: responseBody['message']));
        }
      } catch (e) {
        emit(BusDetailsErrorState(message: e.toString()));
      }
    });
  }
}
