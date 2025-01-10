

import 'package:flutter/material.dart';

import '../../theme.dart';

class GradientContainer extends StatefulWidget {
  final Widget? child;
  final bool? opacity;
  const GradientContainer({required this.child, this.opacity});
  @override
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  // MyTheme currentTheme = GetIt.I<MyTheme>();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;
    return Container(

      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isDarkMode ? DarkThemeColors.primaryColor : Colors.white,
            isDarkMode ? Color(0x1043C77) : Color(0xf0f1faff),
            isDarkMode ? Color(0x1510054) : Color(0xeffff3fc),
            isDarkMode ? DarkThemeColors.primaryColor : Colors.white,
          ],
        ),
      ),
      child: widget.child,
    );
  }
}



//--------------------------
class BottomGradientContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  const BottomGradientContainer({
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
  });
  @override
  _BottomGradientContainerState createState() =>
      _BottomGradientContainerState();
}

class _BottomGradientContainerState extends State<BottomGradientContainer> {
  // MyTheme currentTheme = GetIt.I<MyTheme>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.fromLTRB(25, 0, 25, 25),
      padding: widget.padding ?? const EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ??
            const BorderRadius.all(Radius.circular(15.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Theme.of(context).canvasColor,
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
