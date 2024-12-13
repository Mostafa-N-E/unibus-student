import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/fast_cached_image.dart';
import '../bloc/reserve_status_bloc.dart';

class LargeReserveStatusPage extends StatefulWidget {
  final Map week_reserve_status_mealfoods;
  final DateTime start_week_dateTime;
  final int date_code;

  LargeReserveStatusPage({Key? key, required this.week_reserve_status_mealfoods, required this.start_week_dateTime, required this.date_code,}) : super(key: key);

  @override
  State<LargeReserveStatusPage> createState() => _LargeReserveStatusPageState();
}

class _LargeReserveStatusPageState extends State<LargeReserveStatusPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_6 = new GlobalKey<RefreshIndicatorState>();

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
        mediumScreen_size: width * 0.21,
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
    double dataRowHeight  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.095,
        mediumScreen_size: height * 0.11,
        smallScreen_size: height * 0.15,
        min_size: height * 0.15,
        max_size: height * 0.095,
        context: context
    ).get_custom_size();
    double dataRowWidth  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.23,
        mediumScreen_size: width * 0.19,
        smallScreen_size: height * 0.15,
        min_size: width * 0.17,
        max_size: width * 0.235,
        context: context
    ).get_custom_size();
    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.045,
        mediumScreen_size: width * 0.043,
        smallScreen_size: width * 0,
        min_size: width * 0.1,
        max_size: width * 0.047,
        context: context
    ).get_width_size();
    double top_padding = ResponsiveSizeWidget(
        largeScreen_size: height * 0.011,
        mediumScreen_size: height * 0.01,
        smallScreen_size: height * 0,
        min_size: height * 0.1,
        max_size: height * 0.016,
        context: context
    ).get_height_size();
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

    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey_6,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Center(
            child: DataTable(
              dataRowHeight: dataRowHeight,
              columns: <DataColumn>[

                DataColumn(
                  label: Text(
                    'تاریخ و روز',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth,
                    child: Text(
                      'صبحانه',
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth,
                    child: Text(
                      'ناهار',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: dataRowWidth,
                    child: Text(
                      'شام',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                          width: dataRowWidth * 0.7,
                          child: Text(
                            // weekdays[day]+'\n'+'1401-9-11',
                            ResponsiveLayout.isTablet(context) ?
                              Jalali.fromDateTime(widget.start_week_dateTime).addDays(day).formatMediumDate().toPersianDigit()
                            :
                              Jalali.fromDateTime(widget.start_week_dateTime).addDays(day).formatFullDate().toPersianDigit()
                            ,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: b_text_size * 0.55

                            ),

                          ),
                        ),
                      ),
                      for (var meal in ['1', '2', '3'] as List)
                        DataCell(
                          (widget.week_reserve_status_mealfoods[day.toString()][meal].isEmpty) ?
                          Container(
                            width: dataRowWidth,
                            // height: height * 0.13,
                            child: Center(
                              child: Icon(
                                (widget.week_reserve_status_mealfoods[day.toString()][meal].isEmpty) ?
                                Icons.close_rounded :
                                Icons.check_circle_rounded,
                                color: (widget.week_reserve_status_mealfoods[day.toString()][meal].isEmpty) ?
                                Colors.grey[600] :
                                Colors.green,
                              ),
                            ),
                          )
                          :
                          Padding(
                            padding: EdgeInsets.only(left: 0),
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
                                            height: height * 0.6,
                                            width: width * 0.7,
                                            // color: data!['status'] as bool ? Colors.green : Colors.red,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: image_width * 1.1,
                                                    width: image_width * 1.1,
                                                    child: fast_cached_image_builder(
                                                        main_image_url: widget.week_reserve_status_mealfoods[day.toString()][meal][0]['image'].toString(), placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                                                    )
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['meal'].toString(),
                                                      style: TextStyle(
                                                        // color: isDarkMode
                                                        //     ? Colors.white
                                                        //     : Colors.white,
                                                        color: Colors.grey[500],
                                                        //Theme.of(context).colorScheme.secondary,
                                                        fontSize: h1_text_size,
                                                        // fontFamily: 'decotype-thuluth-ii',
                                                        fontWeight: FontWeight.w900,
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: EdgeInsets.only(top: top_padding,right: 7, left: 7),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: padding),
                                                              child: Icon(
                                                                LineariconsFree.store,
                                                                size: image_width * 0.2,
                                                                color: Colors.grey[600],
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: padding),
                                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['self_service'] as String,
                                                                  style: TextStyle(
                                                                    // color: isDarkMode
                                                                    //     ? Colors.white
                                                                    //     : Colors.white,
                                                                    color: Colors.grey[500],
                                                                    //Theme.of(context).colorScheme.secondary,
                                                                    fontSize: b_text_size,
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
                                                          top:top_padding ,right: 7, left: 7
                                                      ),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: padding),
                                                              child: Icon(
                                                                Linecons.food,
                                                                size: image_width * 0.2,
                                                                color: Colors.grey[600],
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: padding),
                                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['food'] as String,
                                                                  style: TextStyle(
                                                                    // color: isDarkMode
                                                                    //     ? Colors.white
                                                                    //     : Colors.white,
                                                                    color: Colors.grey[500],
                                                                    //Theme.of(context).colorScheme.secondary,
                                                                    fontSize: b_text_size,
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
                              child: Card(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.145),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                shadowColor: Colors.transparent,
                                child: SizedBox(
                                  height: dataRowHeight * 1,
                                  width: dataRowWidth * 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            if(! ResponsiveLayout.isTablet(context))
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0),
                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['self_service'] as String,
                                                  style: TextStyle(
                                                    // color: isDarkMode
                                                    //     ? Colors.white
                                                    //     : Colors.white,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    //Theme.of(context).colorScheme.secondary,
                                                    fontSize: b_text_size * 0.6,
                                                    // fontFamily: 'decotype-thuluth-ii',
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                )
                                            ),
                                            if(! ResponsiveLayout.isTablet(context))
                                              Text(" - "),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0),
                                                child: Text(widget.week_reserve_status_mealfoods[day.toString()][meal][0]['food'] as String,
                                                  style: TextStyle(
                                                    // color: isDarkMode
                                                    //     ? Colors.white
                                                    //     : Colors.white,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    //Theme.of(context).colorScheme.secondary,
                                                    fontSize: b_text_size * 0.6,
                                                    // fontFamily: 'decotype-thuluth-ii',
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                )
                                            ),

                                          ]
                                      ),
                                      // SizedBox(width: 10),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Icon(
                                          LineariconsFree.dinner,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: b_text_size,

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
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
      floatingActionButton:
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
