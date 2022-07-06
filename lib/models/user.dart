enum UserAccountTypes { regular, courier, owner }

po() {
  // UserModel u = UserModel();
  // u.email;
  // u.firstname;
}

class UserModelField {
  static String email = "email";
  static String id = "id";
  static String lastname = "last_name";
  static String firstname = "first_name";
  static String location = "location";
  static String phone = "phone";
  static String photo = "photo";
  static String secondaryPhone = "secondary_phone";
  static String kudelStaff = "kudel_staff";
  static String accountType = "account_type";
}

class UserModel {
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String phone;
  final String? secondaryPhone;
  final String? photo;
  final String? location;
  final bool kudelStaff;
  final UserAccountTypes accountType;

  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phone,
    this.secondaryPhone,
    this.photo,
    required this.kudelStaff,
    required this.accountType,
    this.location,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    UserAccountTypes toUserAccountTypes(String userType) {
      switch (userType.toLowerCase()) {
        case "courier":
          return UserAccountTypes.courier;
        case "owner":
          return UserAccountTypes.owner;
        default:
          return UserAccountTypes.regular;
      }
    }

    return UserModel(
      id: json[UserModelField.id],
      email: json[UserModelField.email],
      firstname: json[UserModelField.firstname],
      lastname: json[UserModelField.lastname],
      phone: json[UserModelField.phone],
      secondaryPhone: json[UserModelField.secondaryPhone],
      photo: json[UserModelField.photo],
      location: json[UserModelField.location],
      kudelStaff: json[UserModelField.kudelStaff],
      accountType: toUserAccountTypes(json[UserModelField.accountType]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      UserModelField.id: id,
      UserModelField.email: email,
      UserModelField.firstname: firstname,
      UserModelField.lastname: lastname,
      UserModelField.location: location,
      UserModelField.phone: phone,
      UserModelField.photo: photo,
      UserModelField.secondaryPhone: secondaryPhone,
      UserModelField.kudelStaff: kudelStaff,
      UserModelField.accountType: accountType.name,
    };
  }
}

// class AppUser
