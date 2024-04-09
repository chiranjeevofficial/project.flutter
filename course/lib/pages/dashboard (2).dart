import "package:course/models/catalog.dart";
// import "package:course/widgets/drawer.dart";
// import "package:course/widgets/itemWidget.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
// import 'package:course/utils/routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override  
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: CatalogHeader()
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       title: const Padding(
  //         padding: EdgeInsets.only(left: 60),
  //         child: Text("Cloud Cart"),
  //       ),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
  //       child: GridView.builder(
  //         itemCount: CatalogModel.items.length,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 15,
  //           mainAxisSpacing: 15,
  //         ),
  //         itemBuilder: (context, index) {
  //           // return ItemWidget(item: CatalogModel.items[index]);
  //           final item = CatalogModel.items[index];
  //           return Card(
  //             clipBehavior: Clip.antiAlias,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10)),
  //             child: GridTile(
  //               header: Container(
  //                 padding:
  //                     const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
  //                 alignment: Alignment.center,
  //                 decoration: const BoxDecoration(
  //                   color: Colors.deepPurple,
  //                 ),
  //                 child: Text(item.name,
  //                     style: const TextStyle(color: Colors.white)),
  //               ),
  //               footer: Container(
  //                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //                   alignment: Alignment.centerRight,
  //                   decoration: const BoxDecoration(
  //                     color: Colors.deepPurple,
  //                   ),
  //                   child: Text("\$ ${item.price.toString()}",
  //                       style: const TextStyle(color: Colors.white))),
  //               child: Image.network(
  //                 item.img,
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //     /*body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           Image.asset("assets/images/hey.png"),
  //           const Text(
  //             "Namaste! Flutter",
  //             style: TextStyle(
  //                 color: Colors.purple,
  //                 fontSize: 35,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 10),
  //           const Text(
  //             "I'm Chiranjeev",
  //             style: TextStyle(
  //               color: Colors.blueAccent,
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           /*InkWell(
  //             onTap: () {
  //               Navigator.pushNamed(context, NewRoute.loginRoute);
  //             },
  //             child: Container(
  //               width: 100,
  //               height: 50,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                   color: Colors.purple,
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: const Text(
  //                 "Login",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 20,
  //                 ),
  //               ),
  //             ),
  //           ),*/
  //           // ElevatedButton(
  //           //   onPressed: () {
  //           //     Navigator.pushNamed(context, NewRoute.loginRoute);
  //           //   },
  //           //   child: Text(
  //           //     "Goto Login",
  //           //     style: GoogleFonts.roboto(
  //           //       color: Colors.deepPurple,
  //           //       fontWeight: FontWeight.bold,
  //           //     ),
  //           //   ),
  //           // )
  //         ],
  //       ),
  //     ),*/
  //     drawer: const NewDrawer(),
  //   );
  // }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.blue).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
 