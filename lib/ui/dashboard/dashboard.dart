import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_text_field.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextField(
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColor,
          ),
          placeholder: "Search",
        )
      ],
    );
  }
}
