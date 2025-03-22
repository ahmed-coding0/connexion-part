import 'package:flutter/material.dart';

import '../main.dart';

void main() {
  runApp(MyApp());
}

/*class Main2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main2 Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous page
          },
          child: Text("Back to Main"),
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeS14());
  }
}

class HomeS14 extends StatefulWidget {
  @override
  _HomeS14State createState() => _HomeS14State();
}

class _HomeS14State extends State<HomeS14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF396C9B),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),

            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(),
            alignment: Alignment.center,

            child: Container(
              width: 200, // Largeur de l'image
              height: 200, // Hauteur de l'image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/982df7cb56ddbe9fbb89b8b5440c5627.png",
                  ),
                  fit: BoxFit.cover, // Ajuste l'image à l'espace dispo
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
