import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/responsiveLayout.dart';

class ActionCard extends StatelessWidget{
  final BuildContext context;
  final void Function()? on_tap;
  final String title;
  final IconData icon;
  const ActionCard({super.key, required this.context, this.on_tap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      double b_text_size = ResponsiveSizeWidget(
          largeScreen_size: width * 0.016,
          mediumScreen_size: width * 0.017,
          smallScreen_size: width * 0.04,
          min_size: width * 0.4,
          max_size: width * 0.015,
          context: context
      ).get_width_size();
      double container_height  = ResponsiveSizeWidget(
          largeScreen_size: height * 0.2,
          mediumScreen_size: height * 0.18,
          smallScreen_size: height * 0.2,
          min_size: height * 0.2,
          max_size: height * 0.22,
          context: context
      ).get_height_size();

      return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(b_text_size * 0.6),
          ),
          child: InkWell(
            onTap: on_tap,
            child: Container(
                height: container_height,
                width: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // border: Border.all(color: Colors.grey[300] as Color),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image(
                        //   // width: width *0.3,
                        //   height: height * 0.15,
                        //   fit: BoxFit.cover,
                        //   alignment: Alignment.topCenter,
                        //   image: AssetImage(
                        //     // Theme.of(context).brightness == Brightness.dark
                        //     //     ? 'assets/header-dark.jpg'
                        //     //     : 'assets/header.jpg',
                        //       image_path),
                        // ),
                        Icon(
                          icon,
                          size: container_height * 0.4,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 0, top: 7, bottom: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                                // color: Colors.grey[500],
                                fontSize: b_text_size * 0.7,
                                letterSpacing: 1,
                                // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      );
  }

}