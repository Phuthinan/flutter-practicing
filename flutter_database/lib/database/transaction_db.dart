import 'dart:io';
import 'package:flutter_database/models/transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  //Database
  String dbName; //เก็บฐานข้อมูล

  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถูกสร้างแล้ว => เปิด

  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    //หา path
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation =
        join(appDirectory.path, dbName); // เอา path มาต่อด้วย dbName
    //สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> InsertData(Transactions statement) async {
    //  ฐานข้อมูล => store
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expend");

    // json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
    db.close(); //ปิดฐานข้อมูล
    return keyID;
  }

  //  ดึงข้อมูล
  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expend");
    print(store);
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    //false เรียงจากมากไปน้อย true เรียงจากน้อยไปมาก (เรียง keyID)
    List<Transactions> transactionList = [];
    for (var record in snapshot) {
      transactionList.add(Transactions(
          title: '${record["title"]}',
          amount: double.parse('${record["amount"]}'),
          date: DateTime.parse('${record["date"]}')));
    }
    // print(snapshot);

    return transactionList;
  }
}
