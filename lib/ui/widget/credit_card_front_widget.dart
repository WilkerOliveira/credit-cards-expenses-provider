import 'package:credit_cards_expenses_provider/model/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreditCardFrontWidget extends StatefulWidget {
  final CreditCard creditCard;

  const CreditCardFrontWidget({Key key, this.creditCard}) : super(key: key);
  @override
  _CreditCardFrontWidgetState createState() => _CreditCardFrontWidgetState();
}

class _CreditCardFrontWidgetState extends State<CreditCardFrontWidget> {
  String visa = 'assets/images/ic_visa.svg';
  String chip = 'assets/images/ic_chip.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        ScreenUtil.instance.setWidth(16.0),
      ),
      height: ScreenUtil.instance.setHeight(126),
      width: ScreenUtil.instance.setWidth(390),
      decoration: BoxDecoration(
        color: Color(0xFF202858),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFbdc3c7),
            Color(0xFF2c3e50),
          ],
        ),
        borderRadius: new BorderRadius.all(const Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          ScreenUtil.instance.setWidth(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              visa,
              width: ScreenUtil.instance.setWidth(64.0),
              height: ScreenUtil.instance.setHeight(64.0),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(8),
                right: ScreenUtil.instance.setWidth(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(chip),
                  Text(
                    widget.creditCard.number,
                    style: formTextStyle(
                      Colors.white,
                      18,
                    ).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(8),
                top: ScreenUtil.instance.setWidth(16),
                right: ScreenUtil.instance.setWidth(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Valid Thru".toUpperCase(),
                        style: formTextStyle(
                          Colors.white,
                          14,
                        ),
                      ),
                      Text(
                        widget.creditCard.validThru,
                        style: formTextStyle(
                          Colors.white,
                          14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.creditCard.cardHolderName +
                        " " +
                        DateFormat('kk:mm:ss').format(DateTime.now()),
                    style: formTextStyle(
                      Colors.white,
                      14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle formTextStyle(Color color, double fontSize) => TextStyle(
        fontFamily: 'Roboto',
        fontSize: ScreenUtil.instance.setSp(fontSize),
        color: color,
      );
}
