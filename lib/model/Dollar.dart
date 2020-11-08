import 'package:flutter/material.dart';

class Dollar {
  String _name;
  double _priceBuy;
  double _priceSell;
  double _variation;

  String get name => _name;

  Dollar({
    @required String name,
    @required double priceBuy,
    @required double priceSell,
    @required double variation,
  }) {
    this.name = name;
    this.priceBuy = priceBuy;
    this.priceSell = priceSell;
    this.variation = variation;
  }

  Dollar.fromJSON(Map<String, dynamic> json) {
    this.priceBuy = _convert(json['compra']);
    this.priceSell = _convert(json['venta']);
    this.variation = _convert(json['variacion']);
    this.name = json['nombre'];
  }

  set name(String name) {
    _name = name;
  }

  double get priceBuy => _priceBuy;

  set priceBuy(double priceBuy) {
    _priceBuy = priceBuy;
  }

  double get priceSell => _priceSell;

  set priceSell(double priceSell) {
    _priceSell = priceSell;
  }

  double get variation => _variation;

  set variation(double variation) {
    _variation = variation;
  }

  String getVariation() {
    String pref = "";
    String data = this.variation.toString();
    data = data.replaceAll(".", ",");

    if (this.variation > 0) {
      pref = "+ ";
    }

    String variation = pref + data + "%";
    return variation;
  }

  double _convert(String data) {
    double number = 0;
    try {
      data = data.replaceAll(",", ".");
      number = double.parse(data, (e) {
        return 0;
      });
    } catch (e) {
      print("ERROR: " + e);
    } finally {
      return number;
    }
  }
}