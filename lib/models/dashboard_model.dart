class DashboardModel {
  final String? busNo;
  final int? seatNo;
  final String? startingPoint;
  final String? routeNo;
  final String? driverName;
  final String? driverEmail;
  final String? driverPhoneNo;

  DashboardModel({
    required this.busNo,
    required this.seatNo,
    required this.startingPoint,
    required this.routeNo,
    required this.driverName,
    required this.driverEmail,
    required this.driverPhoneNo,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> data) {
    return DashboardModel(
      busNo: data['busNo'],
      seatNo: data['seatNo'],
      startingPoint: data['startingPoint'],
      routeNo: data['routeNo'],
      driverName: data['driverName'],
      driverEmail: data['driverEmail'],
      driverPhoneNo: data['driverMobileNo'],
    );
  }
}
