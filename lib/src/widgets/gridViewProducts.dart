import 'package:flutter/material.dart';
import 'package:la_plaza/src/models/products.dart';
import 'package:la_plaza/src/widgets/cardProducts.dart';

class ProductsBuilder extends StatelessWidget {
  final List<Product?>? products;
  const ProductsBuilder({
    Key? key, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Flexible(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1/1.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: products!.length,
              itemBuilder: (BuildContext context, int index) {
                return CardProducts(product: products![index],);
              }),
        );
      }
    );
  }
}


