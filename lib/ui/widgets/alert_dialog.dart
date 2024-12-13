import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';



class CustomAlertDialog extends StatelessWidget {
  final Widget content;
  const CustomAlertDialog({required this.content, super.key});


  @override
  Widget build(BuildContext context) {
    //wrap widget with OverlayLoaderWithAppIcon
    return AlertDialog(
        icon: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
                LineariconsFree.cross, color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
        // actionsAlignment: MainAxisAlignment.start,
        // actions: [
        //   IconButton(
        //     icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
        //     onPressed: () => Navigator.of(context).pop(false),
        //   )
        // ],
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
                30)),
        // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
        //   title: Text("اطلاعات تگ :"),
        content: content

    );
  }

}