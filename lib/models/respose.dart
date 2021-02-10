// To parse this JSON data, do
//
//     final resposeData = resposeDataFromJson(jsonString);

import 'dart:convert';

ResposeData resposeDataFromJson(String str) =>
    ResposeData.fromJson(json.decode(str));

String resposeDataToJson(ResposeData data) => json.encode(data.toJson());

class ResposeData {
  ResposeData({
    this.status,
    this.msg,
  });

  String status;
  String msg;

  factory ResposeData.fromJson(Map<String, dynamic> json) => ResposeData(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
