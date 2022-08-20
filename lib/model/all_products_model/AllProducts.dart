import '../product_model/Data.dart';

/// type : "Success"
/// message : "Product Fetched Successfully"
/// data : [{"productId":"1b0f2343-0270-4d3d-ba83-2a772e115dc9","name":"Glory","description":"Arizona achieved statehood","imageUrl":"/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg","type":"PLANT","price":800,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null},{"productId":"42edbb62-b102-451b-aa6a-2171ffbf7c62","name":"Over the Moon","description":"This spring bloomer","imageUrl":"/uploads/42edbb62-b102-451b-aa6a-2171ffbf7c62.jpg","type":"PLANT","price":1250,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null},{"productId":"4889ff96-293b-41c3-bf0e-2aab734fbbbf","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/4889ff96-293b-41c3-bf0e-2aab734fbbbf.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"65b57cf3-ad30-43b1-9b08-aecc1f5dd08c","name":"axe","description":"WilFiks Chopping Axe","imageUrl":"/uploads/65b57cf3-ad30-43b1-9b08-aecc1f5dd08c.jpg","type":"TOOL","price":400,"available":true,"seed":null,"plant":null,"tool":{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}},{"productId":"7fbea829-9b1b-4641-ba71-63a8cb85746e","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/7fbea829-9b1b-4641-ba71-63a8cb85746e.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"8d6725d5-b587-4772-90fa-ff3a5ece6c23","name":"Tropical Scents","description":"Arizona achieved statehood","imageUrl":"/uploads/8d6725d5-b587-4772-90fa-ff3a5ece6c23.jpg","type":"PLANT","price":925,"available":true,"seed":null,"plant":{"plantId":"09512240-30c7-422b-91a2-5110d33c0f1f","name":"American Marigold","description":"American Marigold plants","imageUrl":"","waterCapacity":2,"sunLight":7,"temperature":6},"tool":null},{"productId":"949c57d2-a540-4b27-8955-71ce92247b23","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/949c57d2-a540-4b27-8955-71ce92247b23.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"cdd64aad-6817-4d17-b6ad-271e77ec806d","name":"axe","description":"WilFiks Chopping Axe","imageUrl":"/uploads/cdd64aad-6817-4d17-b6ad-271e77ec806d.jpg","type":"TOOL","price":400,"available":true,"seed":null,"plant":null,"tool":{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}},{"productId":"cf306aa6-a266-4e68-9b54-58656aeb964a","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/cf306aa6-a266-4e68-9b54-58656aeb964a.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"f148e494-54f2-4a8d-868f-8f0f4ed81916","name":"Over the Moon","description":"This spring bloomer","imageUrl":"/uploads/f148e494-54f2-4a8d-868f-8f0f4ed81916.jpg","type":"PLANT","price":1250,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null}]

class AllProducts {
  AllProducts({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  AllProducts.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _type;
  String? _message;
  List<Data>? _data;
AllProducts copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => AllProducts(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

