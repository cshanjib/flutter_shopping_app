import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';

class CategoryLoaderCard extends StatelessWidget {
  final String errMsg;
  final VoidCallback retry;

  bool get _hasError => errMsg != null && errMsg.isNotEmpty;

  const CategoryLoaderCard({Key key, this.errMsg, this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeTextColorLightest),
      child: _hasError ? _errorContainer() : _loaderContainer(),
    );
  }

  _errorContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          errMsg,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
        CustomButton(
          onPressed: retry,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          label: 'Retry',
          backgroundColor: Colors.red,
        )
      ],
    );
  }

  _loaderContainer() {
    return SizedBox.shrink();
  }
}

class EmptyCard extends StatelessWidget {
  final String message;
  final EdgeInsets margin;

  const EmptyCard({Key key, this.message, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ThemeColorLighter, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.clear),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(message ?? "No data"),
          )
        ],
      ),
    );
  }
}
