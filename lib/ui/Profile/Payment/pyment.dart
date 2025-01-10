import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../ui/Profile/MainPage/widgets/app_bar.dart';
import '../../../data/repo/payment_repository.dart';
import '../../../utils/responsiveLayout.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../../widgets/progress_indicator.dart';
import '../../widgets/snackbar.dart';

class PaymentScreen extends StatefulWidget {
  final Function()? notifyParent;

  PaymentScreen({
    Key? key,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController controller_amount = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    widget.notifyParent!();
    controller_amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    // final money_format = new NumberFormat("#,##0", "en_US");
    return Scaffold(
      appBar:AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop(false);
            // widget.notifyParent!();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
        child: Container(
          margin: EdgeInsets.only(top: 20, right: 40, left: 40, bottom: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(bottom: 15),
              //       child: Icon(
              //         LineariconsFree.lock_1,
              //         size: h1_text_size * 3.3,
              //         color: Colors.grey,
              //       ),
              //     ),
              //     Text(
              //       "بازیابی رمز عبور",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w900,
              //         fontSize: h1_text_size,
              //         fontFamily: "Sahel",
              //         color: Colors.grey.shade400,
              //
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('کاربر عزیز لطفا مبلغ مورد نظرتان را وارد کنید(حداقل مبلغ ۵۰۰۰۰ ریال می باشد) ',

                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: b_text_size * 0.8,
                    // letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sahel",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
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
                    color: Colors.white.withOpacity(0.01),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.01),
                        // blurRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    // obscureText: true,
                    // enableSuggestions: false,
                    // autocorrect: false,
                    controller: controller_amount,
                    textAlignVertical:
                    TextAlignVertical.center,
                    // textCapitalization:
                    // TextCapitalization.sentences,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder:
                      const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: Icon(
                        LineariconsFree.diamond_1,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                      border: InputBorder.none,
                      // hintText: AppLocalizations.of(context)!.enterName,
                      hintText: "مبلغ مورد نظر خود را به ریال وارد کنید",
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

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 15),
        child: InkWell(
          onTap: () async {

            Map body = {};
            if(
            controller_amount.text != ""){
              if(int.parse(controller_amount.text.toEnglishDigit()) < 50000){
                ShowSnackBar().showSnackBar(
                  context,
                  "حداقل مبلغ ۵۰۰۰۰ریال می باشد",
                  duration: const Duration(seconds: 10),
                  noAction: false,
                  background_color: Colors.red,
                  text_color: Colors.white,
                );
              }else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CustomProgressIndicator(),
                    );
                  },
                );
                body = {
                  "amount": controller_amount.text,

                };
                Map response = {'status': false, 'message':""};
                try{
                  response = await paymentRepository.go_to_gateway(body);
                }catch(e){ //on AppException
                  Navigator.of(context, rootNavigator: true).pop();
                  ShowSnackBar().showSnackBar(
                    context,
                    "خطا",//e.toString(),//.message,
                    duration: const Duration(seconds: 10),
                    noAction: false,
                    background_color: Colors.red[600],
                    text_color: Colors.white,
                  );
                }
                if (response['status'] == true){
                  // widget.notifyParent();
                  // global_userInfo = await userRepository.get_user_info(refresh: true);
                  Navigator.of(context, rootNavigator: true).pop();
                  controller_amount.text = "";
                  // Navigator.of(context).pop();
                  // ShowSnackBar().showSnackBar(
                  //   context,
                  //   "ارسال شد",
                  //   duration: const Duration(seconds: 3),
                  //   noAction: false,
                  //   background_color: Colors.green[600],
                  // );
                  launchUrl(
                      Uri.parse(
                          response['data']['link']
                      )
                  );
                }else{
                  ShowSnackBar().showSnackBar(
                    context,
                    response['message'],
                    duration: const Duration(seconds: 3),
                    noAction: false,
                    background_color: Colors.red.shade600,
                  );
                }
              }




            }else{
              ShowSnackBar().showSnackBar(
                context,
                "مورد خواسته شده را وارد کنید",//e.toString(),//.message,
                duration: const Duration(seconds: 10),
                noAction: false,
                background_color: Colors.red[600],
                text_color: Colors.white,
              );
            }





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
                    child: Text('پرداخت',
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
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

