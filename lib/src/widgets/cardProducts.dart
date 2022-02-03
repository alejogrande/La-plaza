import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:la_plaza/src/models/products.dart';

import 'imageCard.dart';

class CardProducts extends StatelessWidget {
  final Product? product;
  CardProducts({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "details", arguments: product);
      },
      child: Card(
        //color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageCard(product: product),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.nombre,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 17),
                  ),
                  Text(
                    price(double.parse(product!.precio)),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    price(double.parse(product!.precio) *
                        (1 - (double.parse(product!.valorPromo) / 100))),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.grey,
                  ),
                  const Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  
}
String price(double precio) {
    NumberFormat f = NumberFormat("#,##0.00", "es_US");
    String result = f.format(precio);
    return "\$" + result + " COP";
  }
