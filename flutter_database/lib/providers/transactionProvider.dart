import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transaction = [];

  //ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transaction;
  }

  void addTransaction(Transaction statement) {
    //transaction.add(statement); //ไว้ล่างสุด
    transaction.insert(0, statement); //ไว้บนสุด
    notifyListeners();
  }
}
