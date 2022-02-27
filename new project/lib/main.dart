void main() async {
  print(await loginUser());
  print("Doing other");
}

Future<String> loginUser() async {
  var user = await getUserFromDatabase();
  return "name: " + user;
}

//ข้อมูลที่จะได้ต้องรอ 10 วิ
Future<String> getUserFromDatabase() {
  return Future.delayed(Duration(seconds: 5), () => "Jinyoung");
}
