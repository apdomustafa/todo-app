import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/helpers/font_size.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/fonts.dart';

abstract class AppStyles {
  // SF Pro

  static TextStyle styleSFProBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontSize: AppFontSize.getResponsiveFontSize(context, 24),
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.SEProFont,
    );
  }

  static TextStyle styleLatoBold12(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(.87),
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 12),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold14(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(.87),
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 14),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 16),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold20(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 20),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold32(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 32),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold10(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 10),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.getResponsiveFontSize(context, 16),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoSemiBold20(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.getResponsiveFontSize(context, 20),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoSemiBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.getResponsiveFontSize(context, 24),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoSemiBold79(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.getResponsiveFontSize(context, 79),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler16(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 16),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler10(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 10),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler20(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 20),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler12(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 12),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler18(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 18),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoReguler14(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.getResponsiveFontSize(context, 14),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoMeduim14(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.getResponsiveFontSize(context, 14),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoMeduim16(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.getResponsiveFontSize(context, 16),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoMeduim18(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.getResponsiveFontSize(context, 18),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoMeduim20(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.getResponsiveFontSize(context, 20),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoMeduim40(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.getResponsiveFontSize(context, 40),
      fontFamily: AppFonts.LatoFont,
    );
  }

  static TextStyle styleLatoBold40(BuildContext context) {
    return TextStyle(
      color: AppColors.labelColor.withOpacity(0.87),
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.getResponsiveFontSize(context, 40),
      fontFamily: AppFonts.LatoFont,
    );
  }
}
