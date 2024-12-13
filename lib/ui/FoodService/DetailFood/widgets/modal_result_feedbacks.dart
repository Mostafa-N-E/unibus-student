
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/progress_indicator.dart';
import '../../FoodSaleDay/widgets/meal_food_chart.dart';

class ResultFeedbacksWidget extends StatefulWidget {
  final Function() notifyParent;
  MealFoodEntity meal_food;
  ResultFeedbacksWidget({required this.notifyParent, required this.meal_food});
  // const FilterWidget({super.key});

  @override
  State<ResultFeedbacksWidget> createState() => _ResultFeedbacksWidgetState();
}

class _ResultFeedbacksWidgetState extends  State<ResultFeedbacksWidget> {

  // int _selectedIndex = 3;
  // Map<String,String> states = {
  //   "time":"مغایرت در زمان برگزاری",
  //   "location":"مغایرت در مکان",
  //   "status":"مغایرت در وضعیت برگزاری",
  //   "other":"سایر موارد",
  //
  // };
  // String report_str = "other";

  Map? data;
  List<MealFoodEntity> list_result_feedback = [];
  // String date_value = '';
  bool fetched = false;
  // String current_service_name = Hive.box('settings').get('current_service_name', defaultValue: "") as String;
  // List<bool> isSelected = Hive.box('settings').get('isSelected', defaultValue: [true, false, ]);

  get_data() async{
    MealFood_API().list_result_feedback(
        {
          "meal_food_id":widget.meal_food.id
        }
    ).then((fetch_data) {
      setState(() {
        // title = widget.data['weekday'] as int;
        // data = fetch_data!;
        for (var item in fetch_data as List)
          list_result_feedback.add(meal_food_builder(item));
        fetched = true;
      });
    });
    // data = await Turn().get_turns_weekly(1);
  }
  @override
  void dispose() {
    print("::::::::::::::::::::::::::::::::::::::::::::");
    widget.notifyParent();
    super.dispose();
  }

  @override
  void initState() {
    widget.notifyParent();
    get_data();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final List<String> states_key = states.keys.toList();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // const Map<int, String> week = {7:' هر روز', 0:'شنبه', 1:'یکشنبه', 2:'دوشنبه', 3:'سه شنبه', 4:'چهارشنبه', 5:'پنجشنبه', 6:'جمعه'};
    // final List<int> weekdays = week.keys.toList();

    Map body = {};
    return Container(
      height: height,
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25),),
        color: Colors.white, //Theme.of(context).colorScheme.secondary.withOpacity(0.87),
      ),
      child: (!fetched)
          ? Center(
        child: CustomProgressIndicator(),
      )
          :SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 5,
            left: 20,
            right: 20,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                (list_result_feedback.isEmpty)
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text('${value["nfca"]["identifier"]}'),
                      Icon(LineariconsFree.cross,
                        color:Colors.redAccent.shade100,
                        size: 170,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10) ,
                        child: Text(
                          "نظر سنجی قبلی برای این غذا وجود ندارد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:Colors.grey[500],
                            // fontSize: 20
                          ),
                        ),
                      ),

                    ],
                  ),
                )
                    :
                const Center(),

                for(MealFoodEntity item in list_result_feedback)
                  _build_result_feedback(item)


              ]
          ),
        ),
      ),
    );

  }
  Widget _build_result_feedback(MealFoodEntity meal_food_item){
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CustomProgressIndicator(),
            );
          },
        );
        MealFood_API().result_feedback({
          "meal_food_id": meal_food_item.id,
          "is_last_record": false
        }).then((fetch_data) {
          print(fetch_data);
          if(fetch_data['status'] == true){
            setState(() {
              // item_data = fetch_data;
              Navigator.of(context, rootNavigator: true).pop(context);
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
                        height: MediaQuery.of(context).size.height * 0.8,
                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                        child: MealFoodChart(meal_food: meal_food_builder(fetch_data['data'])),
                      )
                  );
                },
              );

            });
          }else{
            setState(() {
              // item_data = fetch_data;
              Navigator.of(context, rootNavigator: true).pop();
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
                        height: MediaQuery.of(context).size.height * 0.5,
                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text('${value["nfca"]["identifier"]}'),
                            Icon(LineariconsFree.cross,
                              color:Colors.redAccent.shade100,
                              size: 170,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10) ,
                              child: Text(
                                fetch_data!['message'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:Colors.grey[500],
                                  // fontSize: 20
                                ),
                              ),
                            ),

                          ],
                        ),
                      ));
                },
              );

            });
          }

        });

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0,right: 15, left: 0),
                    child: Icon(
                      LineariconsFree.pie_chart,
                      size: MediaQuery.of(context).size.height * 0.045,
                      color: Colors.grey[900],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0,right: 0, left: 15),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                right: 10),
                            child: Text(
                              meal_food_item.date.toPersianDigit(),
                              style: TextStyle(
                                // color: isDarkMode
                                //     ? Colors.white
                                //     : Colors.white,
                                color: Colors.grey[800],
                                //Theme.of(context).colorScheme.secondary,
                                fontSize: MediaQuery.of(context).size.width * 0.043,
                                // fontFamily: 'decotype-thuluth-ii',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       right: width * 0.1),
                                //   child: Icon(
                                //     LineariconsFree.store,
                                //     size: width * 0.1,
                                //     color: Colors.grey[600],
                                //   ),
                                // ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 0),
                                    child: Text("سلف"+" "+meal_food_item.self_service.name as String,
                                      style: TextStyle(
                                        // color: isDarkMode
                                        //     ? Colors.white
                                        //     : Colors.white,
                                        color: Colors.grey[800],
                                        //Theme.of(context).colorScheme.secondary,
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                        // fontFamily: 'decotype-thuluth-ii',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                ),

                              ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 0,right: 0, left: 15),
                child: Icon(
                  LineariconsFree.chevron_left,
                  size: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
