import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{

  String city;
  String area;
  String street;
  String buildingName;
  String landmark;
  DataModel({
    required this.city,
    required this.area,
    required this.street,
    required this.buildingName,
    required this.landmark
  });

  factory DataModel.fromJson(Map<String,dynamic> json) => DataModel(city: json["city"], area: json["area"], street: json["street"], buildingName: json["buildingName"], landmark: json["landmark"]);

  Map<String, dynamic> toJson() =>{
    "city": city,
    "area": area,
    "street":street,
    "buildingName":buildingName,
    "landmark":landmark
  };
  

  
}