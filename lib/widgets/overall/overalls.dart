import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tags.dart';
import 'package:todo_app/widgets/overall/overall_card.dart';

class OverAlls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tags = Provider.of<Tags>(context, listen: false).tags;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      height: 90,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (ctx, i) => OverallCard(tags[i].title, tags[i].color),
      ),
    );
  }
}
