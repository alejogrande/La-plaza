import 'package:flutter/material.dart';

import 'package:la_plaza/src/models/products.dart';
import 'package:la_plaza/src/widgets/cardProducts.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: Text(
          product.nombre,
          style: const TextStyle(color: Colors.black54),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: _body(product),
    );
  }

  Widget _body(Product product) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 145,
              width: 145,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(product.imagen), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Hero(
            tag: product.id,
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(product.imagen), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 7,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                product.nombre,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(product.descripcion),
                          Text(
                            price(double.parse(product.precio)),
                            //textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            price(double.parse(product.precio) *
                                (1 - (double.parse(product.valorPromo) / 100))),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Card(
                            elevation: 4,
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count > 0) {
                                          count--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    icon: const Icon(Icons.keyboard_arrow_up),
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    textStyle: const TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.bold)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.shopping_basket_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Añadir al carrito",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      )),
                      ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Descripcion"),
                          ],
                        ),
                        // subtitle: Text('Trailing expansion arrow icon'),
                        children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(product.descripcion),
                           ),
                              
                              
                          // ListTile(title: Text('This is tile number 1')),
                        ],
                      ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
