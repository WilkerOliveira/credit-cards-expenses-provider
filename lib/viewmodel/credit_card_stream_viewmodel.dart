import 'dart:async';

import 'package:credit_cards_expenses_provider/model/credit_card.dart';
import 'package:credit_cards_expenses_provider/model/expense.dart';

class CreditCardStreamViewModel {
  List<CreditCard> _creditCards;
  List<Expense> _currentExpenses;
  CreditCard _current;

  StreamController<List<CreditCard>> _creditCardStreamController;
  Stream<List<CreditCard>> get creditCardStream =>
      _creditCardStreamController.stream;

  StreamController<List<Expense>> _currentExpensesStreamController;
  Stream<List<Expense>> _localCurrentExpensesStream;
  Stream<List<Expense>> get currentExpensesStream =>
      _localCurrentExpensesStream;

  StreamController<CreditCard> _currentCreditCardController;
  Stream<CreditCard> get currentCreditCardStream =>
      _currentCreditCardController.stream;

  CreditCardStreamViewModel() {
    print("***** CreditCardStreamViewModel.constructor *****");
    _creditCards = List<CreditCard>();

    this._creditCardStreamController = StreamController();
    this._creditCardStreamController.sink.add(_creditCards);
    this._currentExpensesStreamController = StreamController.broadcast();
    this._currentCreditCardController = StreamController();

    _initCards();
  }

  _initCards() {
    _creditCards
        .add(CreditCard("1234 5678 9012 3456", "2020/12", "First Name"));
    _creditCards
        .add(CreditCard("9876 5432 8976 1122", "2022/05", "Second Name"));

    setCurrentCreditCard(_creditCards.first);
  }

  setCurrentCreditCard(CreditCard creditCard) {
    _current =
        _creditCards.firstWhere((item) => item.number == creditCard.number);

    if (_current != null && _current.expenses == null)
      _current.expenses = List<Expense>();

    this._currentExpensesStreamController.sink.add(_current.expenses);
    _localCurrentExpensesStream = this._currentExpensesStreamController.stream;

    this._currentCreditCardController.sink.add(_current);
  }

  addExpense(String expenses) {
    _current.expenses.add(Expense(expenses));
    this._currentExpensesStreamController.sink.add(_current.expenses);
    _localCurrentExpensesStream = this._currentExpensesStreamController.stream;
  }

  searchExpense(String expense) {
    this._currentExpenses = _current.expenses
        .where((item) => item.description.contains(expense))
        .toList();

    this._currentExpensesStreamController.sink.add(this._currentExpenses);
  }

  void dispose() {
    this._creditCardStreamController.close();
    this._currentExpensesStreamController.close();
  }
}
