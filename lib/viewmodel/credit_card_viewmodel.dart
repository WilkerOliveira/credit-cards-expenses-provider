import 'package:credit_cards_expenses_provider/model/credit_card.dart';
import 'package:credit_cards_expenses_provider/model/expense.dart';
import 'package:flutter/foundation.dart';

class CreditCardViewModel extends ChangeNotifier {
  List<CreditCard> creditCards;
  List<Expense> currentExpenses;
  CreditCard _current;

  CreditCardViewModel() {
    creditCards = List<CreditCard>();

    _initCards();
  }

  _initCards() {
    creditCards.add(CreditCard("1234 5678 9012 3456", "2020/12", "First Name"));
    creditCards
        .add(CreditCard("9876 5432 8976 1122", "2022/05", "Second Name"));
    currentCreditCard(creditCards.first);
  }

  currentCreditCard(CreditCard creditCard) {
    _current =
        creditCards.firstWhere((item) => item.number == creditCard.number);

    if (_current != null && _current.expenses == null)
      _current.expenses = List<Expense>();

    this.currentExpenses = _current.expenses;

    notifyListeners();
  }

  addExpense(String expenses) {
    _current.expenses.add(Expense(expenses));

    notifyListeners();
  }

  searchExpense(String expense) {
    this.currentExpenses = _current.expenses
        .where((item) => item.description.contains(expense))
        .toList();

    notifyListeners();
  }
}
