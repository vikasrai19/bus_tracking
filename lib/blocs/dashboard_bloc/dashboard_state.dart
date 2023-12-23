import 'package:bus_tracking/models/dashboard_model.dart';

abstract class DashboardState {}

class DashboardIdleState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardErrorState extends DashboardState {
  final String? message;

  DashboardErrorState({this.message});
}

class DashboardLoadedState extends DashboardState {
  final DashboardModel dashboard;

  DashboardLoadedState(this.dashboard);
}
