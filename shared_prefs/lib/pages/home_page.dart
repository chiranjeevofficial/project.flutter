import 'package:flutter/material.dart';
import 'package:shared_prefs/preferences/shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'Loading...'; // Initial value

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    String? storedUsername =
        await SharedPreferencesService.getString(PrefKey.username);
    setState(() {
      username = storedUsername ?? ''; // Handle null values appropriately
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Text('Username: $username'),
        ],
      ),
    );
  }
}
