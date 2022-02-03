import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:la_plaza/src/models/products.dart';

class ProductsProvider extends ChangeNotifier {
  final _url = Uri.parse(
      'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/');

  List<Product> listProducts = [];

  ProductsProvider() {
    //print('Products inicializados');
   // this.getProducts();
  }

  getProducts() async {
    final resp = await http.get(_url);
    if (resp.statusCode == 200) {
      final decodeResp = productsFromJson(resp.body);
      listProducts = decodeResp.data;
      notifyListeners();
    }
  }

  Future<List<Product?>?> getProductsSeach(String data) async {
    final resp = await http.get(_url);
    final decodeResp = productsFromJson(resp.body);
    if (resp.statusCode == 200) {
      if (data != "") {
        for (int i = 0; i < decodeResp.data.length; i++) {
          if (decodeResp.data[i].nombre.contains(data)) {
            listProducts.add(decodeResp.data[i]);
          }
        }
        return listProducts;
      } else {
        listProducts = decodeResp.data;
        notifyListeners();
        return listProducts;
      }
      
    } else {
      return null;
    }
  }
}
