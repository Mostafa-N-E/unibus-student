import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/fast_cached_image.dart';
import '../bloc/reserve_status_bloc.dart';

class SmallReserveStatusPage extends StatefulWidget {
  final Map week_reserve_status_mealfoods;
  final DateTime start_week_dateTime;
  final int date_code;

  SmallReserveStatusPage({Key? key, required this.week_reserve_status_mealfoods, required this.start_week_dateTime, required this.date_code,}) : super(key: key);

  @override
  State<SmallReserveStatusPage> createState() => _SmallReserveStatusPageState();
}

class _SmallReserveStatusPageState extends State<SmallReserveStatusPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_5 = new GlobalKey<RefreshIndicatorState>();

  Jalali date = Jalali.now();

  Map weekdays = {'0': "شنبه", '1': "یک شنبه", '2': "دو شنبه", '3': "سه شنبه", '4': "چهارشنبه", '5': "پنجشنبه", '6': "جمعه"};

  Future<void> _refresh() async{
    // setState((){fetched = false; status = false;} );
    // await get_data();
    setState((){} );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;

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
    double dataRowHeight  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.095,
        mediumScreen_size: height * 0.1,
        smallScreen_size: height * 0.09,
        min_size: height * 0.08,
        max_size: height * 0.095,
        context: context
    ).get_custom_size();
    double dataRowWidth  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.23,
        mediumScreen_size: width * 0.13,
        smallScreen_size: width * 0.12,
        min_size: width * 0.09,
        max_size: width * 0.235,
        context: context
    ).get_custom_size();

    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey_5,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 30),
          child: Center(
            child: DataTable(
              // dataRowHeight: dataRowHeight * 1,
              columns: <DataColumn>[
                DataColumn(
                  label: Container(
                    // width: dataRowWidth * 1.5,
                    child: Text(
                      'تاریخ و روز',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          // fontSize: b_text_size * 0.55
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth * 1,
                    child: Text(
                      'صبحانه',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: b_text_size * 0.75
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth * 1,
                    child: Text(
                      'ناهار',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                          // fontSize: b_text_size * 0.65
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth * 1,
                    child: Text(
                      'شام',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // fontSize: b_text_size * 0.65
                      ),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                for (var day in [0, 1, 2, 3, 4, 5, 6] as List)
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          // width: dataRowWidth * 2.5,
                          child: Text(
                            // weekdays[day]+'\n'+'1401-9-11',
                            Jalali.fromDateTime(widget.start_week_dateTime).addDays(day).formatShortMonthDay().toPersianDigit(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: b_text_size * 0.8
                            ),
                          ),
                        ),
                      ),
                      for (var meal in ['1', '2', '3'] as List)
                        DataCell(
                          Container(
                            width: dataRowWidth * 1,
                            child: InkWell(
                              onTap: (){
                                if (widget.week_reserve_status_mealfoods[day.toString()][meal].isNotEmpty){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext _context) {
                                      return CustomAlertDialog(
                                          content: Container(
                                            // decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(30)
                                            // ),
                                            height: MediaQuery.of(context)
                                                .size
                                                .height * 0.6,
                                            // color: data!['status'] as bool ? Colors.green : Colors.red,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: width * 0.6,
                                                    width: width * 0.6,
                                                    child: fast_cached_image_builder(
                                                        main_image_url: widget.week_reserve_status_mealfoods[day.toString()][meal][0]['image'].toString(), placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                                                    )
                                                ),
                                                Center(
                                                    child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['meal'].toString(),
                                                      style: TextStyle(
                                                        // color: isDarkMode
                                                        //     ? Colors.white
                                                        //     : Colors.white,
                                                        color: Colors.grey[500],
                                                        //Theme.of(context).colorScheme.secondary,
                                                        fontSize: width * 0.1,
                                                        // fontFamily: 'decotype-thuluth-ii',
                                                        fontWeight: FontWeight.w900,
                                                      ),
                                                    )
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: height * 0.05,right: 7, left: 7),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: width * 0.1),
                                                              child: Icon(
                                                                LineariconsFree.store,
                                                                size: width * 0.1,
                                                                color: Colors.grey[600],
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: width * 0.1),
                                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['self_service'] as String,
                                                                  style: TextStyle(
                                                                    // color: isDarkMode
                                                                    //     ? Colors.white
                                                                    //     : Colors.white,
                                                                    color: Colors.grey[500],
                                                                    //Theme.of(context).colorScheme.secondary,
                                                                    fontSize: width * 0.05,
                                                                    // fontFamily: 'decotype-thuluth-ii',
                                                                    fontWeight: FontWeight.w200,
                                                                  ),
                                                                )
                                                            ),

                                                          ]
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top:height * 0.01 ,right: 7, left: 7
                                                      ),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: width * 0.1),
                                                              child: Icon(
                                                                Linecons.food,
                                                                size: width * 0.1,
                                                                color: Colors.grey[600],
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: width * 0.1),
                                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['food'] as String,
                                                                  style: TextStyle(
                                                                    // color: isDarkMode
                                                                    //     ? Colors.white
                                                                    //     : Colors.white,
                                                                    color: Colors.grey[500],
                                                                    //Theme.of(context).colorScheme.secondary,
                                                                    fontSize: width * 0.05,
                                                                    // fontFamily: 'decotype-thuluth-ii',
                                                                    fontWeight: FontWeight.w200,
                                                                  ),
                                                                )
                                                            ),

                                                          ]
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                      );
                                    },
                                  );
                                }
                              },
                              child: Icon(
                                (widget.week_reserve_status_mealfoods[day.toString()][meal].isEmpty) ?
                                Icons.close_rounded :
                                Icons.check_circle_rounded,
                                color: (widget.week_reserve_status_mealfoods[day.toString()][meal].isEmpty) ?
                                Colors.grey[600] :
                                Colors.green,
                                // size: b_text_size * 0.5,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: rotated ? null :
      Padding(
        padding: EdgeInsets.only(right: 35),
        child: Card(
          // color:  Theme.of(context).colorScheme.secondary.withOpacity(0.17) ,
          // shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          // margin: EdgeInsets.fromLTRB(7, 7, 7, 10),
          child: Container(
            // margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
            height: height * 0.07,
            decoration: BoxDecoration(
              // color: isDarkMode ? Colors.black87 : Colors.white,
              //   color: Color(0xF5F5F5),
                boxShadow: [
                  //if(isDarkMode)
                  BoxShadow(
                    // color: Theme.of(context).colorScheme.primary,
                    color: Colors.white.withOpacity(0.19),
                    // offset: Offset(0, 10),
                    // blurRadius: 0,
                    // spreadRadius: 0, // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    // setState(() {
                    int new_date_code = widget.date_code - 1;
                    // });
                    if(new_date_code < 0){
                      // setState(() {
                      //   date_code = 0;
                      // });
                    }else{
                      // setState(() {
                      //   fetched = false;
                      // });
                      // get_data();
                      BlocProvider.of<ReserveStatusBloc>(context).add(ReserveStatusRefresh(date_code: new_date_code));

                    }
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          LineariconsFree.chevron_right,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                      Text(
                        " هفته قبل",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize: b_text_size * 0.7,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    // setState(() {
                    //   date_code = date_code + 1;
                    //   fetched = false;
                    // });
                    // get_data();
                    BlocProvider.of<ReserveStatusBloc>(context).add(ReserveStatusRefresh(date_code: widget.date_code + 1));

                  },
                  child: Row(
                    children: [
                      Text(
                        " هفته بعد",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize: b_text_size * 0.7,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          LineariconsFree.chevron_left,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
