import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/data/models/paginate.dart';

class CustomPaginator<T> extends StatelessWidget {
  final Paginate<T> data;
  final Function(int page) onPageChanged;
  final bool disabled;

  bool get canGoNext => data.hasNext && !disabled;

  bool get canGoPrev => data.hasPrev && !disabled;

  bool _isCurrentPage(page) => page == data.page;

  const CustomPaginator(this.data, {Key key, this.onPageChanged, this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: ThemeColor,
            ),
            onPressed: canGoPrev ? _prev : null),
        ...List<Widget>.generate(
            data.totalPages*20, (page) => _numberButton(page + 1)),
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: ThemeColor,
            ),
            onPressed: canGoNext ? _next : null),
      ],
    );
  }

  _changePage(page) {
    if (page != data.page && onPageChanged != null) {
      onPageChanged(page);
    }
  }

  _numberButton(int pageNum) {
    return TextButton(
      onPressed: disabled ? null : () => _changePage(pageNum),
      child: Text(
        "$pageNum",
        style: TextStyle(
            color: _isCurrentPage(pageNum)
                ? ThemeTextColorLightest
                : disabled
                    ? ThemeTextColorLighter
                    : ThemeColor),
      ),
      style: TextButton.styleFrom(
          // shape: CircleBorder(side: BorderSide(width: 1, color: ThemeColor)),
          padding: EdgeInsets.all(4),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(40, 40),
          backgroundColor:
              _isCurrentPage(pageNum) ? ThemeColor : Colors.transparent),
    );
  }

  _prev() {
    _changePage(data.page - 1);
  }

  _next() {
    _changePage(data.page + 1);
  }
}
