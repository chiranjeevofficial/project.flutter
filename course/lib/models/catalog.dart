class CatalogModel {
  static List<Item> items = [];
}

class Item {
  late final String name, desc, color, img;
  late final num price;
  late final int id;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.img,
      required this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      color: map["color"],
      img: map["img"],
      price: map["price"]
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "color": color,
    "img": img,
    "price": price,
  };
}
