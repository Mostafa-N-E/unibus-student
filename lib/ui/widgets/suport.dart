import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/responsiveLayout.dart';


class SuportWidget extends StatefulWidget {
  SuportWidget({Key? key, }) : super(key: key);

  @override
  State<SuportWidget> createState() => _SuportWidgetState();
}

class _SuportWidgetState extends State<SuportWidget> {
  // final ContactEntity item = ContactEntity(
  //   email: "mostafa.nazari.est@gmail.com",
  //   number: 09376064697
  // );
  final String email= "mostafa.nazari.est@gmail.com";
  final int number= 0937606469;
  // List participants = [];
  bool fetched = false;


  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width = main_width;
    var screenHeight = MediaQuery.of(context).size.height;
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

    return Container(
        height: MediaQuery.of(context).size.height * .4,
        // color: Theme.of(context).colorScheme.secondary.withOpacity(0.87) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
          color: Colors.white,//Theme.of(context).colorScheme.secondary.withOpacity(0.87),
        ),
        child:Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.maximize_rounded,
                  size: h1_text_size * 2,
                  color: Colors.grey.shade400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                            child:Padding(
                              padding: EdgeInsets.only(
                                  right: 0),
                              child:ListTile(
                                // leading: Icon(
                                //   LineAwesomeIcons.instagram,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 1.0,
                                // ),
                                // trailing: Icon(
                                //   LineariconsFree.chevron_left,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 0.8,
                                // ),
                                hoverColor: Colors.white,
                                title: Text(
                                  "پشتیبانی",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: h1_text_size * 0.76,
                                      fontFamily: "Sahel",
                                      fontWeight: FontWeight.w800
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Text(
                                  "راه های  ارتباط با پشتیبانی اپلیکیشن",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.66,
                                      fontFamily: "Sahel",
                                    fontWeight: FontWeight.w600

                                  ),
                                ),
                                dense: true,
                              ),

                            ),

                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                            child:Padding(
                              padding: EdgeInsets.only(
                                  right: 0),
                              child:ListTile(
                                // leading: Icon(
                                //   LineAwesomeIcons.instagram,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 1.0,
                                // ),
                                // trailing: Icon(
                                //   LineariconsFree.chevron_left,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 0.8,
                                // ),
                                hoverColor: Colors.white,
                                // title: Text(
                                //   "پشتیبانی",
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       fontSize: h1_text_size * 0.76,
                                //       fontFamily: "Sahel",
                                //       fontWeight: FontWeight.w700
                                //   ),
                                // ),
                                isThreeLine: true,
                                subtitle: Text(
                                  "اگر برای ورود به اپلیکیشن دچار مشکل شده اید می توانید ابتدا به اداره رفاه دانشگاه مراجعه و یا با پشتیبانی اپلیکیشن تماس بگیرید",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.6,
                                      fontFamily: "Sahel"

                                  ),
                                ),
                                dense: true,
                              ),

                            ),

                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                            child:Padding(
                              padding: EdgeInsets.only(
                                  right: 0),
                              child:ListTile(
                                leading: Icon(
                                  LineariconsFree.phone_handset,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: h1_text_size * 0.8,
                                ),
                                // trailing: Icon(
                                //   LineariconsFree.chevron_left,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 0.8,
                                // ),
                                hoverColor: Colors.white,
                                title: Text(
                                  "شماره تماس",
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.76,
                                      fontFamily: "Sahel",
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Text(
                                  "0937 606 4697",//item.number.toString(),
                                  style: TextStyle(
                                    letterSpacing: 2.5,
                                      fontSize: b_text_size * 0.66,
                                      fontFamily: "Sahel"

                                  ),
                                ),
                                dense: true,
                                onTap: () {
                                  // if(item.number != 0){
                                  //   launchUrl(
                                  //       Uri.parse(
                                  //           item.number.toString()
                                  //       )
                                  //   );
                                  // }
                                },
                              ),

                            ),

                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                            child:Padding(
                              padding: EdgeInsets.only(
                                  right: 0),
                              child:ListTile(
                                leading: Icon(
                                  LineariconsFree.envelope,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: h1_text_size * 0.83,
                                ),
                                // trailing: Icon(
                                //   LineariconsFree.chevron_left,
                                //   color: Colors.black87,
                                //   size: h1_text_size * 0.8,
                                // ),
                                hoverColor: Colors.white,
                                title: Text(
                                  "ایمیل",
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.76,
                                      fontFamily: "Sahel",
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Text(
                                  email,
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.66,
                                      fontFamily: "Sahel"

                                  ),
                                ),
                                dense: true,
                                onTap: () {
                                  // if(item.email != ""){
                                  //   launchUrl(
                                  //       Uri.parse(
                                  //           item.email
                                  //       )
                                  //   );
                                  // }
                                },
                              ),

                            ),

                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              )

            ]
        )

    );
  }



}