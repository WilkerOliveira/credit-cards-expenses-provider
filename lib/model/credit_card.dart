
import 'package:credit_cards_expenses_provider/model/expense.dart';

class CreditCard {
  String number;
  String validThru;
  String cardHolderName;

  List<Expense> expenses;

  CreditCard(this.number, this.validThru, this.cardHolderName);
}
