


import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../CardRegisteration/Clipboard/card_registration_by_clipboard.dart';

class SmallCradRegisterMenu extends StatelessWidget {
  // CardEntity card;
  // LargeCardCard({
  //   Key? key,
  //   required this.card
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.24,
        mediumScreen_size: width * 0.26,
        smallScreen_size: width * 0.25,
        min_size: width * 0.2,
        max_size: width * 0.22,
        context: context
    ).get_width_size();
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

    double container_width  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.4,
        mediumScreen_size: width * 0.5,
        smallScreen_size: width * 0.3,
        min_size: width * 0.3,
        max_size: width * 0.35,
        context: context
    ).get_width_size();
    double box_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.825,
        mediumScreen_size: height * 0.8,
        smallScreen_size: height * 0.9,
        min_size: height * 0.9,
        max_size: height * 0.9,
        context: context
    ).get_height_size();

    return Container(
        height: MediaQuery.of(context).size.height * 0.265,
        // color: Theme.of(context).colorScheme.secondary.withOpacity(0.87) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
          color: Colors.white,//Theme.of(context).colorScheme.secondary.withOpacity(0.87),
        ),
        child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Directionality(
                                textDirection: TextDirection.rtl,
                                // child: initialFuntion()
                                child: CardRegistrationByClipboardScreen(),
                              )
                          )
                      );
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Center(
                              child: SizedBox(
                                height: image_width,
                                width: image_width,
                                child: Image(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    // Theme.of(context).brightness == Brightness.dark
                                    //     ? 'assets/header-dark.jpg'
                                    //     : 'assets/header.jpg',
                                      'assets/images/read-card.png'
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                              "ثبت دستی" as String,
                              maxLines: 3,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87,
                                fontSize:b_text_size * 0.7,
                                fontFamily: 'Sahel',
                                fontWeight: FontWeight.w600,
                              )
                          ),
                        ]
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                              content: Container(
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(30)
                                // ),
                                height: MediaQuery.of(context)
                                    .size
                                    .height * 0.3,
                                // color: data!['status'] as bool ? Colors.green : Colors.red,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Text('${value["nfca"]["identifier"]}'),
                                    Icon(
                                      LineariconsFree.bug,
                                      color:  Colors.grey[500],
                                      size: 140,
                                    ),
                                    Text(
                                      " از اپلیکیشن اندروید ما برای استفاده از این قابلیت استفاده کنید",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        // fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Center(
                              child: SizedBox(
                                height:image_width,
                                width: image_width,
                                child: Image(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    // Theme.of(context).brightness == Brightness.dark
                                    //     ? 'assets/header-dark.jpg'
                                    //     : 'assets/header.jpg',
                                      'assets/images/write-card.png'
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                              "از طریق NFC" as String,
                              maxLines: 3,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87,
                                fontSize:b_text_size * 0.7,
                                fontFamily: 'Sahel',
                                fontWeight: FontWeight.w600,
                              )
                          ),
                        ]
                    ),
                  ),
                ],
              ),

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


// class LargeCradRegisterMenu extends StatelessWidget {
//   // CardEntity card;
//   // LargeCardCard({
//   //   Key? key,
//   //   required this.card
//   // }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;
//     double image_width = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.24,
//         mediumScreen_size: width * 0.26,
//         smallScreen_size: width * 0.55,
//         min_size: width * 0.7,
//         max_size: width * 0.22,
//         context: context
//     ).get_width_size();
//     double h1_text_size = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.025,
//         mediumScreen_size: width * 0.03,
//         smallScreen_size: width * 0.07,
//         min_size: width * 0.08,
//         max_size: width * 0.025,
//         context: context
//     ).get_width_size();
//     double b_text_size = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.015,
//         mediumScreen_size: width * 0.02,
//         smallScreen_size: width * 0.05,
//         min_size: width * 0.1,
//         max_size: width * 0.013,
//         context: context
//     ).get_width_size();
//
//     double container_width  = ResponsiveSizeWidget(
//         largeScreen_size: width * 0.4,
//         mediumScreen_size: width * 0.5,
//         smallScreen_size: width * 0.3,
//         min_size: width * 0.3,
//         max_size: width * 0.35,
//         context: context
//     ).get_width_size();
//     double box_height  = ResponsiveSizeWidget(
//         largeScreen_size: height * 0.825,
//         mediumScreen_size: height * 0.8,
//         smallScreen_size: height * 0.9,
//         min_size: height * 0.9,
//         max_size: height * 0.9,
//         context: context
//     ).get_height_size();
//
//     return Container(
//         height: MediaQuery.of(context).size.height/4,
//         // color: Theme.of(context).colorScheme.secondary.withOpacity(0.87) ,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(40),),
//           color: Colors.white,//Theme.of(context).colorScheme.secondary.withOpacity(0.87),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             InkWell(
//               onTap: (){
//                 // Navigator.of(context).pop();
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CardRegistrationByClipboardScreen()
//                     )
//                 );
//               },
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 // mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: Center(
//                         child: SizedBox(
//                           height: image_width,
//                           width: image_width,
//                           child: Image(
//                             fit: BoxFit.cover,
//                             alignment: Alignment.topCenter,
//                             image: AssetImage(
//                               // Theme.of(context).brightness == Brightness.dark
//                               //     ? 'assets/header-dark.jpg'
//                               //     : 'assets/header.jpg',
//                                 'assets/images/read-card.png'
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                         "ثبت دستی" as String,
//                         maxLines: 3,
//                         style: TextStyle(
//                           overflow: TextOverflow.ellipsis,
//                           color: Colors.black87,
//                           fontSize:b_text_size,
//                           // fontFamily: 'a-thuluth',
//                           fontWeight: FontWeight.w500,
//                         )
//                     ),
//                   ]
//               ),
//             ),
//             InkWell(
//               onTap: (){
//                 // Navigator.of(context).pop();
//
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                                 30)),
//                         // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                         //   title: Text("اطلاعات تگ :"),
//                         content: Container(
//                           // decoration: BoxDecoration(
//                           //     borderRadius: BorderRadius.circular(30)
//                           // ),
//                           height: MediaQuery.of(context)
//                               .size
//                               .height * 0.3,
//                           // color: data!['status'] as bool ? Colors.green : Colors.red,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // Text('${value["nfca"]["identifier"]}'),
//                               Icon(
//                                 LineariconsFree.smile,
//                                 color:  Colors.grey[500],
//                                 size: 170,
//                               ),
//                               Text(
//                                 "در آینده نزدیک ...",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   // fontSize: 20
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ));
//                   },
//                 );
//               },
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 // mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: Center(
//                         child: SizedBox(
//                           height:image_width,
//                           width: image_width,
//                           child: Image(
//                             fit: BoxFit.cover,
//                             alignment: Alignment.topCenter,
//                             image: AssetImage(
//                               // Theme.of(context).brightness == Brightness.dark
//                               //     ? 'assets/header-dark.jpg'
//                               //     : 'assets/header.jpg',
//                                 'assets/images/write-card.png'
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                         "از طریق NFC" as String,
//                         maxLines: 3,
//                         style: TextStyle(
//                           overflow: TextOverflow.ellipsis,
//                           color: Colors.black87,
//                           fontSize: b_text_size,
//                           // fontFamily: 'a-thuluth',
//                           fontWeight: FontWeight.w500,
//                         )
//                     ),
//                   ]
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }