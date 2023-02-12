// To parse this JSON data, do
//
//     final usuarioGastos = usuarioGastosFromJson(jsonString);

import 'dart:convert';

UsuarioGastos usuarioGastosFromJson(String str) =>
    UsuarioGastos.fromJson(json.decode(str));

String usuarioGastosToJson(UsuarioGastos data) => json.encode(data.toJson());

class UsuarioGastos {
  UsuarioGastos(
      {required this.cleaningAmount,
      required this.foodAmount,
      required this.idexp,
      required this.studyAmount,
      required this.totalAmount,
      required this.transportAmount,
      required this.variousAmount});

  num cleaningAmount = 0;
  num foodAmount = 0;
  String idexp;
  num studyAmount = 0;
  num totalAmount = 0;
  num transportAmount = 0;
  num variousAmount = 0;

  factory UsuarioGastos.fromJson(Map<String, dynamic> json) => UsuarioGastos(
      cleaningAmount: json["user_cleaningAmount"],
      foodAmount: json["user_foodAmount"],
      idexp: json["user_idexp"],
      studyAmount: json["user_studyAmount"],
      totalAmount: json["user_totalAmount"],
      transportAmount: json["user_transportAmount"],
      variousAmount: json["user_variousAmount"]);

  Map<String, dynamic> toJson() => {
        "user_cleaningAmount": cleaningAmount,
        "user_foodAmount": foodAmount,
        "user_idexp": idexp,
        "user_studyAmount": studyAmount,
        "user_totalAmount": totalAmount,
        "user_transportAmount": transportAmount,
        "user_variousAmount": variousAmount
      };
}
