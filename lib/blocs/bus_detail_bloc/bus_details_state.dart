import 'package:bus_tracking/models/bus_details_model.dart';

abstract class BusDetailsState {}

class BusDetailsInitialState extends BusDetailsState {}

class BusDetailsLoadingState extends BusDetailsState {}

class BusDetailsLoadedState extends BusDetailsState {
  final BusDetailsModel? busDetail;

  BusDetailsLoadedState({this.busDetail});
}

class BusDetailsErrorState extends BusDetailsState {
  final String? message;

  BusDetailsErrorState({this.message});
}
