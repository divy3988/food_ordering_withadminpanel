import 'package:flutter/material.dart';

class list_Tile extends StatelessWidget {
  final Icon leading;
  final String text;
  final Icon trailing;
  const list_Tile(
      {super.key,
      required this.leading,
      required this.text,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: leading,
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: trailing,
    ));
  }
}
