class UserModel {
  final String? userId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final int? age;
  final String? usn;
  final String? className;
  final String? profileImage;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.gender,
    this.age,
    this.usn,
    this.className,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'] ?? '-',
      name: data['name'] ?? '-',
      email: data['email'] ?? '-',
      phoneNumber: data['phoneNumber'] ?? '-',
      gender: data['gender'] ?? '-',
      age: data['age'] ?? 20,
      usn: data['usn'] ?? '-',
      className: data['className'] ?? '-',
      profileImage: data['profileImage'] ?? '',
    );
  }
}
