import 'package:api_lession/data_sources/api_service.dart';
import 'package:api_lession/resources/utils/log.dart';
import 'package:api_lession/resources/widgets/input_field.dart';
import 'package:api_lession/views/home_screeen.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  TextEditingController? emailController, passwordController ;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // email Text Field
                    InputField(labelText: "Email", controller: emailController!),
                    const SizedBox(height: 10,),
                    // Password TextField
                    InputField(labelText: "Password", controller: passwordController!),
                    // Button - Login
                    ElevatedButton(
                        onPressed: () async {
                          // login
                          Map loginData = {
                            'email': emailController!.text,
                            'password': passwordController!.text
                          };
                          Future loginResponse = ApiService().signIn(loginData: loginData);
                          var decodedData;
                          try{
                             decodedData = await loginResponse;
                          }
                          catch(e)
                          {
                            print(e);
                          }
                          var data = convert.jsonDecode(decodedData.body);
                          Log().printJson(json: data);

                          if(data['status'] == 'success') {
                            String token = data['token'];
                            SharedPreferences pref = await _prefs;
                            await pref.setString("token", token);

                            var route = MaterialPageRoute(builder: (context)=>HomeScreen() );
                            Navigator.push(context, route);
                          }
                          else {
                            final snackBar = SnackBar(
                              content: const Text('Đăng nhập lỗi'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }




                        },
                        child: Text("Login"))

                  ],
                ),
              ),

            )
        ),
      ),
    );
  }
}

