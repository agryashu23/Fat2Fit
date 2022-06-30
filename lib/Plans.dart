import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DynamicWidget extends StatefulWidget {
  const DynamicWidget({Key? key,required this.index, required this.sting}) : super(key: key);
  final int index;
  final List sting;

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      return Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(right: 20),
                child: Icon(
                  MdiIcons.circleDouble, size: 20, color: Colors.black,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sting[widget.index]["task"],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.sting[widget.index]["time"], style: TextStyle(fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),


      );
    });
  }
}

