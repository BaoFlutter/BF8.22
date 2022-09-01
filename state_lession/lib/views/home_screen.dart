import 'package:flutter/material.dart';
import 'package:state_lession/resources/strings.dart';
import 'package:state_lession/resources/widgets/input_widget.dart';
import 'package:state_lession/views/information_screen.dart';
class HomeScreen extends StatefulWidget {

  // Widget HomeScreen có state thay đổi theo 10 vòng đời  khác nhau :
  const HomeScreen({Key? key}) : super(key: key);

  // 1. Tạo ra State - createState: state được tạo ra và có 1 BuildContext cũng đc gắn vào State đó
  // Mỗi 1 widget đều phải có 1 BuildContext


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 2. mounted => true  ; đánh dấu sự tồn tại của State tring Widget

  TextEditingController? mathController, litetureController, englishController;
  String averageMarkStr = "Chưa xác định";
  String gradeStr = "Chưa xác định";

  //3 . Khởi đông State : ( comtext chưa dùng được trong hàm này )
  // Rất hay dùng hàm này trong code , muốn làm việc gì trước khi vào hàm build thì đặt trong hàm này
  @override
  void initState() {
    super.initState();
    mathController = TextEditingController();
    litetureController = TextEditingController();
    englishController = TextEditingController();
  }
 // 4. Chay khi có Dependencies thay đổi , trong hàm này có thể dùng biến context
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

// 5. Hàm Build
  @override
  Widget build(BuildContext context) {
    if(mounted) print("State đang tồn tại");
    else print("State không tồn tại");
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTile),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            // Hạn chế sử dụng Wiodget bằng hàm

            // Điểm toán
            InputWidget(
                lableText: diemToan,
                hintText: nhapDiemToan,
                controller: mathController!),
            const SizedBox(
              height: 10,
            ),
            // Điểm Văn
            InputWidget(
                lableText: diemVan,
                hintText: nhapDiemVan,
                controller: litetureController!),
            const SizedBox(
              height: 10,
            ),
            // Điểm Anh
            InputWidget(
                lableText: diemToan,
                hintText: nhapDiemAnh,
                controller: englishController!),
            const SizedBox(
              height: 30,
            ),
            // Đánh giá button
            ElevatedButton(
                onPressed: (){
                  // 7. setState
                  setState((){
                    averageMarkStr = ((double.parse(mathController!.text) + double.parse(litetureController!.text)+ double.parse(mathController!.text))/3).toString();
                    gradeStr = adjustStudent(averageMark: double.parse(averageMarkStr));
                  });

                },
                child: Text(adjustment)),
            const SizedBox(
              height: 30,
            ),

            // Information Card
            Container(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // Điểm TB
                      Row(
                        children: [
                        // Title
                          Text(averageMark + " : "),
                          Text(averageMarkStr)
                      ],),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          // Title
                          Text(grade + " : "),
                          Text(gradeStr)
                        ],),
                      // Học lực
                    ],
                  ),
                ),
              ),
            ),

            TextButton(
                onPressed: (){

                  var route = MaterialPageRoute(builder: (context) => InformationScreen(averageMarkStr: averageMarkStr, gradeStr: gradeStr));
                  Navigator.push(context, route);

                },
                child: Text(show))
          ],
        ),

      ),

    );
  }

  // 6. Build UpdateWidget
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // 8. deactivate
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // 9.

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathController!.dispose();
    litetureController!.dispose();
    englishController!.dispose();
  }

  //10.  mounted = false


  String adjustStudent({required double averageMark})
  {
    if(averageMark < 5) return "Chưa đạt";
    else if(averageMark < 8.5) return "Đạt";
    return "Xuất sắc" ;
  }

}
