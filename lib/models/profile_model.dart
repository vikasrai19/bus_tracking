class ProfileModel {
  final String? name;
  final String? userId;
  final String? email;
  final String? phoneNo;
  final int? seatNo;
  final String? boardingPoint;
  final String? boardingTime;
  final String? busNo;

  ProfileModel({
    this.name,
    this.userId,
    this.email,
    this.phoneNo,
    this.seatNo,
    this.boardingPoint,
    this.boardingTime,
    this.busNo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> data) {
    return ProfileModel(
      name: data['name'],
      userId: data['userId'],
      email: data['email'],
      phoneNo: data['phoneNo'],
      seatNo: data['seatNo'],
      boardingPoint: data['boardingPoint'],
      boardingTime: data['boardingTime'],
      busNo: '-',
    );
  }
}
