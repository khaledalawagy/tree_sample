import 'package:flutter/material.dart';


class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          click = !click;
        });
      },
      icon: Icon(Icons.favorite, color: click ? Colors.redAccent : Colors.grey),
    );
  }
}