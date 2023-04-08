import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id, // требует задать requried изза Null Safety
    required this.title,
    this.color = Colors.blue, // так можно задавать дефолтный цвет
  });
}
