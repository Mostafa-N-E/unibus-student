// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttericon/linearicons_free_icons.dart';
// import 'package:rajaee_web_app/ui/Profile/MainPage/widgets/app_bar.dart';
// import 'package:rajaee_web_app/ui/Profile/Notifications/MainPage/widgets/notification_list_view.dart';
// import '../../../../data/notification.dart';
// import '../../../../data/repo/notification_repository.dart';
// import '../../../../utils/responsiveLayout.dart';
// import '../../../widgets/progress_indicator.dart';
// import 'bloc/notification_bloc.dart';
// import 'dart:math' as math;
//
//
// class UserNotificationScreen extends StatefulWidget {
//   @override
//   State<UserNotificationScreen> createState() => _UserNotificationScreenState();
// }
//
// class _UserNotificationScreenState extends State<UserNotificationScreen>  with SingleTickerProviderStateMixin {
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_9 = new GlobalKey<RefreshIndicatorState>();
//   StreamSubscription<UserNotificationScreen>? stateSubscription;
//   late TabController _tabController_1;
//   // late TabController _tabController_2;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController_1 = TabController(initialIndex: 0, length: 2, vsync: this, );
//     // _tabController_2 = TabController(initialIndex: 0, length: 3, vsync: this, );
//
//   }
//   @override
//   void dispose() {
//     stateSubscription?.cancel();
//     // _scaffoldKey.currentState?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var height = MediaQuery.of(context).size.height * 0.8;
//     var width = MediaQuery.of(context).size.width * 0.8;
//     final bool rotated = MediaQuery.of(context).size.height < width;
//     final ProfileScreenAppBar app_bar = ProfileScreenAppBar(context);
//
//     double image_width = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.2,
//         mediumScreen_size: width * 0.3,
//         smallScreen_size: width * 0.55,
//         min_size: width * 0.7,
//         max_size: width * 0.17,
//         context: context
//     ).get_width_size();
//     double h1_text_size = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.03,
//         mediumScreen_size: width * 0.05,
//         smallScreen_size: width * 0.085,
//         min_size: width * 0.12,
//         max_size: width * 0.03,
//         context: context
//     ).get_width_size();
//     double b_text_size = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.03,
//         mediumScreen_size: width * 0.035,
//         smallScreen_size: width * 0.05,
//         min_size: width * 0.1,
//         max_size: width * 0.02,
//         context: context
//     ).get_width_size();
//
//     double padding = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.03,
//         mediumScreen_size: width * 0.035,
//         smallScreen_size: width * 0.1,
//         min_size: width * 0.1,
//         max_size: width * 0.025,
//         context: context
//     ).get_width_size();
//     double container_height = ResponsiveSizeWidget(
//         largeScreen_size: screenHeight * 0.55,
//         mediumScreen_size: screenHeight * 0.6,
//         smallScreen_size: screenHeight * 0.8,
//         min_size: screenHeight *0.8,
//         max_size: screenHeight *0.55,
//         context: context
//     ).get_custom_size();
//     double viewportFraction  = ResponsiveSizeWidget(
//         largeScreen_size: 0.75,
//         mediumScreen_size: 0.8,
//         smallScreen_size: 0.85,
//         min_size: 0.9,
//         max_size: 0.65,
//         context: context
//     ).get_custom_size();
//
//     // final money_format = new NumberFormat("#,##0", "en_US");
//     return BlocProvider(
//       create: (context) {
//         final userNotificationBloc = UserNotificationBloc(
//             notificationRepository: notificationRepository
//         );
//         userNotificationBloc.add(UserNotificationStarted());
//         return userNotificationBloc;
//       },
//       child: BlocBuilder<UserNotificationBloc, UserNotificationState>(builder: ((context, state) {
//         if (state is NotificationSuccess) {
//           return Scaffold(
//             appBar: AppBar(
//               toolbarOpacity: 1,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
//                 onPressed: () => Navigator.of(context).pop(false),
//               ),
//             ),
//             body: RefreshIndicator(
//               key: _refreshIndicatorKey_9,
//               onRefresh: ()async{
//                 BlocProvider.of<NotificationBloc>(context).add(NotificationRefresh());
//                 // _refresh
//               },
//               child: DefaultTabController(
//                 length: 2,
//                 child: Scaffold(
//                   appBar: AppBar(
//                     toolbarOpacity: 1,
//                     backgroundColor: Colors.white,
//                     bottom: TabBar(
//                       controller: _tabController_1,
//                       indicator: UnderlineTabIndicator(
//                           borderSide: BorderSide(
//                             color: Theme.of(context).colorScheme.secondary,
//                             width: 3,
//                           )),
//                       indicatorPadding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
//                       // onTap: (index){
//                       //   switch (index){
//                       //     case 0:
//                       //       BlocProvider.of<ProfileBloc>(context).add(
//                       //           ProfileFoodActivity(
//                       //             user_info: state.user_info,
//                       //           )
//                       //       );
//                       //       break;
//                       //     case 1:
//                       //       BlocProvider.of<ProfileBloc>(context).add(
//                       //           ProfileBusActivity(
//                       //             user_info: state.user_info,
//                       //             food_activities: state.user_food_system_activities,
//                       //           )
//                       //       );
//                       //       break;
//                       //     case 2:
//                       //       BlocProvider.of<ProfileBloc>(context).add(
//                       //           ProfileFinancialActivity(
//                       //             user_info: state.user_info,
//                       //             food_activities: state.user_food_system_activities,
//                       //           )
//                       //       );
//                       //       break;
//                       //   }
//                       // },
//                       tabs: [
//                         Tab(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   // height: 90,
//                                   // padding: EdgeInsets.symmetric(horizontal: 15),
//                                   child: Icon(
//                                     LineariconsFree.dinner,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 Text(
//                                   'سامانه تغذیه',
//                                   style: TextStyle(
//                                       fontSize: b_text_size * 0.6,
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.w600,
//                                       fontFamily: "Sahel"
//                                   ),
//                                 ),
//                               ],
//                             )
//                         ),
//                         Tab(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   // height: 90,
//                                   // padding: EdgeInsets.symmetric(horizontal: 15),
//                                   child: Icon(
//                                     LineariconsFree.bus,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 Text(
//                                   'سامانه سرویس',
//                                   style: TextStyle(
//                                       fontSize: b_text_size * 0.6,
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.w600,
//                                       fontFamily: "Sahel"
//                                   ),
//                                 ),
//                               ],
//                             )
//                         ),
//                         // Tab(
//                         //     child:  Column(
//                         //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         //       crossAxisAlignment: CrossAxisAlignment.center,
//                         //       children: [
//                         //         Container(
//                         //           // height: 90,
//                         //           // padding: EdgeInsets.symmetric(horizontal: 15),
//                         //           child: Icon(
//                         //             LineariconsFree.diamond_1,
//                         //             color: Colors.black87,
//                         //           ),
//                         //         ),
//                         //         Text(
//                         //           'تراکنش های مالی',
//                         //           style: TextStyle(
//                         //               fontSize: b_text_size * 0.6,
//                         //               color: Colors.black87,
//                         //               fontWeight: FontWeight.w600,
//                         //               fontFamily: "Sahel"
//                         //           ),
//                         //         ),
//                         //       ],
//                         //     )
//                         // ),
//                       ],
//                     ),
//                   ),
//                   body: TabBarView(
//                     controller: _tabController_1,
//                     children: [
//                       SingleChildScrollView(
//                         child: Container(
//                           // height: height,
//                             color: Colors.white,
//                             padding: EdgeInsets.only(bottom: 0),
//                             child: SubNotificationScreen(notifications: state.notifications,)
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         child: Container(
//                           // height: height,
//                             color: Colors.white,
//                             padding: EdgeInsets.only(bottom: 0),
//                             child: SubNotificationScreen(notifications: state.notifications,)
//                         ),
//                       ),
//                       // SingleChildScrollView(
//                       //   child: Container(
//                       //     // height: height,
//                       //       color: Colors.white,
//                       //       padding: EdgeInsets.only(bottom: 0),
//                       //       child: Center()
//                       //   ),
//                       // ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else if (state is NotificationLoading) {
//           return Scaffold(
//             appBar: AppBar(
//               toolbarOpacity: 1,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
//                 onPressed: () => Navigator.of(context).pop(false),
//               ),
//             ),
//             backgroundColor: Colors.transparent,
//             body: Center(child: CustomProgressIndicator()),
//
//           );
//         } else if (state is NotificationError) {
//           return Scaffold(
//             appBar: AppBar(
//               toolbarOpacity: 1,
//               toolbarHeight: rotated
//                   ? MediaQuery.of(context).size.height * 0.2
//                   : MediaQuery.of(context).size.width * 0.17,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
//                 onPressed: () => Navigator.of(context).pop(false),
//               ),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(state.exception.message),
//                   ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<NotificationBloc>(context).add(NotificationStarted());
//                       },
//                       child: const Text('تلاش دوباره')),
//                 ],
//               ),
//             ),
//           );
//         }
//         else {
//           throw Exception("state is not supported ${state}");
//         }
//       })),
//     );
//   }
// }
//
//
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//
//   @override
//   double get minExtent => minHeight;
//
//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }
//
//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
