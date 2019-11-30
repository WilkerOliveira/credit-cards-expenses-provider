import 'package:credit_cards_expenses_provider/ui/widget/credit_card_front_widget.dart';
import 'package:credit_cards_expenses_provider/ui/widget/statement_item_widget.dart';
import 'package:credit_cards_expenses_provider/viewmodel/credit_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class WithNotifyListenersScreen extends StatefulWidget {
  @override
  _WithNotifyListenersScreenState createState() => _WithNotifyListenersScreenState();
}

class _WithNotifyListenersScreenState extends State<WithNotifyListenersScreen> {
  final myController = TextEditingController();

  final CreditCardViewModel creditCardModel = CreditCardViewModel();

  @override
  Widget build(BuildContext context) {
    print("***** WithNotifyListenersScreen.build *****");
    ScreenUtil.instance = ScreenUtil(
      width: 410.0,
      height: 800.0,
    )..init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Provider App"),
      ),
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Consumer<CreditCardViewModel>(
      builder: (context, model, child) => Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250.0,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CreditCardFrontWidget(
                      creditCard: model.creditCards[index]);
                },
                onIndexChanged: (int index) {
                  model.currentCreditCard(model.creditCards[index]);
                },
                itemCount: model.creditCards.length,
                outer: true,
                fade: 0.4,
                loop: false,
                viewportFraction: 0.9,
                scale: 1.0,
                control: new SwiperControl(),
              ),
            ),
            this.expensesList(context),
          ],
        ),
      ),
    );
  }

  Widget expensesList(context) {
    var model = Provider.of<CreditCardViewModel>(context, listen: false);

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: myController,
            key: Key("txtExpense"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 150,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.grey,
                    onPressed: () {
                      model.addExpense(myController.text);
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 150,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      model.searchExpense(myController.text);
                    },
                    child: Text(
                      "FIND",
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
          this.list(model),
        ],
      ),
    );
  }

  Widget list(CreditCardViewModel model) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.instance.setWidth(8),
        bottom: ScreenUtil.instance.setWidth(8),
      ),
      alignment: Alignment.centerLeft,
      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: model.currentExpenses.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return StatementItemWidget(
            title: model.currentExpenses[index].description,
          );
        },
      ),
    );
  }
}
