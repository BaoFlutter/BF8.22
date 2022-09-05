import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/resources/strings.dart';

class SharedPreferenceInformationScreen extends StatefulWidget {
  const SharedPreferenceInformationScreen({Key? key}) : super(key: key);



  @override
  State<SharedPreferenceInformationScreen> createState() => _SharedPreferenceInformationScreenState();
}

class _SharedPreferenceInformationScreenState extends State<SharedPreferenceInformationScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String>? futureAverage;

  @override
  void initState() {
    super.initState();
    futureAverage = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('average_mark') ?? "Chưa xác định";
    });

  }

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
              child: FutureBuilder<String>(
                future: futureAverage,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return Center(
                    child: CircularProgressIndicator(),
                  );
                  if(snapshot.hasError) return Center(
                    child: Text("Load Data Error!!"),
                  );
                  String averageMark = snapshot.data!;
                  return Center(
                    child: Text(averageMark),
                  );
                },
              )
            ),
          ),
        ),

      ),
    );
  }
}


