import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../ui/FoodService/ReserveFood/screens/large.dart';
import '../../../../ui/FoodService/ReserveFood/screens/small.dart';
import '../../../../ui/FoodService/ReserveFood/widgets/floating_action_button.dart';
import '../../../utils/responsiveLayout.dart';

class ReserveFoodScreen extends StatelessWidget {
  ReserveFoodScreen({Key? key}) : super(key: key);

  Jalali date = Jalali.now();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    // final ReserveFoodScreenAppBar app_bar = ReserveFoodScreenAppBar(context);
    final ReserveFoodScreenFloatingActionButton floating_action_button = ReserveFoodScreenFloatingActionButton(context);

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.23,
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
    double item_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.48,
        mediumScreen_size: height * 0.7,
        smallScreen_size: height * 0.75,
        min_size: height * 0.75,
        max_size: height * 0.6,
        context: context
    ).get_height_size();
    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
    double button_height  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.06,
        mediumScreen_size: width * 0.06,
        smallScreen_size: width * 0.1,
        min_size: width * 0.11,
        max_size: width * 0.04,
        context: context
    ).get_width_size();
    double button_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.3,
        mediumScreen_size: width * 0.38,
        smallScreen_size: width * 0.35,
        min_size: width * 0.25,
        max_size: width * 0.3,
        context: context
    ).get_width_size();

    return ResponsiveLayout(
      largeScreen: LargeReserveFoodPage(),
      // smallScreen: SmallFoodPage(),
      smallScreen: SmallReserveFoodPage(),
    );
    // return BlocProvider(
    //   create: (context) {
    //     final reserveFoodBloc = ReserveFoodBloc(
    //         mealFoodRepository: mealFoodRepository
    //     );
    //     reserveFoodBloc.add(ReserveFoodStarted(picked_date: Jalali.now(), SelfServiceId: -1, ));
    //     return reserveFoodBloc;
    //   },
    //   child: BlocBuilder<ReserveFoodBloc, ReserveFoodState>(builder: ((context, state) {
    //       if (state is ReserveFoodSuccess) {
    //         return Scaffold(
    //           appBar: app_bar.build(
    //               self_service_selecter_onTap:  () async {
    //                 await showModalBottomSheet(
    //                   isDismissible: true,
    //                   backgroundColor: Colors.transparent,
    //                   context: context,
    //                   builder: (BuildContext context) {
    //                     return ChangeSelfServiceWidget(self_services: state.self_services,);
    //                   },
    //                 );
    //                 BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodChangeSelfService(picked_date: state.picked_date as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //               },
    //               date_piker_onTap:  () async {
    //                 Jalali? picked = await showPersianDatePicker(
    //                   context: context,
    //                   initialDate: date,
    //                   firstDate: Jalali(1399, 1),
    //                   lastDate: Jalali(1410, 12),
    //                 );
    //                 BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //               },
    //               date_lable:state.picked_date.formatFullDate(),
    //               self_service_lable:state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
    //           ),
    //           floatingActionButton: floating_action_button.build(
    //             next_button_onTap: ()async{
    //               BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date.addDays(1) as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //             },
    //             back_button_onTap: ()async{
    //               BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date.addDays(-1) as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //             },
    //           ),
    //           body: SafeArea(
    //             child: state.meal_foods.length == 0 ?
    //             Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   const Text("موردی برای نمایش وجود ندارد"),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //                       },
    //                       child: const Text('تلاش دوباره')),
    //                 ],
    //               ),
    //             )
    //             :
    //             ListView.builder(
    //                 itemCount: state.meal_foods.length,
    //                 padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
    //                 itemBuilder: (context, index) {
    //                   return FoodReserveCard(
    //                     meal_food: state.meal_foods[index],
    //                   );
    //                 }),
    //           ),
    //         );
    //       } else if (state is ReserveFoodFirstSuccess) {
    //         return Scaffold(
    //           appBar: app_bar.build(
    //               self_service_selecter_onTap:  () async {
    //                 await showModalBottomSheet(
    //                   isDismissible: true,
    //                   backgroundColor: Colors.transparent,
    //                   context: context,
    //                   builder: (BuildContext context) {
    //                     return ChangeSelfServiceWidget(self_services: state.self_services,);
    //                   },
    //                 );
    //                 BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodChangeSelfService(picked_date: state.picked_date as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //               },
    //               date_piker_onTap:  () async {
    //                 Jalali? picked = await showPersianDatePicker(
    //                   context: context,
    //                   initialDate: date,
    //                   firstDate: Jalali(1399, 1),
    //                   lastDate: Jalali(1410, 12),
    //                 );
    //                 BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //               },
    //               date_lable:state.picked_date.formatFullDate(),
    //               self_service_lable: state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
    //           ),
    //           floatingActionButton: floating_action_button.build(),
    //           body: Center(),
    //         );
    //       } else if (state is ReserveFoodFirstLoading) {
    //         return Scaffold(
    //             appBar: app_bar.build(
    //                 self_service_selecter_onTap:  () {},
    //                 date_piker_onTap:  () async {
    //                   Jalali? picked = await showPersianDatePicker(
    //                     context: context,
    //                     initialDate: date,
    //                     firstDate: Jalali(1399, 1),
    //                     lastDate: Jalali(1410, 12),
    //                   );
    //                   // BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: 1, selfservices: state.self_services));
    //                 },
    //                 date_lable:state.picked_date.formatFullDate(),
    //                 // self_service_lable: ""
    //             ),
    //             floatingActionButton: floating_action_button.build(),
    //             body: const Center()
    //         );
    //       } else if (state is ReserveFoodLoading) {
    //         return Scaffold(
    //             appBar: app_bar.build(
    //                 self_service_selecter_onTap:  () async {
    //                   // Jalali? picked = await showPersianDatePicker(
    //                   //   context: context,
    //                   //   initialDate: date,
    //                   //   firstDate: Jalali(1399, 1),
    //                   //   lastDate: Jalali(1410, 12),
    //                   // );
    //                   // BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: 1, selfservices: state.self_services));
    //                 },
    //                 date_piker_onTap:  () async {
    //                   Jalali? picked = await showPersianDatePicker(
    //                     context: context,
    //                     initialDate: date,
    //                     firstDate: Jalali(1399, 1),
    //                     lastDate: Jalali(1410, 12),
    //                   );
    //                   BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
    //                 },
    //                 date_lable:state.picked_date.formatFullDate(),
    //                 self_service_lable:state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
    //             ),
    //             floatingActionButton: floating_action_button.build(),
    //             body: const Center(child: CircularProgressIndicator())
    //         );
    //       } else if (state is ReserveFoodError) {
    //         return Scaffold(
    //           appBar: app_bar.build(
    //               self_service_selecter_onTap:  ()  {},
    //               date_piker_onTap:  ()  {},
    //               date_lable:"-------------",
    //               self_service_lable:"-------------"
    //           ),
    //           floatingActionButton: floating_action_button.build(),
    //           body: Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Text(state.exception.message),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodStarted(picked_date: date, SelfServiceId: -1));
    //                     },
    //                     child: const Text('تلاش دوباره')),
    //               ],
    //             ),
    //           ),
    //         );
    //       } else {
    //         throw Exception("state is not supported");
    //       }
    //     })),
    // );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var height = MediaQuery.of(context).size.height * 0.8;
  //   var width = MediaQuery.of(context).size.width * 0.8;
  //   final bool rotated = MediaQuery.of(context).size.height < width;
  //
  //   return BlocProvider(
  //     create: (context) {
  //       final reserveFoodBloc = ReserveFoodBloc(
  //           mealFoodRepository: mealFoodRepository
  //       );
  //       reserveFoodBloc.add(ReserveFoodStarted(picked_date: Jalali.now(), SelfServiceId: 1, ));
  //       return reserveFoodBloc;
  //     },
  //     child: Scaffold(
  //       appBar: AppBar(
  //         toolbarOpacity: 1,
  //         // color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
  //
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         flexibleSpace: Column(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Align(
  //               alignment: Alignment.topCenter,
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 10, left: 15),
  //                 child: Text(
  //                   "رزرو غذا",
  //                   style: TextStyle(
  //                     color: Colors.grey[500],
  //                     fontSize: width * 0.07,
  //                     // fontFamily: 'decotype-thuluth-ii',
  //                     fontWeight: FontWeight.w900,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //
  //             Padding(
  //               padding: EdgeInsets.only(bottom: height * 0.011),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: EdgeInsets.only(right: width * 0.12),
  //                     child: Text(
  //                       "وعده های روز : ",
  //                       style: TextStyle(
  //                         // color: Theme.of(context).colorScheme.secondary,
  //                         fontSize: MediaQuery.of(context).size.width / 25,
  //                         // fontFamily: 'decotype-thuluth-ii',
  //                         fontWeight: FontWeight.w300,
  //                       ),
  //                     ),
  //                   ),
  //
  //                   Padding(
  //                     padding: EdgeInsets.only(left: width * 0.07),
  //                     child: Card(
  //                       color: Theme.of(context)
  //                           .colorScheme
  //                           .secondary
  //                           .withOpacity(0.145),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                       ),
  //                       shadowColor: Colors.transparent,
  //                       child: SizedBox(
  //                         height: MediaQuery.of(context).size.width * 0.1,
  //                         width: MediaQuery.of(context).size.width * 0.55,
  //                         child: InkWell(
  //                           hoverColor: Colors.white70,
  //                           enableFeedback: true,
  //                           onTap: () async {
  //                             String _selection = "";
  //
  //                             Jalali? picked = await showPersianDatePicker(
  //                               context: context,
  //                               initialDate: date,
  //                               firstDate: Jalali(1399, 1),
  //                               lastDate: Jalali(1410, 12),
  //                             );
  //                             // setState(() {
  //                             //   date = picked!;
  //                             //   label_date = picked!.formatFullDate();
  //                             //   fetched = false;
  //                             // });
  //
  //                             // get_data();
  //                             BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: 1));
  //
  //                           },
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 date.formatFullDate() ?? "",
  //                                 style: TextStyle(
  //                                   color: Theme.of(context).colorScheme.secondary,
  //                                   fontSize:
  //                                   MediaQuery.of(context).size.width / 27,
  //                                   // fontFamily: 'decotype-thuluth-ii',
  //                                   fontWeight: FontWeight.w300,
  //                                 ),
  //                               ),
  //                               SizedBox(width: 10),
  //                               Padding(
  //                                 padding: EdgeInsets.only(left: 5),
  //                                 child: Icon(
  //                                   LineariconsFree.calendar_full,
  //                                   color: Theme.of(context).colorScheme.secondary,
  //                                   // size: width * 0.09,
  //
  //                                 ),
  //                               ),
  //
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // Text(
  //                   //   '',
  //                   //   style: TextStyle(
  //                   //     color: Theme.of(context).colorScheme.secondary,
  //                   //     fontSize: MediaQuery.of(context).size.height/7,
  //                   //     fontFamily: 'decotype-thuluth-ii',
  //                   //     fontWeight: FontWeight.w300,
  //                   //   ),
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(bottom: height * 0.011),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: EdgeInsets.only(right: width * 0.12),
  //                     child: Text(
  //                       "سلف : ",
  //                       style: TextStyle(
  //                         // color: Theme.of(context).colorScheme.secondary,
  //                         fontSize: MediaQuery.of(context).size.width / 25,
  //                         // fontFamily: 'decotype-thuluth-ii',
  //                         fontWeight: FontWeight.w300,
  //                       ),
  //                     ),
  //                   ),
  //
  //                   // Padding(
  //                   //   padding: EdgeInsets.only(left: width * 0.07),
  //                   //   child: Card(
  //                   //     color: Theme.of(context)
  //                   //         .colorScheme
  //                   //         .secondary
  //                   //         .withOpacity(0.145),
  //                   //     shape: RoundedRectangleBorder(
  //                   //       borderRadius: BorderRadius.circular(10.0),
  //                   //     ),
  //                   //     shadowColor: Colors.transparent,
  //                   //     child: SizedBox(
  //                   //       height: MediaQuery.of(context).size.width * 0.1,
  //                   //       width: MediaQuery.of(context).size.width * 0.55,
  //                   //       child: InkWell(
  //                   //         hoverColor: Colors.white70,
  //                   //         enableFeedback: true,
  //                   //         onTap: () async {
  //                   //           // showDialog(
  //                   //           //   context: context,
  //                   //           //   builder: (BuildContext context) {
  //                   //           //     return AlertDialog(
  //                   //           //         shape: RoundedRectangleBorder(
  //                   //           //             borderRadius:
  //                   //           //             BorderRadius.circular(30)),
  //                   //           //         // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
  //                   //           //         //   title: Text("اطلاعات تگ :"),
  //                   //           //         content: Container(
  //                   //           //           height: height * 0.9,
  //                   //           //             width: width * 0.9,
  //                   //           //             decoration: BoxDecoration(
  //                   //           //               borderRadius: BorderRadius.only(
  //                   //           //                 topLeft: Radius.circular(40),
  //                   //           //                 topRight: Radius.circular(40),
  //                   //           //               ),
  //                   //           //               color: Colors.white,// Theme.of(context).colorScheme.secondary,
  //                   //           //             ),
  //                   //           //             child: SelectSelfServiceWidget(context:context)
  //                   //           //         )
  //                   //           //     );
  //                   //           //   },
  //                   //           // );
  //                   //           // Hive.box('cache').put('date',picked);
  //                   //
  //                   //           // get_data();
  //                   //
  //                   //           await showModalBottomSheet(
  //                   //             isDismissible: true,
  //                   //             backgroundColor: Colors.transparent,
  //                   //             context: context,
  //                   //             builder: (BuildContext context) {
  //                   //               return ChangeSelfServiceWidget();
  //                   //             },
  //                   //           );
  //                   //           setState((){
  //                   //             self_service = Hive.box('cache').get('selected_self_service', defaultValue: SelfService(id:1, name: "مرکزی"));
  //                   //           });
  //                   //           _refresh();
  //                   //         },
  //                   //         child: Row(
  //                   //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   //           crossAxisAlignment: CrossAxisAlignment.center,
  //                   //           children: [
  //                   //             Text(
  //                   //               self_service.name as String ?? "",
  //                   //               style: TextStyle(
  //                   //                 color: Theme.of(context).colorScheme.secondary,
  //                   //                 fontSize:
  //                   //                 MediaQuery.of(context).size.width / 27,
  //                   //                 // fontFamily: 'decotype-thuluth-ii',
  //                   //                 fontWeight: FontWeight.w300,
  //                   //               ),
  //                   //             ),
  //                   //             SizedBox(width: 10),
  //                   //             Padding(
  //                   //               padding: EdgeInsets.only(left: 5),
  //                   //               child: Icon(
  //                   //                 LineariconsFree.store,
  //                   //                 color: Theme.of(context).colorScheme.secondary,
  //                   //                 size: width * 0.09,
  //                   //               ),
  //                   //             ),
  //                   //
  //                   //           ],
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //
  //         ],
  //         toolbarHeight: rotated
  //             ? MediaQuery.of(context).size.height * 0.2
  //             : MediaQuery.of(context).size.width * 0.4,
  //         backgroundColor: Colors.white,
  //         leading: Align(
  //           alignment: Alignment.topRight,
  //           child: Padding(
  //             padding: EdgeInsets.only(top: 10, right: 5),
  //             child: IconButton(
  //               icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
  //               onPressed: () => Navigator.of(context).pop(false),
  //             ),
  //           ),
  //         ),
  //       ),
  //
  //       body: SafeArea(
  //         child: BlocBuilder<ReserveFoodBloc, ReserveFoodState>(builder: ((context, state) {
  //           if (state is ReserveFoodSuccess) {
  //             return ListView.builder(
  //                 itemCount: 5,
  //                 padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
  //                 itemBuilder: (context, index) {
  //                   // switch (index) {
  //                   //   case 0:
  //                   //     return Image.asset(
  //                   //       'assets/img/nike_logo.png',
  //                   //       height: 32,
  //                   //     );
  //                   //   default:
  //                   //     return Container();
  //                   // }
  //                   return FoodReserveCard(
  //                     meal_food: state.meal_foods[index],
  //                   );
  //                 });
  //
  //           } else if (state is ReserveFoodLoading) {
  //             return const Center(child: CircularProgressIndicator());
  //           } else if (state is ReserveFoodError) {
  //             return Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Text(state.exception.message),
  //                   ElevatedButton(
  //                       onPressed: () {
  //                         BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: date, SelfServiceId: 1));
  //                       },
  //                       child: const Text('تلاش دوباره')),
  //                 ],
  //               ),
  //             );
  //           } else if (state is ReserveFoodRefresh || state is ReserveFoodStarted) {
  //             throw Exception('state is not supported ReserveFoodRefresh');
  //           }else {
  //             throw Exception(state.toString());
  //           }
  //         })),
  //       ),
  //     ),
  //   );
  // }
}



