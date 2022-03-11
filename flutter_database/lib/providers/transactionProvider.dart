import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transaction = [];

  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transaction;
  }

  void starttData() async {
    var db = TransactionDB(dbName: "transaction.db");
    transaction = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transaction.db");
    //    [บันทึกข้อมูล]
    await db.InsertData(statement);
    //    ดึงข้อมูลมาแสดงผล
    transaction = await db.loadAllData();
    notifyListeners(); //notificate to consumer
  }
}
