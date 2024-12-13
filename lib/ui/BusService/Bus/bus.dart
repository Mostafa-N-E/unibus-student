import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:rajaee_web_app/ui/BusService/Bus/screens/large.dart';
import 'package:rajaee_web_app/ui/BusService/Bus/screens/small.dart';
import '../../../../ui/FoodService/Food/screens/large.dart';
import '../../../data/repo/turn_repository.dart';
import '../../../ui/FoodService/Food/screens/small.dart';
import '../../../data/repo/meal_food_repository.dart';
import '../../../data/repo/notification_repository.dart';
import '../../../utils/responsiveLayout.dart';
import '../../widgets/progress_indicator.dart';
import '../ReserveBus/ReserveBus.dart';
import '../ReserveStatus/reserveStatus.dart';
import 'bloc/bus_bloc.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        largeScreen_size: width*0.8 * 0.03,
        mediumScreen_size: width*0.8 * 0.035,
        smallScreen_size: width*0.8 * 0.05,
        min_size: width*0.8 * 0.1,
        max_size: width*0.8 * 0.02,
        context: context
    ).get_width_size();
    double button_width = ResponsiveSizeWidget(
        largeScreen_size: width*0.8 * 0.3,
        mediumScreen_size: width*0.8 * 0.38,
        smallScreen_size: width*0.8 * 0.35,
        min_size: width*0.8 * 0.25,
        max_size: width*0.8 * 0.3,
        context: context
    ).get_width_size();

    double toolbarHeight = ResponsiveSizeWidget(
        largeScreen_size: width*0.8 * 0.055,
        mediumScreen_size: width*0.8 * 0.08,
        smallScreen_size: width*0.8 * 0.2,
        min_size: width*0.8 * 0.2,
        max_size: width*0.8 * 0.05,
        context: context
    ).get_width_size();
    final Widget appbar_flexibleSpace = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 2,
              // color: Theme.of(context)
              //     .colorScheme
              //     .secondary
              //     .withOpacity(0.145),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                ),
              ),
              // shadowColor: Theme.of(context).colorScheme.secondary,
              child: SizedBox(
                height: toolbarHeight * 0.6,
                width: button_width * 1.15,
                child: InkWell(
                  hoverColor: Colors.white70,
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReserveBusScreen()
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          LineariconsFree.cart,
                          // color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        "رزرو سرویس",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize:b_text_size* 0.8,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(0),
          //   child: Card(
          //     elevation: 2,
          //     // color: Theme.of(context)
          //     //     .colorScheme
          //     //     .secondary
          //     //     .withOpacity(0.145),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //
          //     // shadowColor: Theme.of(context).colorScheme.secondary,
          //     child: SizedBox(
          //       height: toolbarHeight * 0.7,
          //       width: button_width * 0.85,
          //       child: InkWell(
          //         hoverColor: Colors.white70,
          //         enableFeedback: true,
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => FoodSaleDayScreen()
          //               )
          //           );
          //         },
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               "روز فروش",
          //               style: TextStyle(
          //                 // color: Theme.of(context).colorScheme.secondary,
          //                 fontSize:b_text_size*0.9,
          //                 fontFamily: 'Sahel',
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //             // SizedBox(width: 10),
          //             // Padding(
          //             //   padding: EdgeInsets.only(left: 5),
          //             //   child: Icon(
          //             //     LineariconsFree.checkmark_cicle,
          //             //     // color: Theme.of(context).colorScheme.secondary,
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 2,
              // color: Theme.of(context)
              //     .colorScheme
              //     .secondary
              //     .withOpacity(0.145),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100)
                ),
              ),
              // shadowColor: Theme.of(context).colorScheme.secondary,
              child: SizedBox(
                height: toolbarHeight * 0.6,
                width: button_width * 1.15,
                child: InkWell(
                  hoverColor: Colors.white70,
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusReserveStatusPage()
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "رزرو ها",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize:b_text_size* 0.8,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          LineariconsFree.calendar_full,
                          // color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );

    return BlocProvider(
      create: (context) {
        final foodBloc = BusBloc(
            turnRepository: turnRepository, notificationRepository: notificationRepository
        );
        foodBloc.add(BusStarted());
        return foodBloc;
      },
      child: Scaffold(
        backgroundColor: Colors.cyan.withOpacity(0.001),
        body: SafeArea(
          child: BlocBuilder<BusBloc, BusState>(builder: ((context, state) {
            if (state is BusSuccess) {
              // return ListView.builder(
              //     itemCount: 5,
              //     padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              //     itemBuilder: (context, index) {
              //       switch (index) {
              //         case 0:
              //           return Image.asset(
              //             'assets/img/nike_logo.png',
              //             height: 32,
              //           );
              //         default:
              //           return Container();
              //       }
              //     });

              return ResponsiveLayout(
                largeScreen: LargeBusPage(turns: state.turns, user_info: state.user_info, notifications: state.notifications,),
                // smallScreen: SmallFoodPage(),
                smallScreen: SmallBusPage(turns: state.turns, user_info: state.user_info,),
              );
            } else if (state is BusLoading) {
              return ResponsiveLayout(
                largeScreen: Center(child: CustomProgressIndicator()),
                // smallScreen: SmallFoodPage(),
                smallScreen: Scaffold(
                  backgroundColor: Colors.cyan.withOpacity(0.001),
                  appBar: AppBar(
                    toolbarOpacity: 0.001,
                    backgroundColor: Colors.white.withOpacity(0.001),
                    shadowColor: Theme.of(context).shadowColor.withOpacity(0.001),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    flexibleSpace: appbar_flexibleSpace,
                    toolbarHeight: toolbarHeight,
                    // backgroundColor: Colors.white,
                    // shadowColor: Colors.transparent,
                    // leading: IconButton(
                    //   icon: Icon(Icons.arrow_back_ios, color: isDarkMode ? Colors.white : Colors.black,),
                    //   onPressed: () => Navigator.of(context).pop(false),
                    // ),
                  ),
                  body: Center(child: CustomProgressIndicator()),
                ),
              );

            } else if (state is BusError) {
              return ResponsiveLayout(
                largeScreen: Center(child: CustomProgressIndicator()),
                // smallScreen: SmallFoodPage(),
                smallScreen: Scaffold(
                  backgroundColor: Colors.cyan.withOpacity(0.001),
                  appBar: AppBar(
                    toolbarOpacity: 1,
                    // color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    flexibleSpace: appbar_flexibleSpace,
                    toolbarHeight: toolbarHeight,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    // leading: IconButton(
                    //   icon: Icon(Icons.arrow_back_ios, color: isDarkMode ? Colors.white : Colors.black,),
                    //   onPressed: () => Navigator.of(context).pop(false),
                    // ),
                  ),
                  body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),
                              child: Text(
                                  state.exception.message
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: InkWell(
                              onTap: (){
                                BlocProvider.of<BusBloc>(context).add(BusRefresh());
                                // get_data();
                              },
                              child: Icon(
                                LineariconsFree.redo,
                                size: 60,
                                color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              );
            } else {
              throw Exception('state is not supported');
            }
          })),
        ),
      ),
    );
  }
}


