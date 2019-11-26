import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatementItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String amount;
  final String statementType;

  const StatementItemWidget(
      {Key key,
      this.icon,
      this.title,
      this.description,
      this.amount,
      this.statementType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: ScreenUtil.instance.setWidth(2),
      ),
      child: Container(
        decoration: listItemDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: Text(
                this.title,
                style: defaultTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration listItemDecoration() {
    return new BoxDecoration(
      color: Color(0xFF202858),
      gradient: gradientDecoration(),
    );
  }

  LinearGradient gradientDecoration() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF202858), Color(0xFF006978)],
    );
  }

  TextStyle defaultTextStyle() {
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: ScreenUtil.instance.setSp(16),
      height: ScreenUtil.instance.setHeight(1.4),
    );
  }

  TextStyle formTextStyle(Color color, double fontSize) => TextStyle(
        fontFamily: 'Roboto',
        fontSize: ScreenUtil.instance.setSp(fontSize),
        color: color,
      );
}
