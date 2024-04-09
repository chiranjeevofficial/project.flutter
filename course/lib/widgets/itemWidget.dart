import 'package:flutter/material.dart';
import 'package:course/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      // shape: StadiumBorder(),
      color: Colors.white,
      // elevation: 0,
      child: ListTile(
        onTap: () {
          print("${item.desc} pressed");
        },
        leading: Image.network(item.img),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          style: const TextStyle(
              color: Colors.deepPurpleAccent, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
