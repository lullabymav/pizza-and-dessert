class RegistModel {
  String firstName;
  String lastName;
  String email;
  String pass;

  RegistModel(
      this.firstName,
      this.lastName,
      this.email,
      this.pass
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'pass': pass,
  };

  // RegistModel.fromJson(Map<String, dynamic> json) {
  //   firstName = json['firstName'];
  //   lastName = json['lastName'];
  //   email = json['email'];
  //   pass = json['pass'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['firstName'] = this.firstName;
  //   data['lastName'] = this.lastName;
  //   data['email'] = this.email;
  //   data['pass'] = this.pass;
  //   return data;
  // }
}
