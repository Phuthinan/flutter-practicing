import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transaction = [
    Transaction(title: "ซื้อหนังสือ", amount: 500, date: DateTime.now()),
    Transaction(title: "ซื้อเสื้อผ้า", amount: 1000, date: DateTime.now()),
    Transaction(title: "เครื่องสำอาง", amount: 2000, date: DateTime.now()),
  ];

  //ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transaction;
  }

  void addTransaction(Transaction statement) {
    transaction.add(statement);
  }
}
