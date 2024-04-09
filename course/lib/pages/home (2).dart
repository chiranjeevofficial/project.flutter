import "package:course/models/catalog.dart";
import "package:course/widgets/drawer.dart";
import "package:course/widgets/itemWidget.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
// import 'package:course/utils/routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // loadData() async {
    //   final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //   final decodedData = jsonDecode(catalogJson);
    //   var productsData = decodedData["products"];
    //   CatalogModel.items = List.from(productsData)
    //       .map<Item>((item) => Item.fromMap(item))
    //       .toList();
    // }
    // final decodedData = jsonDecode(catalogJson);
    // var productsData = decodedData["products"];
    // CatalogModel.items = List.from(productsData).map<Item>((item) =>
    //   Item.fromMap(item)).toList();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text("Flutter Course"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatalogModel.items[index]);
          },
        ),
      ),
      /*body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/hey.png"),
            const Text(
              "Namaste! Flutter",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "I'm Chiranjeev",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            /*InkWell(
              onTap: () {
                Navigator.pushNamed(context, NewRoute.loginRoute);
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),*/
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, NewRoute.loginRoute);
            //   },
            //   child: Text(
            //     "Goto Login",
            //     style: GoogleFonts.roboto(
            //       color: Colors.deepPurple,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // )
          ],
        ),
      ),*/
      drawer: const NewDrawer(),
    );
  }
}
