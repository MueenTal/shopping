class Item {
  int _id;
  String _name;
  double _price;

  Item(dynamic obj) {
    _id = obj['id'];
    _name = obj['name'];
    _price = obj['price'];
  }
  Item.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _name = data['name'];
    _price = data['price'];
  }
  Map<String, dynamic> toMap() => {'id': _id, 'name': _name, 'price': _price};
  int get id => _id;
  String get name => _name;
  double get price => _price;
}
