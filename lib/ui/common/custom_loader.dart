import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class CustomLoader extends StatelessWidget {
  final String label;

  const CustomLoader({Key key, this.label: ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Please wait...",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ThemeColorLight),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: ThemeTextColor,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 12, color: ThemeTextColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
