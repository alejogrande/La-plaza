import 'package:flutter/material.dart';
import 'package:la_plaza/src/models/products.dart';
import 'package:la_plaza/src/providers/products_provider.dart';
import 'package:la_plaza/src/widgets/empity.dart';
import 'package:la_plaza/src/widgets/gridViewProducts.dart';
import 'package:la_plaza/src/widgets/seachBarWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController seach = TextEditingController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Padding _body(BuildContext context) {
    final productsProvider = ProductsProvider();
    // final productsProvider = Provider.of<ProductsProvider>(context);
    // print(productsProvider);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/src/assets/img/laPlaza.JPG'),
                      fit: BoxFit.scaleDown)),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 8.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: widget.seach,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {   
                                                     
                          });
                      },
                      icon: const Icon(Icons.search,
                          size: 36, color: Colors.grey),
                    ),
                    hintText: "Buscar",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              "Todos los productos",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
              future: productsProvider.getProductsSeach(widget.seach.text),
              builder: (context, AsyncSnapshot<List<Product?>?> snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.data!.isNotEmpty){
                    return ProductsBuilder(
                    products: snapshot.data,
                  );
                  }else{
                    return const Empity();
                  }
                  
                } else {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                //print('project snapshot data is: ${projectSnap.data}');
              })
        ],
      ),
    );
    // builder: (context, AsyncSnapshot<List<Product>> snapshot) {
  }
}


