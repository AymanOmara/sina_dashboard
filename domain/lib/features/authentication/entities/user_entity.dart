class UserEntity {
  final int userId;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final String userPhoto;

  const UserEntity({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    required this.userPhoto,
  });


  Map<String, dynamic> toJson() {
    return {
      "UserId": userId,
      "UserName": userName,
      "UserEmail": userEmail,
      "UserPassword": userPassword,
      "UserPhone": userPhone,
      "UserPhoto": userPhoto,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['UserId'] ?? '',
      userName: json['UserName'] ?? '',
      userEmail: json['UserEmail'] ?? '',
      userPassword: json['UserPassword'] ?? '',
      userPhone: json['UserPhone'] ?? '',
      userPhoto: json['UserPhoto'] ?? '',
    );
  }
}
