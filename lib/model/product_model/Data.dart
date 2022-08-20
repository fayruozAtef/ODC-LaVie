
import 'package:lavei/model/product_model/plant.dart';

/// productId : "1b0f2343-0270-4d3d-ba83-2a772e115dc9"
/// name : "Glory"
/// description : "Arizona achieved statehood"
/// imageUrl : "/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg"
/// type : "PLANT"
/// price : 800
/// available : true
/// seed : null
/// plant : {"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512}
/// tool : null

class Data {
  Data({
    String? productId,
    String? name,
    String? description,
    String? imageUrl,
    String? type,
    num? price,
    bool? available,
    dynamic seed,
    Plant? plant,
    dynamic tool,}){
    _productId = productId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _type = type;
    _price = price;
    _available = available;
    _seed = seed;
    _plant = plant;
    _tool = tool;
  }

  Data.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _type = json['type'];
    _price = json['price'];
    _available = json['available'];
    _seed = json['seed'];
    _plant = json['plant'] != null ? Plant.fromJson(json['plant']) : null;
    _tool = json['tool'];
  }
  String? _productId;
  String? _name;
  String? _description;
  String? _imageUrl;
  String? _type;
  num? _price;
  bool? _available;
  dynamic _seed;
  Plant? _plant;
  dynamic _tool;
  Data copyWith({  String? productId,
    String? name,
    String? description,
    String? imageUrl,
    String? type,
    num? price,
    bool? available,
    dynamic seed,
    Plant? plant,
    dynamic tool,
  }) => Data(  productId: productId ?? _productId,
    name: name ?? _name,
    description: description ?? _description,
    imageUrl: imageUrl ?? _imageUrl,
    type: type ?? _type,
    price: price ?? _price,
    available: available ?? _available,
    seed: seed ?? _seed,
    plant: plant ?? _plant,
    tool: tool ?? _tool,
  );
  String? get productId => _productId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  String? get type => _type;
  num? get price => _price;
  bool? get available => _available;
  dynamic get seed => _seed;
  Plant? get plant => _plant;
  dynamic get tool => _tool;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['type'] = _type;
    map['price'] = _price;
    map['available'] = _available;
    map['seed'] = _seed;
    if (_plant != null) {
      map['plant'] = _plant?.toJson();
    }
    map['tool'] = _tool;
    return map;
  }

}