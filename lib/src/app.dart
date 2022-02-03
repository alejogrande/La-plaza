import 'package:flutter/material.dart';
import 'package:la_plaza/src/providers/products_provider.dart';
import 'package:la_plaza/src/screens/DetailsScreen.dart';
import 'package:la_plaza/src/screens/homeScreen.dart';
import 'package:la_plaza/src/widgets/navigatorBar.dart';
import 'package:provider/provider.dart';


class AppState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),lazy: false,
        ),
        
      ],
      child: App(),
    );
  }

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'La Plaza',
      initialRoute: 'home',
      routes: {
        "home":(_)=>NavigatorBar(),
        'details':(_)=>DetailsScreen(),
      },
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: NavigatorBar(),
    );
  }
}

