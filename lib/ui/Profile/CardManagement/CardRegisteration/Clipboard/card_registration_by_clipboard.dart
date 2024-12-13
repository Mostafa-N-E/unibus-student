import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../../../common/http_client.dart';
import '../../../../../../ui/Profile/MainPage/widgets/app_bar.dart';
import '../../../../../data/repo/auth_repository.dart';
import '../../../../../data/repo/card_repository.dart';
import '../../../../../utils/responsiveLayout.dart';
import '../../../../widgets/progress_indicator.dart';
import 'dart:math' as math;
import 'bloc/card_registration_by_clipboard_bloc.dart';


class CardRegistrationByClipboardScreen extends StatefulWidget {
  @override
  State<CardRegistrationByClipboardScreen> createState() => _CardRegistrationByClipboardScreenState();
}

class _CardRegistrationByClipboardScreenState extends State<CardRegistrationByClipboardScreen>  {
  TextEditingController controller_serialnumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final ProfileScreenAppBar app_bar = ProfileScreenAppBar(context);

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
    double container_height = ResponsiveSizeWidget(
        largeScreen_size: screenHeight * 0.55,
        mediumScreen_size: screenHeight * 0.6,
        smallScreen_size: screenHeight * 0.8,
        min_size: screenHeight *0.8,
        max_size: screenHeight *0.55,
        context: context
    ).get_custom_size();
    double viewportFraction  = ResponsiveSizeWidget(
        largeScreen_size: 0.75,
        mediumScreen_size: 0.8,
        smallScreen_size: 0.85,
        min_size: 0.9,
        max_size: 0.65,
        context: context
    ).get_custom_size();

