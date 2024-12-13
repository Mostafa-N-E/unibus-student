import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../common/http_client.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snackbar.dart';


class SmallScreenFoodReactionWidget extends StatefulWidget {
  MealFoodEntity meal_food;
  final Function() notifyParent;
  SmallScreenFoodReactionWidget({Key? key, required this.meal_food, required this.notifyParent}) : super(key: key);

  @override
  State<SmallScreenFoodReactionWidget> createState() => _SmallScreenFoodReactionWidgetState();
}

class _SmallScreenFoodReactionWidgetState extends State<SmallScreenFoodReactionWidget> {
  // Map profile_data = Hive.box('cache').get('profile_data', defaultValue: {});
  int _selectedIndex = 2;
  String send_button_text = "ارسال";
  bool is_change_vote = false;
  int previous_vote = -1;
  int report_int = 1;
  @override
  void initState() {
    print("|||||||||||||||||||||||||||||||||||||||||||");

    setState((){
      report_int = widget.meal_food.get_reaction(global_userInfo.id);
      if(report_int != -1){
        send_button_text = "تغییر دادن";
        is_change_vote = true;
        previous_vote = report_int;
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: height * 0.03,
        mediumScreen_size: height * 0.067,
        smallScreen_size: height * 0.06,
        min_size: height * 0.12,
        max_size: height * 0.03,
        context: context
    ).get_height_size();
    double icon_size = ResponsiveSizeWidget(
        largeScreen_size: height * 0.03,
        mediumScreen_size: height * 0.05,
        smallScreen_size: height * 0.04,
        min_size: height * 0.12,
        max_size: height * 0.03,
        context: context
    ).get_custom_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: height * 0.03,
        mediumScreen_size: height * 0.05,
        smallScreen_size: height * 0.04,
        min_size: height * 0.1,
        max_size: height * 0.02,
        context: context
    ).get_custom_size();

    Map<int,dynamic> states = {
      0:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.smile,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "خوب بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      1:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.neutral,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "نه خوب بود، نه بد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      2:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.sad,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "بد بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    };
    final List<int> states_key = states.keys.toList();

    return Container(
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,// Theme.of(context).colorScheme.secondary,
      ),
      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       const Text('Modal BottomSheet'),
      //       ElevatedButton(
      //         child: const Text('Close BottomSheet'),
      //         onPressed: () => Navigator.pop(context),
      //       ),
      //     ],
      //   ),
      // ),
      child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.03),
                    child: Center(
                      child: Text("ثبت بازخورد" as String,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: h1_text_size * 0.85,
                            fontWeight: FontWeight.w800,
                          )
                        //   TextStyle(
                        //     fontSize: 43,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w900
                        // ),
                      ),
                    ),
                  ),
                  // Text(
                  //     "گزارش خرابی",
                  //     style: TextStyle(
                  //       overflow: TextOverflow.ellipsis,
                  //       color: Colors.black87,
                  //       fontSize: MediaQuery.of(context).size.width/15,
                  //       // fontFamily: 'a-thuluth',
                  //       fontWeight: FontWeight.w500,
                  //     )
                  // ),
                  ResponsiveLayout.isMobileSmall(context) ? Center() : Padding(
                    padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                    child: Text(
                        "لطفا نظر خود را درباره این وعده غذایی با انتخاب یکی از گزینه های زیر اعلام کنید",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                          fontSize: b_text_size * 0.55,
                          // fontFamily: 'a-thuluth',
                          // fontWeight: FontWeight.w500,
                        )
                    ),
                  ),
                  ResponsiveLayout.isMobileSmall(context) ? Center() : Padding(
                    padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                    child: Text(
                        "با شرکت در این نظز سنجی ما را در ارتقا کیفیت غذا ها و ارزیابی بهتر یاری میکنید",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                          fontSize: b_text_size * 0.45,
                          // fontFamily: 'a-thuluth',
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      0,
                      20,
                      0,
                    ),
                    itemCount: states_key.length,
                    itemBuilder: (context, idx) {
                      return ListTileTheme(
                        child: ListTile(
                          // title: Text(
                          //   states[states_key[idx]] as String,
                          //   style: TextStyle(
                          //     color: Colors.black87,
                          //   ),
                          // ),
                          title: states[states_key[idx]],
                          leading: Radio(
                            value: states_key[idx],
                            groupValue: report_int,
                            onChanged: (value) {
                              // top_screen.items = [];
                              report_int = states_key[idx];
                              // top_screen.fetched = false;
                              // Hive.box('settings').put('region', region);
                              // Navigator.pop(context);
                              setState((){});
                            },
                          ),
                          // selected: report_str == states_key[idx],
                          selected: _selectedIndex == idx,
                          onTap: () {
                            setState(() {
                              _selectedIndex = idx;
                            });
                            // top_screen.items = [];
                            report_int = states_key[idx];
                            // top_screen.fetched = false;
                            // Hive.box('settings').put('region', region);
                            // Navigator.pop(context);
                            setState((){});
                          },
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      send_button_text,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                    onPressed: () async{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: CustomProgressIndicator(),
                          );
                        },
                      );
                      MealFood_API().record_feedback({
                        "meal_food_id": widget.meal_food.id,
                        "feedback_code": report_int
                      }).then((fetch_data) {
                        // item_data = fetch_data;
                        setState(() {
                          if (fetch_data['status'] == true){
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pop();

                            ShowSnackBar().showSnackBar(
                              context,
                              "ارسال شد. ممنون از ارسال بازخوردتان",
                              duration: const Duration(seconds: 3),
                              noAction: false,
                            );
                            if(is_change_vote == false){
                              switch (report_int) {
                                case 0:
                                  widget.meal_food.like.add(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.add(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.add(global_userInfo.id);
                                  break;
                              }
                            }else{
                              switch (previous_vote) {
                                case 0:
                                  widget.meal_food.like.remove(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.remove(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.remove(global_userInfo.id);
                                  break;
                              }
                              switch (report_int) {
                                case 0:
                                  widget.meal_food.like.add(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.add(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.add(global_userInfo.id);
                                  break;
                              }
                            }
                            widget.notifyParent();
                          }else{
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pop();

                            showDialog(
                              context: context,
                              builder: (
                                  BuildContext context) {
                                // print("-----------------------------------------object");
                                // print(result);
                                return CustomAlertDialog(
                                    content: Container(
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(30)
                                      // ),
                                      height: height * 0.5,
                                      // color: data!['status'] as bool ? Colors.green : Colors.red,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Text('${value["nfca"]["identifier"]}'),
                                          Icon(
                                            fetch_data!['status'] as bool
                                                ? LineariconsFree
                                                .checkmark_cicle
                                                : LineariconsFree
                                                .cross,
                                            color: fetch_data!['status']
                                            as bool
                                                ? Colors
                                                .green
                                                : Colors
                                                .red,
                                            size: 170,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10) ,
                                            child: Text(
                                              fetch_data!['message'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: fetch_data!['status']
                                                as bool
                                                    ? Colors
                                                    .green
                                                    : Colors
                                                    .red,
                                                // fontSize: 20
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ));
                              },
                            );
                          }
                        });
                      });



                    },
                    style: ElevatedButton.styleFrom(
                      elevation:0 ,
                      minimumSize: Size(width , height * 0.07),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.175),//Colors.white70,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  )

                  // Padding(
                  //   padding: EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 10),
                  //   child: TextButton(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  //       child: Text('ارسال',
                  //           style: TextStyle(
                  //               color: Colors.red,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500)),
                  //     ),
                  //     style: TextButton.styleFrom(
                  //       primary: Colors.red,
                  //       onSurface: Colors.yellow,
                  //       side: BorderSide(color: Colors.red, width: 3),
                  //       shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(25))),
                  //     ),
                  //     onPressed: () => Navigator.pop(context),
                  //   ),
                  // ),


                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.red,
                  //       // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  //       textStyle: TextStyle(
                  //           // fontSize: 30,
                  //           fontWeight: FontWeight.bold)
                  //   ),
                  //   child: const Text('ارسال'),
                  //   onPressed: () => Navigator.pop(context),
                  // ),
                ]
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: ,
            // ),

            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.maximize_rounded,
                size: h1_text_size * 2,
                color: Colors.grey[400],
              ),
            ),
          ]
      ),
    );

  }
}



class LargeScreenFoodReactionWidget extends StatefulWidget {
  MealFoodEntity meal_food;
  final Function() notifyParent;
  LargeScreenFoodReactionWidget({Key? key, required this.meal_food, required this.notifyParent}) : super(key: key);

  @override
  State<LargeScreenFoodReactionWidget> createState() => _LargeScreenFoodReactionWidgetState();
}

class _LargeScreenFoodReactionWidgetState extends State<LargeScreenFoodReactionWidget> {
  // Map profile_data = Hive.box('cache').get('profile_data', defaultValue: {});
  int _selectedIndex = 2;
  String send_button_text = "ارسال";
  bool is_change_vote = false;
  int previous_vote = -1;
  int report_int = 1;
  @override
  void initState() {
    print("|||||||||||||||||||||||||||||||||||||||||||");

    setState((){
      report_int = widget.meal_food.get_reaction(global_userInfo.id);
      if(report_int != -1){
        send_button_text = "تغییر دادن";
        is_change_vote = true;
        previous_vote = report_int;
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.025,
        mediumScreen_size: width * 0.03,
        smallScreen_size: width * 0.07,
        min_size: width * 0.08,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.015,
        mediumScreen_size: width * 0.02,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.013,
        context: context
    ).get_width_size();
    double icon_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.04,
        min_size: width * 0.12,
        max_size: width * 0.03,
        context: context
    ).get_width_size();

    Map<int,dynamic> states = {
      0:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(b_text_size * 0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.smile,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "خوب بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      1:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(b_text_size * 0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.neutral,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "نه خوب بود، نه بد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      2:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: EdgeInsets.all(b_text_size * 0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  LineariconsFree.sad,
                  color:  Colors.grey[600],
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "بد بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: b_text_size * 0.7
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    };
    final List<int> states_key = states.keys.toList();

    return Container(
      height: ResponsiveLayout.isTablet(context) ? height * 0.85 : height * 0.7,
      width: ResponsiveLayout.isTablet(context) ? width * 0.85 : width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(h1_text_size * 1.7),
          topRight: Radius.circular(h1_text_size * 1.7),
        ),
        color: Colors.white,// Theme.of(context).colorScheme.secondary,
      ),
      child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: b_text_size * 0.1),
                    child: Center(
                      child: Text("ثبت بازخورد" as String,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: h1_text_size * 1,
                            fontWeight: FontWeight.w800,
                          )
                        //   TextStyle(
                        //     fontSize: 43,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w900
                        // ),
                      ),
                    ),
                  ),
                  // Text(
                  //     "گزارش خرابی",
                  //     style: TextStyle(
                  //       overflow: TextOverflow.ellipsis,
                  //       color: Colors.black87,
                  //       fontSize: MediaQuery.of(context).size.width/15,
                  //       // fontFamily: 'a-thuluth',
                  //       fontWeight: FontWeight.w500,
                  //     )
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                    child: Text(
                        "لطفا نظر خود را درباره این وعده غذایی با انتخاب یکی از گزینه های زیر اعلام کنید",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                          fontSize: b_text_size,
                          // fontFamily: 'a-thuluth',
                          // fontWeight: FontWeight.w500,
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                    child: Text(
                        "با شرکت در این نظز سنجی ما را در ارتقا کیفیت غذا ها و ارزیابی بهتر یاری میکنید",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                          fontSize: b_text_size * 0.7,
                          // fontFamily: 'a-thuluth',
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      0,
                      20,
                      0,
                    ),
                    itemCount: states_key.length,
                    itemBuilder: (context, idx) {
                      return ListTileTheme(
                        child: ListTile(
                          // title: Text(
                          //   states[states_key[idx]] as String,
                          //   style: TextStyle(
                          //     color: Colors.black87,
                          //   ),
                          // ),
                          title: states[states_key[idx]],
                          leading: Radio(
                            value: states_key[idx],
                            groupValue: report_int,
                            onChanged: (value) {
                              // top_screen.items = [];
                              report_int = states_key[idx];
                              // top_screen.fetched = false;
                              // Hive.box('settings').put('region', region);
                              // Navigator.pop(context);
                              setState((){});
                            },
                          ),
                          // selected: report_str == states_key[idx],
                          selected: _selectedIndex == idx,
                          onTap: () {
                            setState(() {
                              _selectedIndex = idx;
                            });
                            // top_screen.items = [];
                            report_int = states_key[idx];
                            // top_screen.fetched = false;
                            // Hive.box('settings').put('region', region);
                            // Navigator.pop(context);
                            setState((){});
                          },
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                        send_button_text,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                    onPressed: () async{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: CustomProgressIndicator(),
                          );
                        },
                      );
                      MealFood_API().record_feedback({
                        "meal_food_id": widget.meal_food.id,
                        "feedback_code": report_int
                      }).then((fetch_data) {
                        // item_data = fetch_data;
                        setState(() {
                          if (fetch_data['status'] == true){
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pop();

                            ShowSnackBar().showSnackBar(
                              context,
                              "ارسال شد. ممنون از ارسال بازخوردتان",
                              duration: const Duration(seconds: 3),
                              noAction: false,
                            );
                            if(is_change_vote == false){
                              switch (report_int) {
                                case 0:
                                  widget.meal_food.like.add(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.add(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.add(global_userInfo.id);
                                  break;
                              }
                            }else{
                              switch (previous_vote) {
                                case 0:
                                  widget.meal_food.like.remove(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.remove(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.remove(global_userInfo.id);
                                  break;
                              }
                              switch (report_int) {
                                case 0:
                                  widget.meal_food.like.add(global_userInfo.id);
                                  break;
                                case 1:
                                  widget.meal_food.refused.add(global_userInfo.id);
                                  break;
                                case 2:
                                  widget.meal_food.dislike.add(global_userInfo.id);
                                  break;
                              }
                            }
                            widget.notifyParent();
                          }else{
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pop();

                            showDialog(
                              context: context,
                              builder: (
                                  BuildContext context) {
                                // print("-----------------------------------------object");
                                // print(result);
                                return CustomAlertDialog(
                                    content: Container(
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(30)
                                      // ),
                                      height: height * 0.5,
                                      // color: data!['status'] as bool ? Colors.green : Colors.red,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Text('${value["nfca"]["identifier"]}'),
                                          Icon(
                                            fetch_data!['status'] as bool
                                                ? LineariconsFree
                                                .checkmark_cicle
                                                : LineariconsFree
                                                .cross,
                                            color: fetch_data!['status']
                                            as bool
                                                ? Colors
                                                .green
                                                : Colors
                                                .red,
                                            size: 170,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10) ,
                                            child: Text(
                                              fetch_data!['message'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: fetch_data!['status']
                                                as bool
                                                    ? Colors
                                                    .green
                                                    : Colors
                                                    .red,
                                                // fontSize: 20
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ));
                              },
                            );
                          }
                        });
                      });



                    },
                    style: ElevatedButton.styleFrom(
                      elevation:0 ,
                      minimumSize: Size(width , height * 0.07),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.175),//Colors.white70,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  )

                  // Padding(
                  //   padding: EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 10),
                  //   child: TextButton(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  //       child: Text('ارسال',
                  //           style: TextStyle(
                  //               color: Colors.red,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500)),
                  //     ),
                  //     style: TextButton.styleFrom(
                  //       primary: Colors.red,
                  //       onSurface: Colors.yellow,
                  //       side: BorderSide(color: Colors.red, width: 3),
                  //       shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(25))),
                  //     ),
                  //     onPressed: () => Navigator.pop(context),
                  //   ),
                  // ),


                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.red,
                  //       // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  //       textStyle: TextStyle(
                  //           // fontSize: 30,
                  //           fontWeight: FontWeight.bold)
                  //   ),
                  //   child: const Text('ارسال'),
                  //   onPressed: () => Navigator.pop(context),
                  // ),
                ]
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Icon(
            //     Icons.maximize_rounded,
            //     size: h1_text_size * 2,
            //     color: Colors.grey[600],
            //   ),
            // ),
          ]
      ),
    );

  }
}