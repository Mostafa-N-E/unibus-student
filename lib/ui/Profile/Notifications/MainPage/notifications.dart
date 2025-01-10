import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../data/notification.dart';
import '../../../../ui/Profile/Notifications/MainPage/widgets/app_bar.dart';
import '../../../../ui/Profile/Notifications/MainPage/widgets/notification_list_view.dart';
import '../../../../data/repo/notification_repository.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/progress_indicator.dart';
import 'bloc/notification_bloc.dart';
import 'dart:math' as math;


class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>  with SingleTickerProviderStateMixin {
  StreamSubscription<NotificationScreen>? stateSubscription;
  late TabController _tabController;
  // late TabController _tabController_2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this, );

  }
  @override
  void dispose() {
    stateSubscription?.cancel();
    // _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
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

    final BoxDecoration decoration= BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xeaffffff),
            Color(0xFFF5F5F5),//Theme.of(context).colorScheme.secondary
            Color(0xffffffff),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5, 0.1, 4.0],
          tileMode: TileMode.clamp
      ),
    );
    final AppBar general_appbar = AppBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      leading: IconButton(
        icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
        onPressed: () => Navigator.of(context).pop(false),
      ),
    );

    // final money_format = new NumberFormat("#,##0", "en_US");
    return BlocProvider(
      create: (context) {
        final notificationBloc = NotificationBloc(
            notificationRepository: notificationRepository
        );
        notificationBloc.add(NotificationStarted());
        return notificationBloc;
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(builder: ((context, state) {
        if (state is NotificationSuccess) {
          Map<String, List<NotificationEntity>> classified_notifications = NotificationEntity.get_notifications_dased_on_type(state.notifications);

          return Scaffold(
            appBar:general_appbar,
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: decoration,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),//Colors.white,
                // extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  leading: null,
                  toolbarHeight: 70,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: TabBar(
                      controller: _tabController,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 3,
                          )),
                      indicatorPadding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      // onTap: (index){
                      //   switch (index){
                      //     case 0:
                      //       BlocProvider.of<ProfileBloc>(context).add(
                      //           ProfileFoodActivity(
                      //             user_info: state.user_info,
                      //           )
                      //       );
                      //       break;
                      //     case 1:
                      //       BlocProvider.of<ProfileBloc>(context).add(
                      //           ProfileBusActivity(
                      //             user_info: state.user_info,
                      //             food_activities: state.user_food_system_activities,
                      //           )
                      //       );
                      //       break;
                      //     case 2:
                      //       BlocProvider.of<ProfileBloc>(context).add(
                      //           ProfileFinancialActivity(
                      //             user_info: state.user_info,
                      //             food_activities: state.user_food_system_activities,
                      //           )
                      //       );
                      //       break;
                      //   }
                      // },
                      tabs: [
                        Tab(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LineariconsFree.dinner,
                                  color: Colors.black87,
                                ),
                                Text(
                                  'سامانه تغذیه',
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sahel"
                                  ),
                                ),
                              ],
                            )
                        ),
                        Tab(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LineariconsFree.bus,
                                  color: Colors.black87,
                                ),
                                Text(
                                  'سامانه سرویس',
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sahel"
                                  ),
                                ),
                              ],
                            )
                        ),
                        Tab(
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  LineariconsFree.apartment,
                                  color: Colors.black87,
                                ),
                                Text(
                                  'سامانه خوابگاه',
                                  style: TextStyle(
                                      fontSize: b_text_size * 0.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sahel"
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                body: DefaultTabController(
                  length: 3,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: new ConstrainedBox(
                          constraints: new BoxConstraints(
                            minHeight: height * 0.7,
                            // minWidth: 5.0,
                            // maxHeight: 30.0,
                            // maxWidth: 30.0,
                          ),
                          child: Container(
                            // height: height,
                              color: Colors.white,
                              padding: EdgeInsets.only(bottom: 0),
                              child: classified_notifications['food_system']!.isEmpty ?
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 60,
                                        ),
                                        child: Text(
                                          "تاکنون اطلاعیه ای در این سامانه منتشر نشده",
                                          style: TextStyle(
                                              color: Colors.grey.shade500
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
                                          LineariconsFree.redo,
                                          size: 35,
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                                  :
                              NotificationList(notifications: classified_notifications['food_system']!,)
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: new ConstrainedBox(
                          constraints: new BoxConstraints(
                            minHeight: height * 0.7,
                            // minWidth: 5.0,
                            // maxHeight: 30.0,
                            // maxWidth: 30.0,
                          ),
                          child: Container(
                            // height: height,
                              color: Colors.white,
                              padding: EdgeInsets.only(bottom: 0),
                              child: classified_notifications['bus_system']!.isEmpty ?
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 60,
                                        ),
                                        child: Text(
                                          "تاکنون اطلاعیه ای در این سامانه منتشر نشده",
                                          style: TextStyle(
                                              color: Colors.grey.shade500
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
                                          LineariconsFree.redo,
                                          size: 35,
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                                  :
                              NotificationList(notifications: classified_notifications['bus_system']!,)

                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: new ConstrainedBox(
                          constraints: new BoxConstraints(
                            minHeight: height * 0.7,
                            // minWidth: 5.0,
                            // maxHeight: 30.0,
                            // maxWidth: 30.0,
                          ),
                          child: Container(
                            // height: height,
                              color: Colors.white,
                              padding: EdgeInsets.only(bottom: 0),
                              child: classified_notifications['dormitory_system']!.isEmpty ?
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 60,
                                        ),
                                        child: Text(
                                          "تاکنون اطلاعیه ای در این سامانه منتشر نشده",
                                          style: TextStyle(
                                              color: Colors.grey.shade500
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
                                          LineariconsFree.redo,
                                          size: 35,
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                                  :
                              NotificationList(notifications: classified_notifications['dormitory_system']!,)

                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is NotificationLoading) {
          return Scaffold(
            appBar: general_appbar,
            backgroundColor: Colors.transparent,
            body: Center(child: CustomProgressIndicator()),

          );
        } else if (state is NotificationError) {
          return Scaffold(
            appBar: general_appbar,
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
                          BlocProvider.of<NotificationBloc>(context).add(NotificationStarted());
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
          );
        }
        else {
          throw Exception("state is not supported ${state}");
        }
      })),
    );
  }
}



class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
