import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';

class CustomToastMessage extends StatelessWidget {
  final bool error;
  final String message;

  const CustomToastMessage({Key key, this.error, this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: error ? Colors.redAccent : ThemeColor,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(error ? Icons.error : Icons.info),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
