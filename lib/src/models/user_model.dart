// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Usuario userFromJson(String str) => Usuario.fromJson(json.decode(str));

String userToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        required this.correo,
        required this.id,
        required this.name,
        required this.phone
    });
    String correo;
    String id;
    String name;
    String phone;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        correo: json["user_email"],
        id: json["user_id"],
        name: json["user_name"],
        phone: json["user_phone"]
    );

    Map<String, dynamic> toJson() => {
        "user_email": correo,
        "user_id": id,
        "user_name": name,
        "user_phone": phone
    };
}