

import 'package:flutter/material.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';



class CustomProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //wrap widget with OverlayLoaderWithAppIcon
    return OverlayLoaderWithAppIcon(
        isLoading: true,
        overlayBackgroundColor: Colors.white.withOpacity(0.01),
        circularProgressColor: Theme.of(context).colorScheme.secondary,
        appIcon:  Image.asset('ic_launcher.png'),
        child: Center()
    );
  }

}
