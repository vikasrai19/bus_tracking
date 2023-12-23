abstract class ProfileEvent {}

class GetProfileData extends ProfileEvent {
  final String? userId;

  GetProfileData({this.userId});
}
