class ListPizzaModel {
  int? id;
  String? name;
  bool? veg;
  int? price;
  String? description;
  int? quantity;
  String? img;
  List<Sizeandcrust>? sizeandcrust;

  ListPizzaModel(
      {this.id,
        this.name,
        this.veg,
        this.price,
        this.description,
        this.quantity,
        this.img,
        this.sizeandcrust});

  ListPizzaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    veg = json['veg'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    img = json['img'];
    if (json['sizeandcrust'] != null) {
      sizeandcrust = <Sizeandcrust>[];
      json['sizeandcrust'].forEach((v) {
        sizeandcrust!.add(new Sizeandcrust.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['veg'] = this.veg;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['img'] = this.img;
    if (this.sizeandcrust != null) {
      data['sizeandcrust'] = this.sizeandcrust!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizeandcrust {
  List<MediumPan>? mediumPan;
  List<Mediumstuffedcrustcheesemax>? mediumstuffedcrustcheesemax;
  List<Mediumstuffedcrustvegkebab>? mediumstuffedcrustvegkebab;

  Sizeandcrust(
      {this.mediumPan,
        this.mediumstuffedcrustcheesemax,
        this.mediumstuffedcrustvegkebab});

  Sizeandcrust.fromJson(Map<String, dynamic> json) {
    if (json['mediumPan'] != null) {
      mediumPan = <MediumPan>[];
      json['mediumPan'].forEach((v) {
        mediumPan!.add(new MediumPan.fromJson(v));
      });
    }
    if (json['mediumstuffedcrustcheesemax'] != null) {
      mediumstuffedcrustcheesemax = <Mediumstuffedcrustcheesemax>[];
      json['mediumstuffedcrustcheesemax'].forEach((v) {
        mediumstuffedcrustcheesemax!
            .add(new Mediumstuffedcrustcheesemax.fromJson(v));
      });
    }
    if (json['mediumstuffedcrustvegkebab'] != null) {
      mediumstuffedcrustvegkebab = <Mediumstuffedcrustvegkebab>[];
      json['mediumstuffedcrustvegkebab'].forEach((v) {
        mediumstuffedcrustvegkebab!
            .add(new Mediumstuffedcrustvegkebab.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediumPan != null) {
      data['mediumPan'] = this.mediumPan!.map((v) => v.toJson()).toList();
    }
    if (this.mediumstuffedcrustcheesemax != null) {
      data['mediumstuffedcrustcheesemax'] =
          this.mediumstuffedcrustcheesemax!.map((v) => v.toJson()).toList();
    }
    if (this.mediumstuffedcrustvegkebab != null) {
      data['mediumstuffedcrustvegkebab'] =
          this.mediumstuffedcrustvegkebab!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediumPan {
  int? price;

  MediumPan({this.price});

  MediumPan.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}

class Mediumstuffedcrustcheesemax {
  int? price;

  Mediumstuffedcrustcheesemax({this.price});

  Mediumstuffedcrustcheesemax.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}

class Mediumstuffedcrustvegkebab {
  int? price;

  Mediumstuffedcrustvegkebab({this.price});

  Mediumstuffedcrustvegkebab.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}
