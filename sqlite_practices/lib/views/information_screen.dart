import 'package:flutter/material.dart';
import 'package:state_lession/resources/strings.dart';
class InformationScreen extends StatelessWidget {
  final String averageMarkStr;
  final String gradeStr;
  const InformationScreen({Key? key, required this.averageMarkStr, required this.gradeStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(information),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Container(
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

      ),
    );
  }
}
