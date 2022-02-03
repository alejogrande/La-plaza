import 'package:flutter/material.dart';
import 'package:la_plaza/src/models/products.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 140,
            width: double.infinity,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 10,
                  height: 35,
                  decoration:BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(100))
                  ),
                ))),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Hero(
            tag: product!.id,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(product!.imagen),
                      fit: BoxFit.cover)),
            ),
          ),
        
        
        ),
        Container(
            height: 150,
            width: double.infinity,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(child: Text("${product!.valorPromo}%",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.white),)),
                ))),
      ],
    );
  }
}