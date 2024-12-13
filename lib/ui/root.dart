import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:rajaee_web_app/ui/widgets/drawer.dart';
import 'package:rajaee_web_app/ui/widgets/gradient_container.dart';
import '../../ui/Profile/MainPage/profile.dart';
import '../../ui/auth/auth.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../config.dart';
import '../data/repo/auth_repository.dart';
import '../theme.dart';
import '../utils/responsiveLayout.dart';
import 'BusService/Bus/bus.dart';
import 'FoodService/Food/food.dart';
import 'Profile/CardManagement/cardManagement.dart';
import 'Profile/ChangePassword/change_password.dart';
import 'Profile/Notifications/MainPage/notifications.dart';

const int foodServiceIndex = 0;
const int busServiceIndex = 1;
const int dormitoryServiceIndex = 2;
const int profileIndex = 3;

GlobalKey<ScaffoldState> _rootScaffoldKey = GlobalKey();


class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final MyTheme currentTheme = GetIt.I<MyTheme>();
  // int selectedScreenIndex = foodIndex;
  final ValueNotifier<int> selectedScreenIndex = ValueNotifier<int>(foodServiceIndex);
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _dormitoryServiceKey = GlobalKey();
  final GlobalKey<NavigatorState> _foodServiceKey = GlobalKey();
  final GlobalKey<NavigatorState> _busServiceKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    dormitoryServiceIndex: _dormitoryServiceKey,
    foodServiceIndex: _foodServiceKey,
    busServiceIndex: _busServiceKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex.value]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex.value = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex.value != index
        ? Container()
        : Navigator(
        key: key,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => Offstage(
                offstage: selectedScreenIndex.value != index, child: child)));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool rotated = MediaQuery.of(context).size.height < screenWidth;
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;

    // bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;
    double container_margin  = ResponsiveSizeWidget(
        largeScreen_size: screenWidth * 0.07,
        mediumScreen_size: screenWidth * 0,
        smallScreen_size: screenWidth * 0,
        min_size: screenWidth * 0,
        max_size: screenWidth * 0.07,
        context: context
    ).get_width_size();
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: screenHeight * 0.12,
        mediumScreen_size: screenHeight * 0.13,
        smallScreen_size: screenHeight * 0,
        min_size: screenHeight * 0,
        max_size: screenHeight * 0.11,
        context: context
    ).get_height_size();

    List<Widget> actions = [
      Container(
        // height: 90,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Directionality(textDirection: TextDirection.rtl,child: ChangePasswordPage(notifyParent: () {  },)),
                )
            );
          },
          child: Icon(
            LineariconsFree.lock_1,
            color: AppTheme.currentTheme.getIconColor(),
          ),
        ),
      ),
      // Container(
      //   // height: 90,
      //   padding: EdgeInsets.symmetric(horizontal: 15),
      //   child: InkWell(
      //     onTap: () {
      //       // Navigator.of(context).push(
      //       //     MaterialPageRoute(
      //       //       builder: (BuildContext context) => new NotificationScreen(),
      //       //     )
      //       // );
      //     },
      //     child: Icon(
      //       LineariconsFree.lnr_bubble,
      //       color: Colors.black87,
      //     ),
      //   ),
      // ),
      Container(
        // height: 90,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Directionality(textDirection: TextDirection.rtl,child: NotificationScreen()),
                )
            );
          },
          child: Icon(
            LineariconsFree.bullhorn,
            color: AppTheme.currentTheme.getIconColor(),
          ),
        ),
      ),
      // Container(
      //   // height: 90,
      //   padding: EdgeInsets.symmetric(horizontal: 15),
      //   child: InkWell(
      //     onTap: () {
      //       Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (BuildContext context) => new ProfileDetailScreen(),
      //           )
      //       );
      //     },
      //     child: Icon(
      //       LineariconsFree.license,
      //       color: Colors.black87,
      //     ),
      //   ),
      // ),
      Container(
        // height: 90,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Directionality(textDirection: TextDirection.rtl,child:  CardManagementScreen()),
                )
            );
          },
          child: Icon(
            CupertinoIcons.creditcard,
            color: AppTheme.currentTheme.getIconColor(),
          ),
        ),
      ),

    ];
    final AppBar general_appbar = AppBar(
      // backgroundColor: Colors.white,
      shadowColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)
        ),
      ),
      actions: actions,
      leading: (ResponsiveLayout.isMobileSmall(context) || ResponsiveLayout.isMobileMedium(context) || ResponsiveLayout.isMobileLarge(context)) ?
      Builder(builder: (context) => IconButton(
          icon: Icon(
            LineariconsFree.menu,
            color: AppTheme.currentTheme.getIconColor(),
          ),
          onPressed: () => Scaffold.of(context).openDrawer()
      ),
      ) : null,
    );

    return WillPopScope(
        child: Scaffold(
          key: _rootScaffoldKey,
          appBar: rotated ?
          AppBar(
            shadowColor: Theme.of(context).shadowColor,
            toolbarHeight: app_bar_height ,
            // backgroundColor: Colors.white,
            flexibleSpace: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/ic_launcher.png"),
                      ValueListenableBuilder(
                        valueListenable: selectedScreenIndex,
                        builder:
                            (BuildContext context, int indexValue, Widget? child) {
                          return AnimatedContainer(
                            // width: MediaQuery.of(context).size.width /2,
                            duration: const Duration(milliseconds: 300),
                            // height: 60,
                            child: SalomonBottomBar(
                              margin: EdgeInsets.only(
                                // left: MediaQuery.of(context).size.width * 0.7,
                                  right: MediaQuery.of(context).size.width * 0.02
                              ),
                              // unselectedItemColor: Colors.grey[800],
                              currentIndex: indexValue,
                              onTap: (index) {
                                setState(() {
                                  _history.remove(selectedScreenIndex.value);
                                  _history.add(selectedScreenIndex.value);
                                  selectedScreenIndex.value = index;
                                });
                              },
                              items: [
                                SalomonBottomBarItem(
                                  icon: const Icon(LineariconsFree.dinner, size: 30),
                                  title: Text(
                                    screenWidth < 350 ?  "":
                                    "تغذیه",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 16,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),),
                                  selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                                SalomonBottomBarItem(
                                  icon: const Icon(LineariconsFree.bus, size: 30),
                                  title: Text(
                                    screenWidth < 350 ?  "":
                                    "سرویس",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 16,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),),
                                  selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                                SalomonBottomBarItem(
                                  icon: const Icon(LineariconsFree.apartment, size: 30),//MdiIcons
                                  title: Text(
                                    screenWidth < 350 ?  "":
                                    'خوابگاه',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 16,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),),//AppLocalizations.of(context)!.youTube
                                  selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                                SalomonBottomBarItem(
                                  icon: const Icon(LineariconsFree.user_1, size: 30,),//MdiIcons
                                  title: Text(
                                    screenWidth < 350 ?  "":
                                    'پروفایل',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 16,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),),//AppLocalizations.of(context)!.youTube
                                  selectedColor: Theme.of(context).colorScheme.secondary,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width * 0.7,
                        left: MediaQuery.of(context).size.width * 0.03
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            // left: MediaQuery.of(context).size.width * 0.7,
                              left: 20
                          ),
                          child: InkWell(
                            child: Icon(
                              isDarkMode ? LineariconsFree.sun : LineariconsFree.moon,
                              color: Theme.of(context).iconTheme.color,
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
                        Padding(
                          padding: EdgeInsets.only(
                            // left: MediaQuery.of(context).size.width * 0.7,
                              left: 20
                          ),
                          child: InkWell(
                            child: Icon(
                              LineariconsFree.question_circle,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              // Navigator.pushNamed(context, '/about');
                            },
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            LineariconsFree.exit,
                            color: Theme.of(context).iconTheme.color,
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
                                                      builder: (BuildContext context) => Directionality(
                                                          textDirection: TextDirection.rtl,
                                                          child: AuthScreen()
                                                      ),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            leading: null,
          ) :
          // (selectedScreenIndex.value == 3 && !rotated) ?
          // AppBar(
          //   actions: [
          //     Container(
          //       // height: 90,
          //       padding: EdgeInsets.symmetric(horizontal: 15),
          //       child: InkWell(
          //         onTap: () {},
          //         child: Icon(
          //           LineariconsFree.alarm,
          //           color: Colors.black87,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       // height: 90,
          //       padding: EdgeInsets.symmetric(horizontal: 15),
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (BuildContext context) => new CardManagementScreen(),
          //               )
          //           );
          //         },
          //         child: Icon(
          //           CupertinoIcons.creditcard,
          //           color: Colors.black87,
          //         ),
          //       ),
          //     ),
          //   ],
          //   leading: Builder(builder: (context) => // Ensure Scaffold is in context
          //   IconButton(
          //       icon: Icon(
          //           LineariconsFree.menu,
          //         color: Colors.black87,
          //       ),
          //       onPressed: () => Scaffold.of(context).openDrawer()
          //   ),
          //   ),
          // ) :
          selectedScreenIndex.value == profileIndex ? general_appbar : null,
          body: rotated ?
          GradientContainer(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/background.jpeg"),
            //       fit: BoxFit.cover,
            //     ),
            // ),
            child: Container(
              margin: EdgeInsets.only(
                  bottom: container_margin * 0.60,
                  top: container_margin * 0.60,
                  left: container_margin * 1,
                  right: container_margin * 1
              ),
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  // border: Border.all(
                  //   color: Colors.black87,
                  // ),
                  // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: IndexedStack(
                index: selectedScreenIndex.value,
                children: [
                  // _navigator(_foodKey, foodIndex, const HomeScreen()),
                  _navigator(
                      _foodServiceKey,
                      foodServiceIndex,
                      const FoodScreen()
                  ),
                  _navigator(
                      _busServiceKey,
                      busServiceIndex,
                      // const Center(
                      //   child: Text('Bus Service'),
                      // )
                      const BusScreen()
                  ),
                  _navigator(
                      _dormitoryServiceKey,
                      dormitoryServiceIndex,
                      const Center(
                        child: Image(image: AssetImage("assets/images/dormitory.png")),
                      )
                  ),
                  _navigator(
                      _profileKey,
                      profileIndex,
                      ProfileScreen()
                  ),
                ],
              ),
            ),
          ):
          IndexedStack(
            index: selectedScreenIndex.value,
            children: [
              // _navigator(_foodKey, foodIndex, const HomeScreen()),

              _navigator(
                  _foodServiceKey,
                  foodServiceIndex,
                  const FoodScreen()
              ),
              _navigator(
                  _busServiceKey,
                  busServiceIndex,
                  const BusScreen()
              ),
              _navigator(
                  _dormitoryServiceKey,
                  dormitoryServiceIndex,
                  GradientContainer(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: 0,
                              ),
                              child: Text(
                                "غیر فعال است",
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w900
                                ),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: InkWell(
                              onTap: (){
                                // BlocProvider.of<FoodBloc>(context).add(FoodRefresh());
                              },
                              child: Icon(
                                  LineariconsFree.hourglass,
                                  size: 35,
                                  color: Colors.grey.shade500//Theme.of(context).colorScheme.secondary.withOpacity(1),
                              ),
                            ),
                          ),
                        ]
                    ),
                  )
              ),
              _navigator(
                  _profileKey,
                  profileIndex,
                  ProfileScreen()
              ),
            ],
          ),




          bottomNavigationBar: rotated
              ? null
              :
          GradientContainer(
            child: Padding(
              // padding: EdgeInsets.only(right: 35, bottom: 0),
              padding: EdgeInsets.only(right: screenWidth * 0.08, left: screenWidth * 0.08),
              child: Card(
                // color:  Theme.of(context).colorScheme.secondary.withOpacity(0.17) ,
                // shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                // margin: EdgeInsets.fromLTRB(7, 7, 7, 10),
                child: Container(
                  // margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                  decoration: BoxDecoration(
                    // color: isDarkMode ? Colors.black87 : Colors.white,
                    //   color: Color(0xF5F5F5),
                      boxShadow: [
                        //if(isDarkMode)
                        BoxShadow(
                          // color: Theme.of(context).colorScheme.primary,
                          // color: Colors.grey.withOpacity(0.19),
                          offset: Offset(0, 130),
                          // blurRadius: 0,
                          // spreadRadius: 0, // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: selectedScreenIndex,
                    builder:
                        (BuildContext context, int indexValue, Widget? child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // height: 60,
                        child: SalomonBottomBar(
                          // unselectedItemColor: Colors.grey[800],
                          currentIndex: indexValue,
                          onTap: (index) {
                            setState(() {
                              _history.remove(selectedScreenIndex.value);
                              _history.add(selectedScreenIndex.value);
                              selectedScreenIndex.value = index;
                            });
                          },
                          items: [
                            SalomonBottomBarItem(
                              icon: const Icon(LineariconsFree.dinner),
                              title: Text(
                                screenWidth < 350 ?  "":
                                "تغذیه",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  fontSize: 13,
                                  fontFamily: 'Sahel',
                                  fontWeight: FontWeight.w900,
                                ),),
                              selectedColor:
                              Theme.of(context).colorScheme.secondary,
                            ),
                            SalomonBottomBarItem(
                              icon: const Icon(LineariconsFree.bus),
                              title: Text(
                                screenWidth < 350 ?  "":
                                "سرویس",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  fontSize: 13,
                                  fontFamily: 'Sahel',
                                  fontWeight: FontWeight.w900,
                                ),),
                              selectedColor:
                              Theme.of(context).colorScheme.secondary,
                            ),
                            SalomonBottomBarItem(
                              icon: const Icon(LineariconsFree.apartment),//MdiIcons
                              title: Text(
                                screenWidth < 350 ?  "":
                                'خوابگاه',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  fontSize: 13,
                                  fontFamily: 'Sahel',
                                  fontWeight: FontWeight.w900,
                                ),),//AppLocalizations.of(context)!.youTube
                              selectedColor:
                              Theme.of(context).colorScheme.secondary,
                            ),
                            SalomonBottomBarItem(
                              icon: const Icon(LineariconsFree.user_1),//MdiIcons
                              title: Text(
                                screenWidth < 350 ?  "":
                                'پروفایل',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  fontSize: 13,
                                  fontFamily: 'Sahel',
                                  fontWeight: FontWeight.w900,
                                ),),//AppLocalizations.of(context)!.youTube
                              selectedColor: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),


          drawer:
          selectedScreenIndex.value == profileIndex ?
          rotated ? null : PublicDrawer()
          : null,


          // bottomNavigationBar: rotated
          //     ?
          // null
          //     :
          // Padding(
          //   // padding: EdgeInsets.only(right: 35),
          //   padding: EdgeInsets.only(right: 0),
          //
          //   child: Card(
          //     elevation: 10,
          //     margin: EdgeInsets.all(0),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(5), topLeft: Radius.circular(5)
          //         )
          //     ),
          //     child: ValueListenableBuilder(
          //       valueListenable: selectedScreenIndex,
          //       builder:
          //           (BuildContext context, int indexValue, Widget? child) {
          //         return AnimatedContainer(
          //           duration: const Duration(milliseconds: 300),
          //           // height: 60,
          //           child: SalomonBottomBar(
          //             // unselectedItemColor: Colors.grey[800],
          //             currentIndex: indexValue,
          //             onTap: (index) {
          //               setState(() {
          //                 _history.remove(selectedScreenIndex.value);
          //                 _history.add(selectedScreenIndex.value);
          //                 selectedScreenIndex.value = index;
          //               });
          //             },
          //             items: [
          //               SalomonBottomBarItem(
          //                 icon: const Icon(LineariconsFree.dinner),
          //                 title: Text(
          //                   screenWidth < 350 ?  "":
          //                   "تغذیه",
          //                   style: TextStyle(
          //                     color: Theme.of(context)
          //                         .colorScheme
          //                         .secondary,
          //                     fontSize: 13,
          //                     fontFamily: 'Sahel',
          //                     fontWeight: FontWeight.w900,
          //                   ),),
          //                 selectedColor:
          //                 Theme.of(context).colorScheme.secondary,
          //               ),
          //               SalomonBottomBarItem(
          //                 icon: const Icon(LineariconsFree.bus),
          //                 title: Text(
          //                   screenWidth < 350 ?  "":
          //                   "سرویس",
          //                   style: TextStyle(
          //                     color: Theme.of(context)
          //                         .colorScheme
          //                         .secondary,
          //                     fontSize: 13,
          //                     fontFamily: 'Sahel',
          //                     fontWeight: FontWeight.w900,
          //                   ),),
          //                 selectedColor:
          //                 Theme.of(context).colorScheme.secondary,
          //               ),
          //               SalomonBottomBarItem(
          //                 icon: const Icon(LineariconsFree.apartment),//MdiIcons
          //                 title: Text(
          //                   screenWidth < 350 ?  "":
          //                   'خوابگاه',
          //                   style: TextStyle(
          //                     color: Theme.of(context)
          //                         .colorScheme
          //                         .secondary,
          //                     fontSize: 13,
          //                     fontFamily: 'Sahel',
          //                     fontWeight: FontWeight.w900,
          //                   ),),//AppLocalizations.of(context)!.youTube
          //                 selectedColor:
          //                 Theme.of(context).colorScheme.secondary,
          //               ),
          //               SalomonBottomBarItem(
          //                 icon: const Icon(LineariconsFree.user_1),//MdiIcons
          //                 title: Text(
          //                   screenWidth < 350 ?  "":
          //                   'پروفایل',
          //                   style: TextStyle(
          //                     color: Theme.of(context)
          //                         .colorScheme
          //                         .secondary,
          //                     fontSize: 13,
          //                     fontFamily: 'Sahel',
          //                     fontWeight: FontWeight.w900,
          //                   ),),//AppLocalizations.of(context)!.youTube
          //                 selectedColor: Theme.of(context).colorScheme.secondary,
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ),
        onWillPop: _onWillPop
    );
  }
}
