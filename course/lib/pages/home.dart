import 'package:course/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Change color to your desired color
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150),
          const Center(
            child: Text(
              "Namaste! Coder",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text("Welcome in Cloud Cart",
            style: TextStyle(
              letterSpacing: 5
            ),),
          ),
          const SizedBox(height: 50),
          Image.asset("assets/images/icon_flutter.png",height: 200,),
          const SizedBox(height: 50,),
          ListTile(
            onTap: () => {
              Navigator.pushNamed(context, NewRoute.loginRoute),
            },
            leading: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: Colors.blue,
                size: 70,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 140),
            ),
        ],
      ),
    );
  }
}
