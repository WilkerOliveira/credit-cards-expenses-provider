import 'package:credit_cards_expenses_provider/ui/main_screen.dart';
import 'package:credit_cards_expenses_provider/viewmodel/credit_card_stream_viewmodel.dart';
import 'package:credit_cards_expenses_provider/viewmodel/credit_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => CreditCardViewModel()),
        Provider<CreditCardStreamViewModel>.value(
          value: CreditCardStreamViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Simple Provider App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
