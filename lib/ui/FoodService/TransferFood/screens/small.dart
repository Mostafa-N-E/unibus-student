import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../common/http_client.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../data/repo/transfer_food_repository.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/fast_cached_image.dart';
import '../../../widgets/progress_indicator.dart';
import '../bloc/transfer_food_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/change_self_service.dart';
import '../widgets/floating_action_button.dart';

final mealFoodRepository = MealFoodRepository(MealFoodRemoteDataSource(httpClient) as IMealFoodDataSource);


class SmallTransferFoodPage extends StatefulWidget {
  final MealFoodEntity meal_food;
  // final List<SelfServiceEntity> self_services;
  final Function() notifyParent;

  SmallTransferFoodPage({Key? key, required this.notifyParent, required this.meal_food}) : super(key: key);
  @override
  State<SmallTransferFoodPage> createState() => _SmallTransferFoodPageState();
}

class _SmallTransferFoodPageState extends State<SmallTransferFoodPage> {
  // const SmallReserveFoodPage({Key? key, }) : super(key: key);
  Jalali date = Jalali.now();

  @override
  void dispose() {
    // TODO: implement dispose
    // widget.meal_food.transfer_request_status = 1;
    widget.notifyParent();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final TransferFoodSmallScreenAppBar app_bar = TransferFoodSmallScreenAppBar(context);
    // final ReserveFoodScreenFloatingActionButton floating_action_button = ReserveFoodScreenFloatingActionButton(context);

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
        smallScreen_size: width * 0.065,
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

    return BlocProvider(
      create: (context) {
        final transferFoodBloc = TransferFoodBloc(
            transferFoodRepository: transferFoodRepository, meal_food: widget.meal_food
        );
        transferFoodBloc.add(TransferFoodStarted(SelfServiceId: -1, ));
        return transferFoodBloc;
      },
      child: BlocBuilder<TransferFoodBloc, TransferFoodState>(builder: ((context, state) {
        if (state is TransferFoodSuccess) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  () async {
                  await showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeSelfServiceWidget(self_services: state.self_services,);
                    },
                  );
                  // await showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius:BorderRadius.circular(30)),
                  //       // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                  //       content: Container(
                  //         width: width/2,
                  //         height: height/2,
                  //         child: Directionality(
                  //             textDirection: TextDirection.rtl,
                  //             child: ChangeSelfServiceWidget(self_services: state.self_services,)
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                  BlocProvider.of<TransferFoodBloc>(context).add(TransferFoodChangeSelfService(SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                },
                destination_self_service_lable: state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------",
                beginning_self_service_lable: state.meal_food.self_service.name
            ),
            body: TransferFood_body(widget, width, h1_text_size, b_text_size, image_width),
            bottomNavigationBar: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: InkWell(
                onTap: ()async{
                  // widget.meal_food.transfer_request_status = 1;
                  BlocProvider.of<TransferFoodBloc>(context).add(TransferFoodSubmitRequest(SelfServiceId: state.SelfServiceId, selfservices: state.self_services));

                  widget.notifyParent();

                  // Navigator.of(context).pop();

                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(right: 10),
                      //   child: Icon(
                      //     LineariconsFree.smile,
                      //     color:  Colors.grey[600],
                      //     size: width * 0.13,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "ارسال",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // color: Colors.grey[800],
                              fontSize: b_text_size,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          );
        }else if(state is TransferFoodSuccessSubmitRequest) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  () async {},
                destination_self_service_lable: state.self_services[state.SelfServiceId].name,
                beginning_self_service_lable: state.meal_food.self_service.name
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('${value["nfca"]["identifier"]}'),
                    Icon(state.response['status']?LineariconsFree.checkmark_cicle:LineariconsFree.cross,
                      color:state.response['status']?Colors.greenAccent:Colors.redAccent.shade100,
                      size: 170,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10) ,
                      child: Text(
                        state.response['message'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontSize: b_text_size
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          );
        }else if (state is TransferFoodNotAvailable) {
          return Scaffold(
            appBar: app_bar.build(
                destination_self_service_lable: "موردی برای نمایش نیست",
                beginning_self_service_lable: state.meal_food.self_service.name
            ),
            body: TransferFood_body(widget, width, h1_text_size, b_text_size, image_width),

          );
        }else if (state is TransferFoodLoading) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  () {},
                destination_self_service_lable: "",
                beginning_self_service_lable: state.meal_food.self_service.name

            ),
            // floatingActionButton: floating_action_button.build(),
            body: TransferFood_body(widget, width, h1_text_size, b_text_size, image_width),
          );
        } else if (state is TransferFoodError) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  ()  {},
                destination_self_service_lable:"-------------",
                beginning_self_service_lable:"-------------"
            ),
            // floatingActionButton: floating_action_button.build(),
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
                          BlocProvider.of<TransferFoodBloc>(context).add(TransferFoodStarted(SelfServiceId: -1));
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

Widget TransferFood_body(widget, width, h1_text_size, b_text_size, image_width){
  return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "دانشجو عزیز در نظر داشته باشید که برای هر وعده غذای تا ۳۰ دقیقه قبل می توانید درخواست ارسال کنید تا بررسی گردد و در صورت وجود جایگزین از سلف مقصد به سلف مبدا درخواست جابجایی شما انجام خواهد شد  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: b_text_size * 0.75,
                    fontWeight: FontWeight.w200
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.76,
                  child: Column(
                    children: [
                      SizedBox(
                          height: image_width,
                          width: image_width,
                          child: fast_cached_image_builder(
                              main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20 ),
                        child: Center(
                            child: Text(widget.meal_food.food.name as String,
                              style: TextStyle(
                                // color: Colors.grey[700],
                                //Theme.of(context).colorScheme.secondary,
                                fontSize: widget.meal_food.food.name.length < 11 ?
                                h1_text_size * 0.9 :
                                widget.meal_food.food.name.length < 15 ?
                                h1_text_size * 0.8 :
                                widget.meal_food.food.name.length < 20 ?
                                b_text_size * 1.08 :
                                b_text_size * 1.04,
                                fontFamily: 'Sahel',
                                // fontWeight: FontWeight.w900,
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10 ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [

                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      )
  );
}
