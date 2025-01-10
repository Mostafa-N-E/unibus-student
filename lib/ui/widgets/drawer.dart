import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rajaee_web_app/common/http_client.dart';
import '../../config.dart';
import '../../data/repo/auth_repository.dart';
import '../../theme.dart';
import '../Profile/CardManagement/cardManagement.dart';
import '../Profile/ChangePassword/change_password.dart';
import '../Profile/Notifications/MainPage/notifications.dart';
import '../auth/auth.dart';
import 'gradient_container.dart';

class PublicDrawer extends StatefulWidget{
  const PublicDrawer();

  @override
  State<PublicDrawer> createState() => _PublicDrawerState();
}

class _PublicDrawerState extends State<PublicDrawer> {
  final MyTheme currentTheme = GetIt.I<MyTheme>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool rotated = MediaQuery.of(context).size.height < width;
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;
    
    TextStyle text_style = TextStyle(
        fontSize: 14,
        fontFamily: 'Sahel',
        fontWeight: FontWeight.w500,
        // color: Colors.black87
    );


    return Drawer(
      child: Container(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              // backgroundColor: ,
              automaticallyImplyLeading: false,
              elevation: 0,
              stretch: true,
              // expandedHeight: MediaQuery.of(context).size.height * 0.3,
              expandedHeight: 180,
              flexibleSpace: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: ListTile(
                      // isThreeLine: true,
                      title: Text(
                        "UNIMI",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            // fontFamily: "Sahel",
                          fontSize: 19
                        ),
                      ),
                      // subtitle: Text(
                      //   "1.0.0",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontFamily: "Sahel"
                      //   ),
                      // ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, '/profile');
                        // _onItemTapped(2);
                      },
                      leading:  CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/ic_launcher.png"),
                      ),
                      trailing: InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            isDarkMode ? LineariconsFree.sun : LineariconsFree.moon,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        onTap: () {
                          currentTheme.switchTheme(
                            isDark: isDarkMode ? false : true,
                            useSystemTheme: false,
                          );
                          setState(() {});
                        },
                      ),

                    ),
                  ),
                  ListTile(
                    isThreeLine: true,
                    title: Text(
                      global_userInfo.first_name+" "+global_userInfo.last_name,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Sahel"
                      ),
                    ),
                    subtitle: Text(
                      global_userInfo.id.toString().toPersianDigit(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sahel"
                      ),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, '/profile');
                      // _onItemTapped(2);
                    },
                    leading:  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        LineariconsFree.user_1,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    trailing: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          LineariconsFree.exit,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        30)),
                                // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                //   title: Text("اطلاعات تگ :"),
                                content: Container(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(30)
                                  // ),
                                  height: MediaQuery.of(context)
                                      .size
                                      .height * 0.35,
                                  // color: data!['status'] as bool ? Colors.green : Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Text('${value["nfca"]["identifier"]}'),
                                      Icon(
                                        LineariconsFree.warning,
                                        color:  Colors.yellow[700],
                                        size: 170,
                                      ),
                                      Text(
                                        "آیا اطمینان دارید؟؟..",
                                        style: TextStyle(
                                          // color: Colors.red,
                                          // fontSize: 20
                                        ),
                                      ),

                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black87,
                                            foregroundColor: Colors.yellow[700],
                                            minimumSize: Size(88, 36),
                                            // padding: EdgeInsets.symmetric(horizontal: 16),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                            ),
                                          ),
                                          child: Text('بله'),
                                          onPressed: () {
                                            // Navigator.pop(context);
                                            // Navigator.pushNamed(context, '/');
                                            authRepository.signOut();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) => AuthScreen()
                                                  //     Directionality(
                                                  //     textDirection: TextDecoration.rtl,
                                                  //     child: AuthScreen()
                                                  // ),
                                                )
                                            );
                                          })

                                    ],
                                  ),
                                ));
                            ;
                          },
                        );

                      },
                    ),

                  )
                ],
              ),
              // flexibleSpace: FlexibleSpaceBar(
              //   title: RichText(
              //     text: TextSpan(
              //       text: "Uni Student",
              //       style: const TextStyle(
              //         fontSize: 10.0,
              //         fontWeight: FontWeight.w100,
              //       ),
              //       children: <TextSpan>[
              //         TextSpan(
              //           text: "1.0.0",// appVersion == null ? '' : '\nv$appVersion',
              //           style: const TextStyle(
              //             fontSize: 7.0,
              //           ),
              //         ),
              //       ],
              //     ),
              //     textAlign: TextAlign.start,
              //   ),
              //   titlePadding: const EdgeInsets.only(bottom: 40.0),
              //   centerTitle: true,
              //   // background: ShaderMask(
              //   //   shaderCallback: (rect) {
              //   //     return LinearGradient(
              //   //       begin: Alignment.topCenter,
              //   //       end: Alignment.bottomCenter,
              //   //       colors: [
              //   //         Colors.black.withOpacity(0.8),
              //   //         Colors.black.withOpacity(0.1),
              //   //       ],
              //   //     ).createShader(
              //   //       Rect.fromLTRB(0, 0, rect.width, rect.height),
              //   //     );
              //   //   },
              //   //   blendMode: BlendMode.dstIn,
              //   //   child: Image(
              //   //     fit: BoxFit.cover,
              //   //     alignment: Alignment.topCenter,
              //   //     image: AssetImage(
              //   //       // Theme.of(context).brightness == Brightness.dark
              //   //       //     ? 'assets/header-dark.jpg'
              //   //       //     : 'assets/header.jpg',
              //   //         'assets/images/iii.png'
              //   //     ),
              //   //   ),
              //   // ),
              // ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // ListTile(
                  //   title: Text(
                  //     "خانه",
                  //     style: TextStyle(
                  //       color: Theme.of(context).colorScheme.secondary,
                  //     ),
                  //   ),
                  //   contentPadding:
                  //   const EdgeInsets.symmetric(horizontal: 20.0),
                  //   leading: Icon(
                  //     LineariconsFree.home,
                  //     color: Theme.of(context).colorScheme.secondary,
                  //   ),
                  //   selected: true,
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text("پروفایل"),
                  //   contentPadding:
                  //   const EdgeInsets.symmetric(horizontal: 20.0),
                  //   leading: Icon(
                  //     LineariconsFree.user_1,
                  //     color: Theme.of(context).iconTheme.color,
                  //   ),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     // Navigator.pushNamed(context, '/profile');
                  //     // _onItemTapped(2);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text("سرویس"),
                  //   contentPadding:
                  //   const EdgeInsets.symmetric(horizontal: 20.0),
                  //   leading: Icon(
                  //     LineariconsFree.bus,
                  //     color: Theme.of(context).iconTheme.color,
                  //   ),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     // Navigator.pushNamed(context, '/reserve');
                  //     // _onItemTapped(1);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text("تغذیه"),
                  //   contentPadding:
                  //   const EdgeInsets.symmetric(horizontal: 20.0),
                  //   leading: Icon(
                  //     LineariconsFree.dinner,
                  //     color: Theme.of(context).iconTheme.color,
                  //   ),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     // Navigator.pushNamed(context, '/reserve');
                  //     // _onItemTapped(1);
                  //   },
                  // ),

                  ListTile(
                    title: Text("تغییر رمز عبور",
                        style: text_style
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    leading: Icon(
                      LineariconsFree.lock_1,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => new ChangePasswordPage(notifyParent: () {  },),
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Text("کارت ها",
                        style: text_style
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    leading: Icon(
                      CupertinoIcons.creditcard,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => new CardManagementScreen(),
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Text("اطلاعیه ها",
                        style: text_style
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    leading: Icon(
                      LineariconsFree.bullhorn,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => new NotificationScreen(),
                          )
                      );
                    },
                  ),

                  ListTile(
                    title: Text("درباره",style: text_style,),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    leading: Icon(
                      LineariconsFree.question_circle,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),


                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: Center(
                      child: Text(
                        // AppLocalizations.of(context)!.madeBy,
                        "ساخته شده توسط مصطفا",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
