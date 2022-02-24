import 'package:flutter/material.dart';
import 'foodmenu.dart';

void main() {
  runApp(MyApp());
}

//Stateless เปลี่ยนค่าไม่ได้
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: myHomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<FoodMenu> menu = [
    FoodMenu("ก๋วยเตี๋ยวแห้ง", "60", "assets/images/dry.jpg"),
    FoodMenu("ก๋วยเตี๋ยวน้ำ", "60", "assets/images/soup.jpg"),
    FoodMenu("ก๋วยเตี๋ยวต้มยำ", "60", "assets/images/tomyum.jpg"),
    FoodMenu("ก๋วยเตี๋ยวเย็นตาโฟ", "60", "assets/images/yenta4.jpg"),
    FoodMenu("ลูกชิ้นปลา", "10 ลูก 60", "assets/images/fishBall.jpg"),
    FoodMenu("ลูกชิ้นกุ้ง", "10 ลูก 60", "assets/images/shrimpBall.jpg"),
    FoodMenu("เผือกทอด", "10 ลูก 50", "assets/images/friedTaro.jpg"),
    FoodMenu("ฮื่อก้วย", "80", "assets/images/fishStick.jpg"),
    FoodMenu("ลูกชิ้นปลาทรงเครื่อง", "80", "assets/images/fishBallBig.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("เลือกเมนูอาหาร") //Header
            ),
        //กำหนด list >10 ค่าขึ้นไป
        body: ListView.builder(
            itemCount: menu.length, //จำนวน list
            itemBuilder: (BuildContext context, int index) {
              FoodMenu food = menu[index];
              return ListTile(
                leading: Image.asset(food.img),
                title: Text(
                  food.name,
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text("ราคา " + food.price + " บาท"),
                onTap: () {
                  print("คุณเลือกเมนู " + food.name);
                },
              );
            }));
  }
}
