import 'package:credit_cards_expenses_provider/model/credit_card.dart';
import 'package:credit_cards_expenses_provider/model/expense.dart';
import 'package:credit_cards_expenses_provider/ui/widget/credit_card_front_widget.dart';
import 'package:credit_cards_expenses_provider/ui/widget/statement_item_widget.dart';
import 'package:credit_cards_expenses_provider/viewmodel/credit_card_stream_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class WithStreamScreen extends StatefulWidget {
  @override
  _WithStreamScreenState createState() => _WithStreamScreenState();
}

class _WithStreamScreenState extends State<WithStreamScreen> {

  final myController = TextEditingController();
  CreditCardStreamViewModel creditCardModel = CreditCardStreamViewModel();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    creditCardModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    print("***** _WithStreamScreenState.build *****");
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
    return StreamProvider<List<CreditCard>>.value(
      value: creditCardModel.creditCardStream,
      initialData: List<CreditCard>(),
      child: Consumer<List<CreditCard>>(
        builder: (context, list, child) => Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 250.0,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return CreditCardFrontWidget(creditCard: list[index]);
                  },
                  onIndexChanged: (int index) {
                    creditCardModel.setCurrentCreditCard(list[index]);
                  },
                  itemCount: list.length,
                  outer: true,
                  fade: 0.4,
                  loop: false,
                  viewportFraction: 0.9,
                  scale: 1.0,
                  control: new SwiperControl(),
                ),
              ),
              this.expensesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget expensesList() {
    return Container(
      margin: EdgeInsets.all(16),
      child: StreamProvider<List<Expense>>.value(
        updateShouldNotify: (previous, next) => true,
        value: creditCardModel.currentExpensesStream,
        initialData: List<Expense>(),
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
                        creditCardModel.addExpense(myController.text);
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
                        creditCardModel.searchExpense(myController.text);
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
            this.list(),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.instance.setWidth(8),
        bottom: ScreenUtil.instance.setWidth(8),
      ),
      alignment: Alignment.centerLeft,
      child: Consumer<List<Expense>>(
        builder: (context, list, child) => new ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return StatementItemWidget(
              title: list[index].description,
            );
          },
        ),
      ),
    );
  }
}