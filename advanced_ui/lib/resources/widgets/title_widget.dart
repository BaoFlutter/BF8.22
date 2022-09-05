import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String address;
  final int rate;

  const TitleWidget({Key? key, required this.title, required this.address, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // text
          Expanded(
            flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text(address),
                  ],
                ),
              ),),

          // star, index
          Expanded(
            flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.red,),
                    Text(rate.toString())
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
