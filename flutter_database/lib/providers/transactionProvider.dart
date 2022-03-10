import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transaction = [];

  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transaction;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transaction.db");
    //    [บันทึกข้อมูล]
    await db.InsertData(statement);
    transaction.insert(0, statement); //ไว้บนสุด
    notifyListeners(); //notificate to consumer
  }
}
