import 'package:dolarama/model/Dollar.dart';
import 'package:dolarama/views/util/card_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDollar extends StatelessWidget {

  final Dollar dollar;


  CardDollar(this.dollar);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.all(10),
      elevation: 8,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 130,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: ClipPath(
                clipper: MyClipperCard(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 35, bottom: 5),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            this.dollar.getVariation(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            this.dollar.name,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.only(right: 25, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Detail(
                      title: "Venta:",
                      value: this.dollar.priceSell,
                    ),
                    Detail(
                      title: "Compra:",
                      value: this.dollar.priceBuy,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  TextStyle style =
      TextStyle(fontSize: 17, letterSpacing: .5, color: Colors.grey.shade700);

  final String title;
  final double value;

  Detail({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          this.title,
          style: style.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "\$\ ${this.value.toString()}",
          style: style.copyWith(fontSize: 26, color: Colors.grey.shade800),
        ),
      ],
    );
  }
}
