import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../ui/FoodService/ReserveStatus/screens/large.dart';
import '../../../../ui/FoodService/ReserveStatus/screens/small.dart';
import '../../../data/repo/meal_food_repository.dart';
import '../../../utils/responsiveLayout.dart';
import '../../widgets/progress_indicator.dart';
import '../../widgets/snackbar.dart';
import 'bloc/reserve_status_bloc.dart';

class ReserveStatusPage extends StatefulWidget {
  const ReserveStatusPage({Key? key}) : super(key: key);

  @override
  _ReserveStatusPageState createState() => _ReserveStatusPageState();
}

class _ReserveStatusPageState extends State<ReserveStatusPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_5 = new GlobalKey<RefreshIndicatorState>();
  Map weekdays = {'0': "شنبه", '1': "یک شنبه", '2': "دو شنبه", '3': "سه شنبه", '4': "چهارشنبه", '5': "پنجشنبه", '6': "جمعه"};
  bool fetched = true;
  bool internet_connection = true;
  int date_code = 0;
  late DateTime start_week_dateTime;
  Map data = {};
  _homepageState(){
    // List cache_items = Hive.box('cache').get('meeting_items_in_region' , defaultValue: []) as List;
    // items = cache_items.isEmpty ? build_meeting_obj( cache_items ) : [];
    // status_2 = false;
  }
  get_data() async {
    // setState(() {
    //   fetched = false;
    // });
    // internet_connection = await check_internet_connection() ?? false;
    // setState(() {
    //   internet_connection = internet_connection;
    // });
    //
    // if(internet_connection){
    //   MealFood_API()
    //       .reserve_status({"date_code": date_code}).then((fetch_data) {
    //     setState(() {
    //       // title = widget.data['weekday'] as int;
    //       // data = fetch_data;
    //       data = fetch_data;
    //       fetched = true;
    //       start_week_dateTime = DateTime.parse(data['start_week']);
    //       print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    //       print(start_week_dateTime);
    //       print(Jalali.fromDateTime(start_week_dateTime)
    //           .addDays(1)
    //           .formatMediumDate());
    //
    //       print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    //       // status = true;
    //     });
    //   });
    // }

    // data = await Turn().get_turns_weekly(1);
  }

  Future<void> _refresh() async{
    // setState((){fetched = false; status = false;} );
    await get_data();
    setState((){} );
  }

  // late AnimateIconController controller;
  @override
  void initState() {
    get_data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    // bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;
    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.4,
        mediumScreen_size: width * 0.5,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.4,
        context: context
    ).get_width_size();

    if(!internet_connection){
      ShowSnackBar().showSnackBar(
          context,
          "اتصال به اینترنت برقرار نیست",
          duration: const Duration(seconds: 10),
          noAction: false,
          background_color: Colors.red.shade400,
          text_color: Colors.white
      );
    }
    return BlocProvider(
      create: (context) {
        final reserveStatusBloc = ReserveStatusBloc(
            mealFoodRepository: mealFoodRepository
        );
        reserveStatusBloc.add(ReserveStatusStarted());
        return reserveStatusBloc;
      },
      child: BlocBuilder<ReserveStatusBloc, ReserveStatusState>(builder: ((context, state) {
        if (state is ReserveStatusSuccess) {
          // Map<String, List<MealFoodEntity>> classified_meal_foods = MealFoodEntity.get_meal_foods_dased_on_meal_type(state.meal_foods);
          return ResponsiveLayout(
            largeScreen: LargeReserveStatusPage(
              week_reserve_status_mealfoods: state.weekly_reserve_food_status, start_week_dateTime: state.start_week_dateTime, date_code: state.date_code,
            ),
            // smallScreen: SmallFoodPage(),
            smallScreen: SmallReserveStatusPage(
              week_reserve_status_mealfoods: state.weekly_reserve_food_status, start_week_dateTime: state.start_week_dateTime, date_code: state.date_code,
            ),
          );
        } else if (state is ReserveStatusLoading) {
          return CustomProgressIndicator();
        } else if (state is ReserveStatusError) {
          return Scaffold(
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
                          BlocProvider.of<ReserveStatusBloc>(context).add(ReserveStatusStarted());
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
        } else {
          throw Exception("state is not supported");
        }
      })),
    );
  }
}
