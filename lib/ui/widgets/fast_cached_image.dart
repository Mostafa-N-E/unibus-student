


import 'dart:ui';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

FastCachedImage fast_cached_image_builder({
  required String main_image_url,
  required String placeholder_image_path,
  required double width,
  required double height,
  int duration_seconds=1,
  double border_radius=1000,
  double opacity=1
}){
  if(main_image_url != ""){
    return FastCachedImage(
      opacity: AlwaysStoppedAnimation<double>(opacity),
      url: main_image_url,
      fit: BoxFit.cover,
      fadeInDuration: Duration(seconds: duration_seconds),
      errorBuilder: (context, exception, stacktrace) {
        return Image(
          opacity: AlwaysStoppedAnimation<double>(opacity),
          width: width,
          height: height,
          fit: BoxFit.cover,
          image: AssetImage(
            placeholder_image_path,
          ),
        );
      },
      loadingBuilder: (context, progress) {
        return Container(
//         decoration: BoxDecoration(
// // borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
//           image: DecorationImage(
//             // image: imageProvider,
//             fit: BoxFit.cover,
//             opacity: 170,
//           ),
//         ),
          // color: Colors.grey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (progress.isDownloading && progress.totalBytes != null)
              // Text('${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
              //     style: const TextStyle(color: Colors.grey)),
              // SizedBox(
              //             width: width * 0.58,
              //             height: width * 0.58,
              //             child:
              //             CircularProgressIndicator(color: Colors.white30, value: progress.progressPercentage.value)
              // ),
                SizedBox(
                  width: width,
                  height: height,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white10,
                    highlightColor: Colors.grey,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(border_radius),
                      ),
                    ),
                  ),
                ),




            ],
          ),
        );
      },
    );
  }else{
    return FastCachedImage(
      opacity: AlwaysStoppedAnimation<double>(opacity),
      url: main_image_url,
      fit: BoxFit.cover,
      errorBuilder: (context, exception, stacktrace) {
        return Image(
          opacity: AlwaysStoppedAnimation<double>(opacity),
          width: width,
          height: height,
          fit: BoxFit.cover,
          image: AssetImage(
            placeholder_image_path,
          ),
        );
      },
    );
  }
}
