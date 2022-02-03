import 'package:flutter/material.dart';

class Empity extends StatelessWidget {
  const Empity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          
          SizedBox(
            height: 140,
            width: 140,
            child: Image(
              image: AssetImage("lib/src/assets/img/vacio.JPG"),
            ),
          ),
          SizedBox(
            width: 140,
            child: Text("Esto muy vacío",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            width: 140,
            child: Text("Por el momento no tenemos informacion que mostrar",textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
          )
        ],
      )),
    );
  }
}
