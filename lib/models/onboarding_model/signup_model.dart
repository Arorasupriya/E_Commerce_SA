class SignUpModel {
  String? f_name;
  String? l_name;
  String? email;
  String? phone;
  String? password;

  SignUpModel({
    required this.f_name,
    required this.l_name,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
        f_name: json["f_name"],
        l_name: json["l_name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"]);
  }

  Map<String, dynamic> toJson() => {
        "f_name": f_name,
        "l_name": l_name,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
