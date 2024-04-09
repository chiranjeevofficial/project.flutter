import 'package:course/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:course/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    setState(() {
      changedButton = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, NewRoute.dashboardRoute);
    setState(() {
      changedButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple, // Change color to your desired color
      statusBarIconBrightness: Brightness.light,
    ));

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 30),
          Image.asset(
            "assets/images/welcome.png",
            fit: BoxFit.contain,
            width: 300,
            // height: 800,
          ),
          const SizedBox(
            height: 20,
          ),
          // Text("Welcome $addOn", style: GoogleFonts.merienda(fontSize: 30)),
          Text("Welcome", style: GoogleFonts.merienda(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your username",
                      labelText: "Username",
                    ),
                    // onChanged: (value) {
                    //   addOn = value;
                    //   setState(() {});
                    // },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username should not be empty.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password should not be empty";
                      } else if (value.length < 6) {
                        return "Password length should be atleast 6";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Material(
            color: changedButton ? Colors.green : Colors.deepPurple,
            borderRadius: BorderRadius.circular(changedButton ? 20 : 5),
            // shape: changedButton ? BoxShape.circle : BoxShape.rectangle
            child: InkWell(
              onTap: () => {
                if (_formKey.currentState!.validate()) {
                  moveToHome(context),
                }
              },
              child: AnimatedContainer(
                // color: Colors.deepPurple,
                duration: const Duration(seconds: 1),
                width: changedButton ? 40 : 100,
                height: changedButton ? 40 : 40,
                alignment: AlignmentDirectional.center,
                child: changedButton
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
                        style: GoogleFonts.merienda(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          )
          // ElevatedButton(
          //   child: Text("Login Please"),
          //   onPressed: () {
          //     print("Login Pressed");
          //   },
          //   style: TextButton.styleFrom(minimumSize: const Size(140, 50)),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, NewRoute.homeRoute);
          //   },
          //   child: Text("Goto Home Page"),
          //   style: TextButton.styleFrom(minimumSize: const Size(140, 50)),
          // )
        ]),
      ),
    );
  }
}
