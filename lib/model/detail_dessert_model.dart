class DetailDessertModel {
  int? id;
  String? name;
  int? price;
  String? description;
  String? img;
  int? quantity;

  DetailDessertModel(
      {this.id,
        this.name,
        this.price,
        this.description,
        this.img,
        this.quantity});

  DetailDessertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    img = json['img'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    return data;
  }
}
