import 'package:credit_cards_expenses_provider/ui/with_notify_listeners_screen.dart';
import 'package:credit_cards_expenses_provider/ui/with_stream_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 410.0,
      height: 800.0,
    )..init(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Provider App"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ButtonTheme(
              minWidth: 150,
              height: 50,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WithStreamScreen()),
                  );
                },
                child: Text(
                  "With StreamProvider",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            ButtonTheme(
              minWidth: 150,
              height: 50,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WithNotifyListenersScreen()),
                  );
                },
                child: Text(
                  "With NotifyListeners",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
