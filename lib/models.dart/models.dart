import 'package:flutter/material.dart';

class PortfolioModel {
  String? name;
  String? image;
  GestureTapCallback? onTap;

  PortfolioModel(this.image, this.name, {this.onTap});
}
