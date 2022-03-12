import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? scanresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode & QRCode Scan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ผลการสแกน",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      scanresult ??= "ยังไม่มีข้อมูล",
                      // [??= "ยังไม่มีข้อมูล"] mean ถ้าไม่มีค่าจะแสดงเป็น ยังไม่มีข้อมูล
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: const Icon(Icons.qr_code_scanner_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  startScan() async {
    //อ่านข้อมูลจาก bar/Qrcode
    String? cameraScanResult = await scanner.scan();
    // print(cameraScanResult);
    setState(() {
      scanresult = cameraScanResult;
    });
  }
}