    List<Widget> body_content(){
      return [
        Column(
          children: [
            Image.asset(
              'assets/images/card.webp',
              // color: Colors.white,
              width: width * 0.6,
            ),
            Text(
              "ثبت دستی کارت",
              style: TextStyle(
                fontSize: h1_text_size,
                fontWeight: FontWeight.w300,
                fontFamily: "Sahel"
              ),
            ),
            Text(
                "کاربر عزیز، شماره سریال کارت مورد نظر خود را در این قسمت وارد  کنید",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: b_text_size,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Sahel"
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 10,
                right: 10,
              ),
              height: 57.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(
                        context)
                        .colorScheme
                        .secondary
                        .withOpacity(
                        1) as Color),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    // blurRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
              ),
              child: TextField(
                // obscureText: true,
                // enableSuggestions: false,
                autocorrect: false,
                controller: controller_serialnumber,
                textAlignVertical:
                TextAlignVertical.center,
                // textCapitalization:
                // TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder:
                  const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.transparent,
                    ),
                  ),
                  prefixIcon: Icon(
                    LineariconsFree.code_1,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary,
                  ),
                  border: InputBorder.none,
                  // hintText: AppLocalizations.of(context)!.enterName,
                  hintText: "سریال کارت",
                  hintStyle: const TextStyle(
                    // color: Colors.white60,
                  ),
                ),
                onSubmitted: (String value) async {
                  // if (value.trim() == '') {
                  //   await _addUserData(
                  //     AppLocalizations.of(context)!.guest,
                  //   );
                  // } else {
                  //   await _addUserData(value.trim());
                  // }
                  // Navigator.popAndPushNamed(
                  //   context,
                  //   '/pref',
                  // );
                },
              ),
            ),
          ),
        )
      ];
    }

    // final money_format = new NumberFormat("#,##0", "en_US");
    return BlocProvider(
      create: (context) {
        final cardRegistrationByClipboardBloc = CardRegistrationByClipboardBloc(
            cardRepository: cardRepository, authRepository: authRepository
        );
        cardRegistrationByClipboardBloc.add(CardRegistrationByClipboardStarted());
        return cardRegistrationByClipboardBloc;
      },
      child: BlocBuilder<CardRegistrationByClipboardBloc, CardRegistrationByClipboardState>(builder: ((context, state) {
        if (state is CardRegistrationByClipboardSuccess) {
          return Scaffold(
            appBar: AppBar(
              toolbarOpacity: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ),
            body: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: ResponsiveLayout(
                largeScreen: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: body_content(),
                ),
                smallScreen: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: body_content(),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 15),
              child: InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: CustomProgressIndicator(),
                      );
                    },
                  );
                  // setState(() {
                  //   fetched = true;
                  // });
                  if (controller_serialnumber.text.trim() == '') {
                    // await _addUserData('Guest', 'Guest');
                    Navigator.of(context, rootNavigator: true).pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    30)),
                            // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                            //   title: Text("اطلاعات تگ :"),
                            content: Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(30)
                              // ),
                              height: MediaQuery.of(context)
                                  .size
                                  .height * 0.35,
                              // color: data!['status'] as bool ? Colors.green : Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text('${value["nfca"]["identifier"]}'),
                                  Icon(
                                    LineariconsFree.cross,
                                    color:  Colors.red,
                                    size: 170,
                                  ),
                                  Text(
                                    "موارد خواسته شده را وارد کنید",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      // fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ));
                        ;
                      },
                    );
                  } else {
                    cardRepository.card_registration({
                      "id": global_userInfo.id,
                      "card_serial": controller_serialnumber.text.trim().toString()
                    }).then((fetch_data) {
                      // if (this.mounted) {
                      //   setState(() {
                      //     fetched = true;
                      //     Navigator.pop(context);
                      //   });
                      // }
                      Navigator.of(context, rootNavigator: true).pop(context);

                      if (fetch_data["status"]) {
                        // Hive.box('settings').put('TOKEN', fetch_data['token']);
                        // Navigator.popAndPushNamed(context, '/pref');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        30)),
                                // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                //   title: Text("اطلاعات تگ :"),
                                content: Container(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(30)
                                  // ),
                                  height: MediaQuery.of(context)
                                      .size
                                      .height * 0.35,
                                  // color: data!['status'] as bool ? Colors.green : Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        fetch_data['status'] as bool
                                            ? LineariconsFree.checkmark_cicle
                                            : LineariconsFree.cross,
                                        color: fetch_data['status']
                                        as bool
                                            ? Colors.greenAccent
                                            : Colors.red,
                                        size: 170,
                                      ),
                                      Text(
                                        fetch_data['message'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: fetch_data['status']as bool
                                              ? Colors.grey[600]
                                              : Colors.red,
                                          // fontSize: 20
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                            ;
                          },
                        );
                      } else {
                        // Alert().authenticationError(
                        //     context: context,
                        //     message: fetch_data['message'].toString()
                        // );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        30)),
                                // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                //   title: Text("اطلاعات تگ :"),
                                content: Container(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(30)
                                  // ),
                                  height: MediaQuery.of(context)
                                      .size
                                      .height * 0.35,
                                  // color: data!['status'] as bool ? Colors.green : Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LineariconsFree.cross,
                                        color:  Colors.red,
                                        size: 170,
                                      ),
                                      Text(
                                        fetch_data['message'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.red,
                                          // fontSize: 20
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                            ;
                          },
                        );
                      }
                      controller_serialnumber.text = "";
                    });
                  }
                  // if (Hive.box('settings').get('TOKEN') !=
                  //     "") {
                  //   Navigator.popAndPushNamed(
                  //       context, '/pref');
                  // }
                },
                child: Material(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius:
                  BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                  ),
                  elevation: 2,
                  child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width /
                          1.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)
                        ),
                        // border: Border.all(
                        //     color: Colors.orange, width: 1),
                      ),
                      child: Center(
                          child: Text('ثبت کارت',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              // letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sahel",
                            ),
                            textAlign: TextAlign.center,
                          )
                      )
                  ),
                ),
              ),
            ),
          );
        } else if (state is CardRegistrationByClipboardLoading) {
          return Scaffold(
            appBar: AppBar(
              toolbarOpacity: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Center(child: CustomProgressIndicator()),

          );
        } else if (state is CardRegistrationByClipboardError) {
          return Scaffold(
            appBar: AppBar(
              toolbarOpacity: 1,
              toolbarHeight: rotated
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.width * 0.17,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.exception.message),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CardRegistrationByClipboardBloc>(context).add(CardRegistrationByClipboardStarted());
                      },
                      child: const Text('تلاش دوباره')),
                ],
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



