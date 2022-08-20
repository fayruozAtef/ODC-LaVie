
/// plantId : "f985a224-ee41-411e-9327-dfb9822544ab"
/// name : "Cherokee Rose"
/// description : "This spring bloomer"
/// imageUrl : "/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png"
/// waterCapacity : 415
/// sunLight : 325
/// temperature : 512

class Plant {
  Plant({
    String? plantId,
    String? name,
    String? description,
    String? imageUrl,
    num? waterCapacity,
    num? sunLight,
    num? temperature,}){
    _plantId = plantId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _waterCapacity = waterCapacity;
    _sunLight = sunLight;
    _temperature = temperature;
  }

  Plant.fromJson(dynamic json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }
  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  num? _waterCapacity;
  num? _sunLight;
  num? _temperature;
  Plant copyWith({  String? plantId,
    String? name,
    String? description,
    String? imageUrl,
    num? waterCapacity,
    num? sunLight,
    num? temperature,
  }) => Plant(  plantId: plantId ?? _plantId,
    name: name ?? _name,
    description: description ?? _description,
    imageUrl: imageUrl ?? _imageUrl,
    waterCapacity: waterCapacity ?? _waterCapacity,
    sunLight: sunLight ?? _sunLight,
    temperature: temperature ?? _temperature,
  );
  String? get plantId => _plantId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  num? get waterCapacity => _waterCapacity;
  num? get sunLight => _sunLight;
  num? get temperature => _temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantId'] = _plantId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['waterCapacity'] = _waterCapacity;
    map['sunLight'] = _sunLight;
    map['temperature'] = _temperature;
    return map;
  }

}