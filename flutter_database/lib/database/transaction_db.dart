import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TransactionDB {
  //Database
  String dbName; //เก็บฐานข้อมูล

  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถูกสร้างแล้ว => เปิด

  TransactionDB({required this.dbName});

  Future<String> openDatabase() async {
    //หา path
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation =
        join(appDirectory.path, dbName); // เอา path มาต่อด้วย dbName
    return dbLocation;
  }
}
