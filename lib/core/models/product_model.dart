class ProductModel {
  ProductModel({this.userId, this.id, this.title, this.completed, this.qty});

  int? userId;
  int? id;
  String? title;
  bool? completed;
  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
      qty: 0);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
