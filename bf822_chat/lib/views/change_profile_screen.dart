import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../resources/constants.dart';
import '../resources/utils/utils.dart';
import '../resources/widgets/auth/auth_button.dart';
import '../resources/widgets/change_profile/header_edit.dart';
import '../view_models/firebase_auth_controller.dart';



class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({Key? key}) : super(key: key);

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  File? avatarImage;
  late TextEditingController nameController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: context.read<FirebaseAuthController>().appUser!.displayName);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<FirebaseAuthController>().appUser;
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HeaderEdit(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24),
                        GestureDetector(
                            onTap: () {
                              Utils.showPickImageModelBottomSheet(
                                context,
                                onPickImage: (image) {
                                  setState(() {
                                    avatarImage = image;
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                avatarImage != null
                                    ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                  FileImage(avatarImage!),
                                )
                                    : CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                  Colors.grey.withOpacity(0.6),
                                  backgroundImage: user!.photoUrl != null
                                      ? NetworkImage(user.photoUrl!)
                                      : null,
                                  child: user.photoUrl != null
                                      ? null
                                      : Text(
                                      Utils.nameInit(
                                          user.displayName ?? ""),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue)),
                                ),
                                SvgPicture.asset(
                                  editIcon,
                                  color: primaryColor,
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                        SizedBox(height: 5),
                        Text(
                          Utils.userName(
                            context.read<FirebaseAuthController>().appUser!.email ?? "",
                          ),
                          style: txtMedium(12),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: txtSemiBold(18),
                          ),
                        ),
                        SizedBox(height: 6),
                        TextField(
                          controller: nameController,
                          style: txtMedium(18),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              hintText: "Name",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  editIcon,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              //prefixIcon: SizedBox(width: 24),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 0.5))),
                        ),
                        SizedBox(height: 42),
                        AuthButton(
                            title: "Update",
                            onTap: () async {
                              await context
                                  .read<FirebaseAuthController>()
                                  .updateUser(
                                  displayName: nameController.text,
                                  avatar: avatarImage)
                                  .then((value) {
                                if (value) {
                                  Navigator.pop(context);
                                }
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (context.watch<FirebaseAuthController>().isLoading)
          Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
