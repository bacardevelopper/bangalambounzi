// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_new, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BoxGradient extends StatefulWidget {
  @override
  State<BoxGradient> createState() => _BoxGradient();
}

/* class retourne un scaffold */
class _BoxGradient extends State<BoxGradient> {
  var radius_circular = Radius.circular(30);
  int nombre = 0;
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: Center(
        child: Container(
          child: colonne_widget(),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2,
            maxWidth: MediaQuery.of(context).size.width / 1.1,
          ),
          decoration: BoxDecoration(
            color: HexColor('#D1F2EB'),
            borderRadius: BorderRadius.only(
              topLeft: radius_circular,
              topRight: radius_circular,
              bottomLeft: radius_circular,
              bottomRight: radius_circular,
            ),
          ),
        ),
      ),
    );
  }

  Widget ligne() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 2.0,
        color: Colors.black,
      ),
    );
  }

  Widget colonne_widget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        centerNumber(),
        ligne(),
        Center(
          child: btn_en_ligne(),
        )
      ],
    );
  }

  Widget btn_en_ligne() {
    return Container(
      height: 120.0,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btn_plus(),
          btn_moins(),
        ],
      ),
    );
  }

  Widget btn_moins() {
    return ElevatedButton(
      onPressed: () {
        if (nombre > 0) {
          setState(() {
            nombre = nombre - 1;
          });
        }
      },
      child: Icon(Icons.expand_more_rounded),
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: HexColor("#F23620"),
        fixedSize: Size(60, 60),
        shape: CircleBorder(),
      ),
    );
  }

  Widget btn_plus() {
    return ElevatedButton(
      onPressed: () {
        if (nombre < 100) {
          setState(() {
            nombre = nombre + 1;
          });
        }
      },
      child: Icon(Icons.expand_less_rounded),
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: HexColor("#48C9B0"),
        fixedSize: Size(60, 60),
        shape: CircleBorder(),
      ),
    );
  }

  Widget centerNumber() {
    return Center(
      child: Text(
        nombre.toString(),
        style: TextStyle(
          color: HexColor('#2C3E50'),
          fontSize: 150.0,
        ),
      ),
    );
  }
}
