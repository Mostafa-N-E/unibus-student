import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/meal_food.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/gradient_container.dart';
import '../../../widgets/progress_indicator.dart';

class ChangeSelfServiceWidget extends StatefulWidget {
  final List<SelfServiceEntity> self_services;
  const ChangeSelfServiceWidget({super.key, required this.self_services});

  @override
  State<ChangeSelfServiceWidget> createState() => _ChangeSelfServiceWidgetState();
}

class _ChangeSelfServiceWidgetState extends State<ChangeSelfServiceWidget> {
  bool fetched = false;
  // List<SelfService> self_services = [];
  // List self_services_cache_list = Hive.box('cache').get('self_services_cache_list', defaultValue: []);
  late SharedPreferences sharedPreferences;
  late int selected_self_service_id;

  get_data() async {
    sharedPreferences =
    await SharedPreferences.getInstance();
    int? selected_self_service_id_temp = sharedPreferences.getInt("selected_self_service_id");
    if(selected_self_service_id_temp == null){
      selected_self_service_id = -1;
    }else{
      selected_self_service_id = selected_self_service_id_temp;
    }

    setState(() {
      fetched = true;
    });
  }

  // Future<void> _refresh() async{
  //   await get_data();
  //   setState((){} );
  // }

  // late AnimateIconController controller;
  @override
  void initState() {
    get_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> states_key = states.keys.toList();

    // const Map<int, String> self_services = {1:'مرکزی (دانشگاه)', 2:'حافظ', 3:'طرشت', 4:'ازگل', 5:'شهید مدنی', 6:'اختیاریه', 7:'هروی', 8:'مبارک آباد', };
    // int selected_self_service_id = Hive.box('cache').get('self_service_id', defaultValue: -1) as int;


    // if(day == 'everyday'){
    //   day = 'جلسات هر روز';
    // }
    // Map<String, String> week = {"Sa":'شنبه', "Su":'یکشنبه', "Mo":'دوشنبه', "Tu":'سه شنبه', "We":'چهارشنبه', "Te":'پنجشنبه', "Fr":'جمعه'};
    // String day = "Friday";

    // await showModalBottomSheet(
    //     isDismissible: true,
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (BuildContext context) {
    // final List<int> self_services_num = self_services.keys.toList();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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

    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: BottomGradientContainer(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        child: (!fetched)
            ? Center(
          child: CustomProgressIndicator(),
        )
            :
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(
            0,
            10,
            0,
            10,
          ),
          itemCount: widget.self_services.length,
          itemBuilder: (context, idx) {
            return ListTileTheme(
              selectedColor: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                title:
                Row(
                    children: [
                      Text("سلف",
                          style: TextStyle(
                            // color: Colors.white,//Theme.of(context).colorScheme.secondary,
                            fontSize: h1_text_size * 0.8,
                            fontFamily: 'Sahel',
                            fontWeight: FontWeight.w500,
                          )
                        //   TextStyle(
                        //     fontSize: 43,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w900
                        // ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(widget.self_services[idx].name as String,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: h1_text_size,
                            fontFamily: 'Sahel',
                            fontWeight: FontWeight.w500,
                          )
                        //   TextStyle(
                        //     fontSize: 43,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w900
                        // ),
                      ),
                    ]
                ),
                leading: Radio(
                  value: idx,
                  groupValue: selected_self_service_id,
                  onChanged: (value) {
                    selected_self_service_id = value as int;
                    sharedPreferences.setInt('selected_self_service_id', value as int);
                    setState((){
                      selected_self_service_id = idx;
                    });
                    Navigator.pop(context);
                  },
                ),
                selected: selected_self_service_id == idx,
                onTap: () {
                  setState((){
                    selected_self_service_id = idx;
                  });
                  sharedPreferences.setInt('selected_self_service_id', selected_self_service_id as int);
                  Navigator.pop(context);
                },
              ),
            );
            // }

          },
        ),
      ),
    );
    // },
    // );

  }
}

