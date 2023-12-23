class BusBoardingPoints {
  final String? boardingTime;
  final String? boardingPointName;
  final int? busBoardingNo;

  BusBoardingPoints({
    this.boardingPointName,
    this.boardingTime,
    this.busBoardingNo,
  });

  factory BusBoardingPoints.fromJson(Map<String, dynamic> data) {
    return BusBoardingPoints(
      boardingPointName: data['BoardingPointName'],
      boardingTime: data['boardingTime'],
      busBoardingNo: data['BoardingPointNO'],
    );
  }
}

class BusDetailsModel {
  final String? busNo;
  final String? routeNo;
  final int? noOfSeats;
  final String? startingPoint;
  final List<BusBoardingPoints>? busBoardingPoints;

  BusDetailsModel({
    this.busNo,
    this.routeNo,
    this.noOfSeats,
    this.startingPoint,
    this.busBoardingPoints,
  });

  factory BusDetailsModel.fromJson(Map<String, dynamic> data) {
    final boardingPointList = data['boardingPointList'] as List;
    return BusDetailsModel(
      busNo: data['busNo'],
      routeNo: data['routeNo'],
      noOfSeats: data['noOfSeats'],
      startingPoint: data['BoardingPointName'],
      busBoardingPoints:
          boardingPointList.map((e) => BusBoardingPoints.fromJson(e)).toList(),
    );
  }
}
