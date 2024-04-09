import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_prefs/pages/home_page.dart';
import 'package:shared_prefs/preferences/shared_prefs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _save() async {
    await SharedPreferencesService.setBool(
      PrefKey.isLoggedIn,
      true,
    );
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return TextField(
                    onChanged: (value) {
                      provider.validateUsername(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter Username',
                      errorText: provider.usernameError,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                      LengthLimitingTextInputFormatter(8),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    onPressed: _save,
                    child: const Text('Login'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginProvider extends ChangeNotifier {
  String? _username;
  String? _password;
  String? _usernameError;
  String? _passwordError;

  String? get username => _username;
  String? get password => _password;
  String? get usernameError => _usernameError;
  String? get passwordError => _passwordError;

  void setUsername(String value) {
    _username = value;
    SharedPreferencesService.setString(PrefKey.username, value);
    _usernameError = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    SharedPreferencesService.setString(PrefKey.password, value);
    _passwordError = null;
    notifyListeners();
  }

  void validateUsername(String value) {
    if (value.isEmpty) {
      _usernameError = 'Username is not empty';
      notifyListeners();
    } else if (value.length < 8) {
      _usernameError = 'Username length at least 8';
      notifyListeners();
    } else {
      setUsername(value);
      _usernameError = null;
      notifyListeners();
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      _passwordError = 'Password is not empty';
      notifyListeners();
    } else if (value.length < 8) {
      _passwordError = 'Password length at least 8';
      notifyListeners();
    } else if (!value.contains(RegExp(r'[!@#$%^&*]'))) {
      _passwordError = 'Password must contain special symbols !@#\$%^&*';
      notifyListeners();
    } else {
      setPassword(value);
      _passwordError = null;
      notifyListeners();
    }
  }
}



// TextField(
//   onChanged: (value) {
//     context.read<LoginProvider>().validatePassword(value);
//   },
//   decoration: InputDecoration(
//     labelText: 'Password',
//     hintText: 'Enter Password',
//     errorText: context.watch<LoginProvider>().passwordError,
//   ),
//   keyboardType: TextInputType.name,
//   obscureText: true,
// ),