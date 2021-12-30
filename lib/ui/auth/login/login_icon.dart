import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/util/responsive_util.dart';

class LoginIcon extends StatelessWidget {
  final ResponsiveUtil util;

  const LoginIcon({Key key, this.util}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _colorIf(
      needColor: !util.isMobile,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (util.isMobile)
            SizedBox(
              height: 20,
            ),
          _bagHandle(),
          Container(
            color: ThemeColorLighter,
            height: 150,
            width: 150,
            child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.login_rounded,
                  size: util.incremental(40, factor: 10),
                  color: ThemeColor,
                ),
                label: Text(
                  "SHOP",
                  style: TextStyle(
                      fontSize: 20,
                      color: ThemeTextColorLight,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }

  Widget _colorIf({child, needColor: false}) {
    return needColor
        ? ClipPath(
            clipper: LoginBgClipper(),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: ThemeTextColorLightest,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: child),
          )
        : child;
  }

  Widget _bagHandle(
      {double height: 40,
      double handleWidth: 10,
      handleColor: ThemeColor,
      bgColor: ThemeTextColorLightest}) {
    return Container(
      decoration: BoxDecoration(
          color: handleColor,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(height / 2))),
      child: Container(
        margin: EdgeInsets.fromLTRB(handleWidth, handleWidth, handleWidth, 0),
        height: height,
        width: height * 2,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(height / 2))),
      ),
    );
  }
}

class LoginBgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final _curveControl = Offset(size.width / 1.2, size.height / 2);
    final Path _path = Path()
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(
          _curveControl.dx, _curveControl.dy, size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // final Path _path = Path();
    // _path.lineTo(size.width, 0);
    // _path.quadraticBezierTo(
    //     _curveControl.dx, _curveControl.dy, size.width, size.height);
    // _path.lineTo(0, size.height);
    // _path.close();

    return _path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
