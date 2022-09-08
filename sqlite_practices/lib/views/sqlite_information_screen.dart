import 'package:flutter/material.dart';
import 'package:state_lession/databases/information_database.dart';

import '../models/information.dart';
import '../resources/strings.dart';
class SQLiteInformationScreen extends StatefulWidget {
  const SQLiteInformationScreen({Key? key}) : super(key: key);

  @override
  State<SQLiteInformationScreen> createState() => _SQLiteInformationScreenState();
}

class _SQLiteInformationScreenState extends State<SQLiteInformationScreen> {

  InformationDatabase db = InformationDatabase();

  Future<List<Information>>? futureList;

  @override
  void initState() {
    super.initState();
    futureList = db.fetchAll();
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
            child: Container(
                padding: const EdgeInsets.all(15),
                child: FutureBuilder<List<Information>>(
                  future: futureList,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return Center(
                      child: CircularProgressIndicator(),
                    );
                    if(snapshot.hasError) return Center(
                      child: Text("Load Data Error!!"),
                    );
                    List<Information>  futureList = snapshot.data!;
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: futureList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Information information = futureList[index];
                          return Container(
                            height: 50,
                            child: Row(
                              children: [
                                Text(information.average_mark!),
                                const SizedBox(width: 5,),
                                Text(information.grade!)
                              ],
                            )
                          );
                        }
                    );
                  },
                )

          ),
        ),

      ),
    );
  }


}
