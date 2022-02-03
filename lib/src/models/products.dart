// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Products({
        required this.code,
        required this.data,
    });

    String code;
    List<Product> data;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        code: json["code"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.categoria,
        required this.cliente,
        required this.colores,
        required this.descripcion,
        required this.disponible,
        required this.estado,
        required this.fechaCreacion,
        required this.id,
        required this.nombre,
        required this.precio,
        required this.tallas,
        required this.video,
        required this.descripcionPromo,
        required this.idPromocion,
        required this.valorPromo,
        required this.idProductoPromo,
        required this.fechaPromo,
        required this.estadoPromo,
        required this.likes,
        required this.megusta,
        required this.galeria,
        required this.imagen,
    });

    String categoria;
    String cliente;
    String colores;
    String descripcion;
    String disponible;
    String estado;
    DateTime fechaCreacion;
    String id;
    String nombre;
    String precio;
    String tallas;
    String video;
    String descripcionPromo;
    String idPromocion;
    String valorPromo;
    String idProductoPromo;
    DateTime fechaPromo;
    String estadoPromo;
    String likes;
    String megusta;
    String galeria;
    String imagen;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoria: json["categoria"],
        cliente: json["cliente"],
        colores: json["colores"],
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        estado: json["estado"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        tallas: json["tallas"],
        video: json["video"],
        descripcionPromo: json["descripcion_promo"],
        idPromocion: json["id_promocion"],
        valorPromo: json["valor_promo"],
        idProductoPromo: json["id_producto_promo"],
        fechaPromo: DateTime.parse(json["fecha_promo"]),
        estadoPromo: json["estado_promo"],
        likes: json["likes"],
        megusta: json["megusta"],
        galeria: json["galeria"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria,
        "cliente": cliente,
        "colores": colores,
        "descripcion": descripcion,
        "disponible": disponible,
        "estado": estado,
        "fecha_creacion": "${fechaCreacion.year.toString().padLeft(4, '0')}-${fechaCreacion.month.toString().padLeft(2, '0')}-${fechaCreacion.day.toString().padLeft(2, '0')}",
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "tallas": tallas,
        "video": video,
        "descripcion_promo": descripcionPromo,
        "id_promocion": idPromocion,
        "valor_promo": valorPromo,
        "id_producto_promo": idProductoPromo,
        "fecha_promo": fechaPromo.toIso8601String(),
        "estado_promo": estadoPromo,
        "likes": likes,
        "megusta": megusta,
        "galeria": galeria,
        "imagen": imagen,
    };
}

