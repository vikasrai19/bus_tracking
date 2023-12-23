abstract class DashboardEvent {}

class GetDashboardData extends DashboardEvent {
  final String? userId;

  GetDashboardData({this.userId});
}
