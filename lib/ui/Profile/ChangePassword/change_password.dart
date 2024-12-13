// import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

import '../../../../utils/responsiveLayout.dart';
import '../../../common/http_client.dart';
import '../../../data/repo/auth_repository.dart';
import '../../widgets/progress_indicator.dart';
import '../../widgets/snackbar.dart';


class ChangePasswordPage extends StatefulWidget {
  // UserEntity user;
  final Function() notifyParent;
  ChangePasswordPage({
    Key? key,
    // required this.user,
    required this.notifyParent
  }) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {


  final TextEditingController controller_password = TextEditingController();
  final TextEditingController controller_password_Confirmation = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    controller_password.dispose();
    controller_password_Confirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    final bool rotated = MediaQuery.of(context).size.height < width;
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.085,
        min_size: width * 0.12,
        max_size: width * 0.03,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: IconButton(
          icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
        child: Container(
          margin: EdgeInsets.only(top: 20, right: 40, left: 40, bottom: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Icon(
                      LineariconsFree.lock_1,
                      size: h1_text_size * 3.3,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "تغییر رمز عبور",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: h1_text_size,
                        fontFamily: "Sahel",
                      color: Colors.grey.shade400,

                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('کاربر عزیز لطفا پسورد خود را ترکیبی از حروف و اعداد قرار دهید',

                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: b_text_size * 0.8,
                    // letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sahel",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 10,
                  ),
                  height: 57.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(
                            context)
                            .colorScheme
                            .secondary
                            .withOpacity(
                            1) as Color),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.01),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.01),
                        // blurRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: controller_password,
                    textAlignVertical:
                    TextAlignVertical.center,
                    // textCapitalization:
                    // TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder:
                      const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                      border: InputBorder.none,
                      // hintText: AppLocalizations.of(context)!.enterName,
                      hintText: "رمز عبور جدید",
                      hintStyle: const TextStyle(
                        // color: Colors.white60,
                      ),
                    ),
                    onSubmitted: (String value) async {
                      // if (value.trim() == '') {
                      //   await _addUserData(
                      //     AppLocalizations.of(context)!.guest,
                      //   );
                      // } else {
                      //   await _addUserData(value.trim());
                      // }
                      // Navigator.popAndPushNamed(
                      //   context,
                      //   '/pref',
                      // );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 10,
                  ),
                  height: 57.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(
                            context)
                            .colorScheme
                            .secondary
                            .withOpacity(
                            1) as Color),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.01),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.01),
                        // blurRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: controller_password_Confirmation,
                    textAlignVertical:
                    TextAlignVertical.center,
                    // textCapitalization:
                    // TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder:
                      const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                      border: InputBorder.none,
                      // hintText: AppLocalizations.of(context)!.enterName,
                      hintText: "تکرار رمز عبور جدید",
                      hintStyle: const TextStyle(
                        // color: Colors.white60,
                      ),
                    ),
                    onSubmitted: (String value) async {
                      // if (value.trim() == '') {
                      //   await _addUserData(
                      //     AppLocalizations.of(context)!.guest,
                      //   );
                      // } else {
                      //   await _addUserData(value.trim());
                      // }
                      // Navigator.popAndPushNamed(
                      //   context,
                      //   '/pref',
                      // );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 15),
        child: InkWell(
          onTap: () async {

            Map body = {};
            if(
                controller_password.text != "" ||
                controller_password_Confirmation.text != ""
            ){
              if(controller_password.text.length < 8){
                ShowSnackBar().showSnackBar(
                  context,
                  "رمز عبور باید بیش از ۸ کاراکتر باشد",
                  duration: const Duration(seconds: 10),
                  noAction: false,
                  background_color: Colors.red,
                  text_color: Colors.white,
                );
              }else if(controller_password.text != controller_password_Confirmation.text){
                ShowSnackBar().showSnackBar(
                  context,
                  "رمز عبور ها با هم مطابق نیست",
                  duration: const Duration(seconds: 10),
                  noAction: false,
                  background_color: Colors.red,
                  text_color: Colors.white,
                );
              }else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CustomProgressIndicator(),
                    );
                  },
                );
                body = {
                  "new_password1": controller_password_Confirmation.text,
                  "new_password2": controller_password.text,

                };
                Map response = {'status': false, 'message':""};
                try{
                  response = await authRepository.password_reset(body);
                }catch(e){ //on AppException
                  Navigator.of(context, rootNavigator: true).pop();
                  ShowSnackBar().showSnackBar(
                    context,
                    "خطا",//e.toString(),//.message,
                    duration: const Duration(seconds: 10),
                    noAction: false,
                    background_color: Colors.red[600],
                    text_color: Colors.white,
                  );
                }
                if (response['status'] == true){
                  widget.notifyParent();
                  // global_userInfo = await userRepository.get_user_info(refresh: true);
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context).pop();
                  ShowSnackBar().showSnackBar(
                    context,
                    "ارسال شد",
                    duration: const Duration(seconds: 3),
                    noAction: false,
                    background_color: Colors.green[600],
                  );
                }else{
                  ShowSnackBar().showSnackBar(
                    context,
                    response['message'],
                    duration: const Duration(seconds: 3),
                    noAction: false,
                    background_color: Colors.red.shade600,
                  );
                }
              }




            }else{
              ShowSnackBar().showSnackBar(
                context,
                "موارد خواسته شده را وارد کنید",//e.toString(),//.message,
                duration: const Duration(seconds: 10),
                noAction: false,
                background_color: Colors.red[600],
                text_color: Colors.white,
              );
            }





          },
          child: Material(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius:
            BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)
            ),
            elevation: 2,
            child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width /
                    1.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(5)
                  ),
                  // border: Border.all(
                  //     color: Colors.orange, width: 1),
                ),
                child: Center(
                    child: Text('تایید و تغییر رمزعبور',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        // letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sahel",
                      ),
                      textAlign: TextAlign.center,
                    )
                )
            ),
          ),
        ),
      ),
    );

  }
}

