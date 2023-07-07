import 'package:flutter/material.dart';
import 'package:untitled7/ui/card_screen/card_screen.dart';


void main ()
{
  runApp(ItemCards());
}


class ItemCards extends StatefulWidget {
  const ItemCards({Key? key}) : super(key: key);

  @override
  State<ItemCards> createState() => _ItemCardsState();
}

class _ItemCardsState extends State<ItemCards> {
  @override
  Widget build(BuildContext context) {
    print("======================================================");
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen(),
    );
  }
}
