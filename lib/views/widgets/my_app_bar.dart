import 'dart:ui';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback onRefresh;

  MyAppBar({this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.cyan,
      title: Text(
        "Dolarama",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => onRefresh(),
          ),
        ),
      ],
      elevation: 0,
      toolbarHeight: 70,
      expandedHeight: 160.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/dollar.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              child: Container(
                decoration: BoxDecoration(color: Colors.cyan.withAlpha(90)),
              ),
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            ),
            Image.asset(
              'assets/fry.png',
              scale: 7,
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}
