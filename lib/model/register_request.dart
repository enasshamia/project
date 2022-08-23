class RegisterRequest {
  String id;
  String email;
  String password;
  String userName;
  String phoneNumber;
  String address;
  String width;
  String height;

  RegisterRequest({
    this.id,
    this.email,
    this.password,
    this.userName,
    this.phoneNumber,
    this.address,
    this.height,
    this.width
  });

  toMap() {
    return {
      'id': id,
      'email': email,
      'mobileNumber': phoneNumber,
      'userName': userName,
      'address': address,
      "width" :width ,
      "height":height
    };
  }
}
