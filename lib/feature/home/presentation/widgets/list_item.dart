import 'package:flutter/material.dart';
import 'package:movies_app1/feature/home/data/models/list_model.dart';


class TabItems extends StatelessWidget {
  Genres source;
  bool selected;

  TabItems(this.source, this.selected, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: selected ? Colors.red : Color(0xFF15141F),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color:selected ? Colors.red:const Color(0xFF15141F), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          textAlign: TextAlign.center,
          source.name ?? "",
          style: TextStyle(
              color: selected ? Colors.white : Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}