import 'package:flutter/material.dart';
import 'package:httprequestlogin/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondRoute extends StatelessWidget {

  final String token;



  const SecondRoute({this.token});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: Text(
              "Token Adresiniz",

              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),


          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              token,
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
          ),
          SizedBox(height: 15),

          OutlineButton(
            child: Text("Çıkış Yap"),
            onPressed: () {
              cikisyap(context);
            },
          )



        ],
      ),
    );
  }

  Future<void> cikisyap(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyApp()),
    );
  }
}
