import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/ui/common/base/custom_button.dart';

class CarouselLoaderCard extends StatelessWidget {
  final String errMsg;
  final String emptyMsg;
  final VoidCallback retry;
  final bool isEmpty;

  bool get _hasError => errMsg != null && errMsg.isNotEmpty;

  const CarouselLoaderCard(
      {Key key,
      this.errMsg,
      this.retry,
      this.emptyMsg: "No data",
      this.isEmpty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeTextColorLightest),
      child: _hasError
          ? _errorContainer()
          : isEmpty
              ? _emptyContainer()
              : _loaderContainer(),
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

  _emptyContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.clear),
        SizedBox(
          width: 10,
        ),
        Text(emptyMsg ?? "No data")
      ],
    );
  }
}
