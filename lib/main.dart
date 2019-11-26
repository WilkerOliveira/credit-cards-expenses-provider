import 'package:credit_cards_expenses_provider/ui/main_screen.dart';
import 'package:credit_cards_expenses_provider/viewmodel/credit_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreditCardViewModel>(
      builder: (context) => CreditCardViewModel(),
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
