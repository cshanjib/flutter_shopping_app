import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_app/constant/dimension.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: WIDTH_MAX_APP_WIDTH),
        child: child,
      ),
    );
  }
}
