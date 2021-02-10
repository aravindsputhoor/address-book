// To parse this JSON data, do
//
//     final addressList = addressListFromJson(jsonString);

import 'dart:convert';

AddressList addressListFromJson(String str) =>
    AddressList.fromJson(json.decode(str));

String addressListToJson(AddressList data) => json.encode(data.toJson());

class AddressList {
  AddressList({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.email,
    this.address,
    this.status,
  });

  String id;
  String name;
  String email;
  String address;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "status": status,
      };
}
