import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/category/category_list.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_text_field.dart';

class Dashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          placeholder: 'Search ...',
        ),

        CategoryList(),

        Text("Dashboard"),
      ],
    );
  }
}
