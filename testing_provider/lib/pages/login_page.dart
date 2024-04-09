import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (BuildContext context) => LoginProvider(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/Login-amico.png',
                      height: 250,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            return TextField(
                              controller: username,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Enter username here',
                                suffixText: provider.errorMessage.toString(),
                                suffixStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                                LengthLimitingTextInputFormatter(8),
                              ],
                              onChanged: (value) {
                                provider.validation(value);
                              },
                            );
                          },
                        ),
                        Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            return TextField(
                              controller: password,
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password here',
                                suffixText: provider.errorMessage,
                              ),
                              onChanged: (value) {
                                provider.validation(value);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        login(username.text, password.text);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(String username, String password) {
    print('$username $password');
  }
}

class LoginProvider extends ChangeNotifier {
  bool? userValid;
  bool? passValid;
  String? errorMessage = '';

  void validation(String username) {
    if (username.isEmpty) {
      userValid = false;
      errorMessage = 'cannot be empty';
      notifyListeners();
    } else if (username.length < 8) {
      userValid = false;
      errorMessage = 'length at least 8';
      notifyListeners();
    } else if (username.isNotEmpty && username.length == 8) {
      userValid = true;
      errorMessage = '';
      notifyListeners();
    }
  }
}
