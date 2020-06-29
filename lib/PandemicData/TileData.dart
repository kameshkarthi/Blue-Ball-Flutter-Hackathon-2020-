import 'package:flutter/material.dart';

class TileData{
  String id;
  final String title;
  final String description;
  final String image;
  final Color color;
  final Color textColor;
  final Color noFillColor;
  final Color yesFillColor;
  final Function noClick;
  final Function yesClick;
  TileData({this.title,this.description,this.image,this.color,this.textColor,this.noClick,this.yesClick,this.id,this.noFillColor,this.yesFillColor});
}