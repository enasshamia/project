class AppUser {
  String id;

  String address;
  String userName;
  String email;
  String password;
  String mobileNumber;
  String width;
  String height;

  AppUser(
      {this.email,
      this.userName,
      this.mobileNumber,
      this.password,
      this.id,
      this.width,
      this.height});

  AppUser.fromMap(Map map) {
    id = map['id'] ?? '';
    email = map['email'];
    userName = map['userName'];
    password = map['password'] ?? '';
    mobileNumber = map['mobileNumber'];
    address = map['address'];
    height = map["height"];
    width = map['width'];
  }

  // ignore: missing_return

  toMap() {
    return {
      'id': id,
      'email': email,
      'mobileNumber': mobileNumber,
      'userName': userName,
      'address': address,
      "width" :width ,
      "height" :height
    };
  }
}
