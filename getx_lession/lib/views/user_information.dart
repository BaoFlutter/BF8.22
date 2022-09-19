import 'package:api_lession/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../models/user.dart';
class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();
    // UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: (){
            //Navigator.pop(context);
            Get.back();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name!),
            Text(user.email!)

          ],
        ),
      ),
    );

  }
}
