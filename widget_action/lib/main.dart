import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  TextEditingController nameController = TextEditingController();

  TextEditingController birthYearController = TextEditingController();

  String name = "Chưa xác định";
  String ageStr = "Chưa xác định";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
        child: Column(
          children: [
            // Name TextField
            inputWidget(
                lableText: "Họ và Tên",
                hintText: "Nhập họ và tên",
                controller: nameController),

            // Birth Year textfield
            const SizedBox(
              height: 30,
            ),
            inputWidget(
                lableText: "Năm sinh",
                hintText: "Nhập năm sinh",
                controller: birthYearController),
            // Show Button
            const SizedBox(
              height: 50,
            ),

            ElevatedButton(
                onPressed: (){

                  setState((){
                    name = nameController.text;
                    ageStr = (DateTime.now().year - int.parse(birthYearController.text)).toString();
                  });

                },
                child: Text("Show Information")),

            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Name
                      Text(name),

                      // Tuổi
                      Text(ageStr)
                    ],
                  ),

                )
              ),
            )

            // Information Card

          ],
        ),
      ),
    );
  }

  Widget inputWidget({ required String lableText,required String hintText, required TextEditingController controller }){
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }

}


