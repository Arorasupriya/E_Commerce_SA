/*class AddToCartModel {
  int? status;
  String? message;

  AddToCartModel({required this.status, required this.message});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(status: json["status"], message: json["message"]);
  }
}*/

class AddToCartModel {
  int? status;
  String? message;

  AddToCartModel({
    this.status,
    this.message,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
