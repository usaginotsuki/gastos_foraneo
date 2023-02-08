// To parse this JSON data, do
//
//     final usuarioGastos = usuarioGastosFromJson(jsonString);

import 'dart:convert';

UsuarioGastos usuarioGastosFromJson(String str) => UsuarioGastos.fromJson(json.decode(str));

String usuarioGastosToJson(UsuarioGastos data) => json.encode(data.toJson());

class UsuarioGastos {
    UsuarioGastos({
        required this.cleaningAmount,
        required this.foodAmount,
        required this.studyAmount,
        required this.totalAmount,
        required this.transportAmount,
        required this.variousAmount
    });

    int cleaningAmount;
    int foodAmount;
    int studyAmount;
    int totalAmount;
    int transportAmount;
    int variousAmount;


    factory UsuarioGastos.fromJson(Map<String, dynamic> json) => UsuarioGastos(
        cleaningAmount: json["user_cleaningAmount"],
        foodAmount: json["user_foodAmount"],
        studyAmount: json["user_studyAmount"],
        totalAmount: json["user_totalAmount"],
        transportAmount: json["user_transportAmount"],
        variousAmount: json["user_variousAmount"]

    );

    Map<String, dynamic> toJson() => {
        "user_cleaningAmount": cleaningAmount,
        "user_foodAmount": foodAmount,
        "user_studyAmount": studyAmount,
        "user_totalAmount": totalAmount,
        "user_transportAmount": transportAmount,
        "user_variousAmount": variousAmount
    };
}