import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../../data/repo/activity_report_repository.dart';
import '../../../../ui/Profile/MainPage/widgets/activity_list_view.dart';
import '../../../../ui/Profile/MainPage/widgets/app_bar.dart';
import '../../../data/repo/auth_repository.dart';
import '../../../utils/responsiveLayout.dart';
import 'dart:math' as math;
import '../../auth/auth.dart';
import '../../widgets/drawer.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/progress_indicator.dart';
import '../CardManagement/cardManagement.dart';
import '../ChangePassword/change_password.dart';
import '../Notifications/MainPage/notifications.dart';
import '../ProfileDetail/profile_detail.dart';
import 'bloc/profile_bloc.dart';
import '../../../../theme.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_20 = new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_21 = new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_22 = new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_23 = new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_24 = new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this, );
  }
  // ProfileScreen({Key? key}) : super(key: key);
  StreamSubscription<ProfileState>? stateSubscription;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey=GlobalKey();
  @override
  void dispose() {
    stateSubscription?.cancel();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final ProfileScreenAppBar app_bar = ProfileScreenAppBar(context);
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.17,
        context: context
    ).get_width_size();
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

    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
    double sliverPersistentHeader_height = ResponsiveSizeWidget(
        largeScreen_size: 110,
        mediumScreen_size: 105,
        smallScreen_size: 80,
        min_size: 75,
        max_size: 120,
        context: context
    ).get_custom_size();

    List<Widget> tabs = [
      Tab(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // height: 90,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  LineariconsFree.dinner,
                  color: AppTheme.currentTheme.getIconColor(),
                ),
              ),
              Text(
                'سامانه تغذیه',
                style: TextStyle(
                    fontSize: b_text_size * 0.38,
                    color: AppTheme.currentTheme.getIconColor(),
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
              Container(
                // height: 90,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  LineariconsFree.bus,
                  color: AppTheme.currentTheme.getIconColor(),
                ),
              ),
              Text(
                'سامانه سرویس',
                style: TextStyle(
                    fontSize: b_text_size * 0.38,
                    color: AppTheme.currentTheme.getIconColor(),
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
              Container(
                // height: 90,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  LineariconsFree.apartment,
                  color: AppTheme.currentTheme.getIconColor(),
                ),
              ),
              Text(
                'سامانه خوابگاه',
                style: TextStyle(
                    fontSize: b_text_size * 0.38,
                    color: AppTheme.currentTheme.getIconColor(),
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
              Container(
                // height: 90,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  LineariconsFree.diamond_1,
                  color: AppTheme.currentTheme.getIconColor(),
                ),
              ),
              Text(
                'تراکنش های مالی',
                style: TextStyle(
                    fontSize: b_text_size * 0.37,
                    color: AppTheme.currentTheme.getIconColor(),
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
              Container(
                // height: 90,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  LineariconsFree.laptop_phone,
                  color: AppTheme.currentTheme.getIconColor(),
                ),
              ),
              Text(
                'فعالیت سیستمی',
                style: TextStyle(
                    fontSize: b_text_size * 0.38,
                    color: AppTheme.currentTheme.getIconColor(),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Sahel"
                ),
              ),
            ],
          )
      ),
    ];
    final SliverPersistentHeader first_SliverPersistentHeader = SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 0,
        maxHeight: 25,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, -8), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Theme.of(context).scaffoldBackgroundColor,

          ),
          // height: height * (0.1),
          width: double.infinity,
          child: Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.maximize_rounded,
              size: h1_text_size * 2,
              // color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
    final SliverPersistentHeader second_SliverPersistentHeader_1 = SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 0,
        maxHeight: 55,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // height: 90,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      LineariconsFree.printer,
                      // color: Colors.black87,
                    ),
                  ),
                  Text(
                    "گزارش فعالیت های اخیر",
                    style: TextStyle(
                        fontSize: h1_text_size * 0.55,
                        // color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Sahel"
                    ),
                  ),
                ],
              )

          ),
        ),
      ),
    );
    final SliverPersistentHeader second_SliverPersistentHeader_2 = SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: sliverPersistentHeader_height * 0.8,
        maxHeight: sliverPersistentHeader_height,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 4,
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
            tabs: tabs,
          ),
        ),
      ),
    );

    final BoxDecoration decoration= BoxDecoration(
    //   gradient: LinearGradient(
    //       colors: [
    //         Color(0xeaffffff),
    //         Color(0xFFF5F5F5),//Theme.of(context).colorScheme.secondary
    //         Color(0xffffffff),
    //         Color(0xFFFFFFFF),
    //       ],
    //       begin: Alignment.topRight,
    //       end: Alignment.bottomRight,
    //       stops: [0.0, 0.5, 0.1, 4.0],
    //       tileMode: TileMode.clamp
    //   ),
    );
    return BlocProvider(
      create: (context) {
        final profileBloc = ProfileBloc(
          userActivityRepository: userActivityRepository, authRepository: authRepository
        );
        profileBloc.add(ProfileStarted());
        return profileBloc;
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: ((context, state) {
        if (state is ProfileSuccess) {
          return Scaffold(
            // appBar: general_appbar,
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: decoration,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),//Colors.white,
                // extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    DefaultTabController(
                      length: 5,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            app_bar.build(
                                state.user_info,
                                (){
                                  BlocProvider.of<ProfileBloc>(context).add(
                                      ProfileRefreshUserInfo(
                                          user_financial_activities: state.user_financial_activities,
                                          user_food_system_activities: state.user_food_system_activities,
                                          user_bus_system_activities: state.user_bus_system_activities,
                                          user_dormitory_system_activities: state.user_dormitory_system_activities,
                                          user_system_activities: state.user_system_activities
                                      )
                                  );
                                }
                            ),
                            first_SliverPersistentHeader,
                            second_SliverPersistentHeader_1,
                            second_SliverPersistentHeader_2,

                          ];
                        },
                        body: TabBarView(
                          controller: _tabController,
                          children: [
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_20,
                              onRefresh: ()async{
                                BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                    constraints: new BoxConstraints(
                                      minHeight: height * 0.55,
                                      // minWidth: 5.0,
                                      // maxHeight: 30.0,
                                      // maxWidth: 30.0,
                                    ),
                                  child: Container(
                                    // height: height,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: state.user_food_system_activities.isEmpty ?
                                    Center(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 60,
                                                ),
                                                child: Text(
                                                  "تاکنون فعالیتی در این سامانه نداشته اید",
                                                  style: TextStyle(
                                                      // color: Colors.grey.shade500
                                                  ),
                                                )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: InkWell(
                                                onTap: (){
                                                  BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                },
                                                child: Icon(
                                                  LineariconsFree.redo,
                                                  size: 35,
                                                  color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    )
                                        :
                                    FoodActivityList(activities: state.user_food_system_activities,)

                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_21,
                              onRefresh: ()async{
                                BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: state.user_bus_system_activities.isEmpty ?
                                    Center(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 60,
                                                ),
                                                child: Text(
                                                  "تاکنون فعالیتی در این سامانه نداشته اید",
                                                  style: TextStyle(
                                                      // color: Colors.grey.shade500
                                                  ),
                                                )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: InkWell(
                                                onTap: (){
                                                  BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                },
                                                child: Icon(
                                                  LineariconsFree.redo,
                                                  size: 35,
                                                  color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    )

                                        :
                                    BusActivityList(activities: state.user_bus_system_activities,)
                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_22,
                              onRefresh: ()async{
                                BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: Center(
                                        child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی در این سامانه نداشته اید",
                                                    style: TextStyle(
                                                        // color: Colors.grey.shade500
                                                    ),
                                                  )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: InkWell(
                                                  onTap: (){
                                                    BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )

                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_23,
                              onRefresh: ()async{
                                BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: state.user_financial_activities.isEmpty ?
                                    Center(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 60,
                                                ),
                                                child: Text(
                                                  "تاکنون فعالیتی نداشته اید",
                                                  style: TextStyle(
                                                      // color: Colors.grey.shade500
                                                  ),
                                                )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: InkWell(
                                                onTap: (){
                                                  BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                },
                                                child: Icon(
                                                  LineariconsFree.redo,
                                                  size: 35,
                                                  color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    )
                                    :
                                    FinancialActivityList(activities: state.user_financial_activities,)
                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_24,
                              onRefresh: ()async{
                                BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: state.user_system_activities.isEmpty ?
                                      Center(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی نداشته اید",
                                                    style: TextStyle(
                                                        // color: Colors.grey.shade500
                                                    ),
                                                  )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: InkWell(
                                                  onTap: (){
                                                    BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                          :
                                      SystemActivityList(activities: state.user_system_activities,)
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            drawer: rotated ? null : PublicDrawer(),
          );
        } else if(state is ProfileRefreshUserInfoLoading) {
          return Scaffold(
            // appBar:general_appbar,
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: decoration,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),//Colors.white,
                // extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    DefaultTabController(
                      length: 5,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            SliverAppBar(
                              backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),
                              centerTitle: true,
                              expandedHeight: ResponsiveSizeWidget(
                                  largeScreen_size: MediaQuery.of(context).size.height * 0.3,
                                  mediumScreen_size: MediaQuery.of(context).size.height * 0.36,
                                  smallScreen_size: MediaQuery.of(context).size.height * 0.32,
                                  min_size: MediaQuery.of(context).size.height * 0.3,
                                  max_size: MediaQuery.of(context).size.height * 0.3,
                                  context: context
                              ).get_height_size() ,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Stack(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomProgressIndicator(),
                                    ),
                                  ],
                                ),
                                expandedTitleScale: 1,
                                centerTitle: true,
                              ),
                            ),
                            first_SliverPersistentHeader,
                            second_SliverPersistentHeader_1,
                            second_SliverPersistentHeader_2,

                          ];
                        },
                        body: TabBarView(
                          controller: _tabController,
                          children: [
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_20,
                              onRefresh: ()async{
                                // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: state.user_food_system_activities.isEmpty ?
                                      Center(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی در این سامانه نداشته اید",
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
                                                    // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                          :
                                      FoodActivityList(activities: state.user_food_system_activities,)
                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_21,
                              onRefresh: ()async{
                                // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: state.user_bus_system_activities.isEmpty ?
                                      Center(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی در این سامانه نداشته اید",
                                                    style: TextStyle(
                                                        // color: Colors.grey.shade500
                                                    ),
                                                  )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: InkWell(
                                                  onTap: (){
                                                    // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )

                                          :
                                      BusActivityList(activities: state.user_bus_system_activities,)
                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_22,
                              onRefresh: ()async{
                                // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),

                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: Center(
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی در این سامانه نداشته اید",
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
                                                    // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )

                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_23,
                              onRefresh: ()async{
                                // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: state.user_financial_activities.isEmpty ?
                                      Center(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی نداشته اید",
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
                                                    // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                          :
                                      FinancialActivityList(activities: state.user_financial_activities,)
                                  ),
                                ),
                              ),
                            ),
                            RefreshIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              key: _refreshIndicatorKey_24,
                              onRefresh: ()async{
                                // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: height * 0.55,
                                    // minWidth: 5.0,
                                    // maxHeight: 30.0,
                                    // maxWidth: 30.0,
                                  ),
                                  child: Container(
                                    // height: height,
                                    //   color: Colors.white,
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: state.user_financial_activities.isEmpty ?
                                      Center(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 60,
                                                  ),
                                                  child: Text(
                                                    "تاکنون فعالیتی نداشته اید",
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
                                                    // BlocProvider.of<ProfileBloc>(context).add(ProfileRefreshUserActivity(user_info: state.user_info));
                                                  },
                                                  child: Icon(
                                                    LineariconsFree.redo,
                                                    size: 35,
                                                    color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                          :
                                      SystemActivityList(activities: state.user_system_activities,)
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            drawer: rotated ? null : PublicDrawer(),
          );
        } else if (state is ProfileFirstSuccess) {
          return Scaffold(
            // appBar:general_appbar,
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: decoration,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       colors: [
              //         Color(0xea00acd2),
              //         Color(0xff09619f),
              //         Color(0xffffffff),
              //         Color(0xFFFFFFFF),
              //       ],
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomRight,
              //       stops: [0.0, 0.3, 0.2, 5.0],
              //       tileMode: TileMode.clamp
              //   ),
              // ),
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),//Colors.white,
                // extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    DefaultTabController(
                      length: 5,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            app_bar.build(
                                state.user_info,
                                (){
                                  BlocProvider.of<ProfileBloc>(context).add(ProfileStarted());
                                }
                              ),
                            first_SliverPersistentHeader,
                            second_SliverPersistentHeader_1,
                            second_SliverPersistentHeader_2,

                          ];
                        },
                        body: TabBarView(
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
                                  height: height * 0.5,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Center(child: CustomProgressIndicator(),)
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
                                    height: height * 0.5,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Center(child: CustomProgressIndicator(),)
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
                                    height: height * 0.5,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Center(child: CustomProgressIndicator(),)
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
                                    height: height * 0.5,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Center(child: CustomProgressIndicator(),)
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
                                    height: height * 0.5,
                                    // color: Colors.white,
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Center(child: CustomProgressIndicator(),)
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            drawer: rotated ? null : PublicDrawer(),
          );

          // return ScaffoldMessenger(
          //   key: _scaffoldKey,
          //   child: Scaffold(
          //     body: CustomScrollView(
          //       physics: defaultScrollPhysics,
          //       slivers: [
          //         SliverAppBar(
          //           expandedHeight: MediaQuery.of(context).size.width * 0.8,
          //           flexibleSpace: Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   state.user_info.credit_amount.toString(),
          //                   style:  TextStyle(
          //                     // color: Colors.grey.shade500,
          //                     fontSize: h1_text_size,
          //                     fontWeight: FontWeight.bold,
          //                     // fontFamily: "decotype-thuluth-ii",
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //           // foregroundColor: LightThemeColors.primaryTextColor,
          //           actions: [
          //             IconButton(
          //                 onPressed: () {}, icon: const Icon(LineariconsFree.earth))
          //           ],
          //         ),
          //         SliverToBoxAdapter(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   children: [
          //                     Expanded(
          //                         child: Text(
          //                           "widget.product.title",
          //                           style: Theme.of(context).textTheme.headline6,
          //                         )),
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       children: [
          //                         Text(
          //                           "widget.product.previousPrice.withPriceLabel",
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .caption!
          //                               .apply(
          //                               decoration: TextDecoration.lineThrough),
          //                         ),
          //                         Text("widget.product.price.withPriceLabel"),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   height: 24,
          //                 ),
          //                 const Text(
          //                   'این کتونی شدیدا برای دویدن و راه رفتن مناسب هست و تقریبا. هیچ فشار مخربی رو نمیذارد به پا و زانوان شما انتقال داده شود',
          //                   style: TextStyle(height: 1.4),
          //                 ),
          //                 const SizedBox(
          //                   height: 24,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'نظرات کاربران',
          //                       style: Theme.of(context).textTheme.subtitle1,
          //                     ),
          //                     TextButton(
          //                         onPressed: () {}, child: const Text('ثبت نظر'))
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         SliverList(
          //           delegate: SliverChildBuilderDelegate((context, index) {
          //             return Container(
          //               // child: Colors.orange,
          //               height: height,
          //               width: width,
          //             );
          //           },
          //               childCount: 10
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // );
        } else if (state is ProfileGetFoodSystemActivitiesSuccess) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: decoration,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.01),//Colors.white,
                // extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    DefaultTabController(
                      length: 3,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            app_bar.build(
                                state.user_info,
                                (){
                                  BlocProvider.of<ProfileBloc>(context).add(ProfileRefresh());
                                }
                            ),

                            first_SliverPersistentHeader,
                            second_SliverPersistentHeader_1,
                            second_SliverPersistentHeader_2,

                          ];
                        },
                        body: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                height: height,
                                // color: Colors.white,
                                padding: EdgeInsets.only(bottom: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: CustomProgressIndicator(),
                            ),
                            Center(
                              child: CustomProgressIndicator(),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );

        }else if (state is ProfileFirstLoading) {
          return Scaffold(
            backgroundColor: Colors.transparent,
              // appBar:general_appbar,
              body: Center(child: CustomProgressIndicator())

          );
        } else if (state is ProfileLoading) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: -100,
                      child: Container(
                        decoration: BoxDecoration(),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          elevation: 2,
                          // color: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      state.user_info.credit_amount.toString(),
                                      style: TextStyle(
                                        // color: Theme.of(context).colorScheme.secondary,
                                        fontSize:h1_text_size,
                                        // fontFamily: 'decotype-thuluth-ii',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "موجودی",
                                      style: TextStyle(
                                        // color: Theme.of(context).colorScheme.secondary,
                                        fontSize:b_text_size,
                                        // fontFamily: 'decotype-thuluth-ii',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                          // child: Container(
                          //   child: BackdropFilter(
                          //     filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          //     child: fast_cached_image_builder(
                          //         main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', opacity: 0.45, width: width, height: height
                          //     ),
                          //   ),
                          // ),


                          // child: FlutterMap(
                          //   options: MapOptions(
                          //     zoom: 13.0,
                          //     center: LatLng(35.669072277037294, 51.359724811369084),
                          //   ),
                          //   layers: [
                          //     TileLayerOptions(
                          //         urlTemplate:
                          //         'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          //         subdomains: ['a', 'b', 'c']),
                          //   ],
                          // ),
                        ),
                      ),
                    ),


                    Center(child: CustomProgressIndicator())



                  ],
                ),
              ],
            ),

          );
        } else if (state is ProfileError) {
          return Scaffold(
            // appBar: general_appbar,
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
                          BlocProvider.of<ProfileBloc>(context).add(ProfileStarted());
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

