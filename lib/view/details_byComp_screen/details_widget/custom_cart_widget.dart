import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';
import '../../../resources/custom_widget/custom_text_widget.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Widget subtitleText;

  CustomCard({required this.text, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 4,
      color: AppColor.dashboard_black,
      margin: EdgeInsets.symmetric(horizontal: width / 24, vertical: height / 50),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: width / 24, vertical: height / 60),
        title: CustomText(
          text: text,
          color: AppColor.textWhite,
          fontWeight: FontWeight.bold,
        ),
        subtitle: subtitleText,
        onTap: () {
        },
      ),
    );
  }

}
