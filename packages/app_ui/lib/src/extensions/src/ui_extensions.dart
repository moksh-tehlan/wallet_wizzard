import 'package:flutter/material.dart';
//ignore_for_file:public_member_api_docs

class ScreenUtils {
  static const double figmaScreenHeight = 817;
  static const double figmaScreenWidth = 365;
}

/// Converts the value with respect to the component:figma Screen ratio.
extension ResponsiveIntegerConstraints on num {
  double toResponsiveHeight(BuildContext context) {
    return this * context.screenHeight / ScreenUtils.figmaScreenHeight;
  }

  double toResponsiveWidth(BuildContext context) {
    return this * context.screenWidth / ScreenUtils.figmaScreenWidth;
  }
}

extension ScreenDimensions on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;
}

extension ResponsiveEdgeInsets on EdgeInsets {
  EdgeInsets responsive(BuildContext context) => copyWith(
        left: left.toResponsiveWidth(context),
        right: right.toResponsiveWidth(context),
        top: top.toResponsiveHeight(context),
        bottom: bottom.toResponsiveHeight(context),
      );
}
