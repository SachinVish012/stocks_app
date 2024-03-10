import 'package:flutter/material.dart';
import 'package:stocks_app/resources/custom_widget/custom_text_widget.dart';

import '../../../resources/colors/app_colors.dart';

class StockCard extends StatelessWidget {
  final Map<String, dynamic> stock;

  const StockCard({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: AppColor.dashboard_black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset("assets/img.png"),
            ),
            const SizedBox(height: 8.0),
            CustomText(
              text:  '${stock['Stock Name']}',
              color: AppColor.textWhite,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 5.0),
            CustomText(
                text: 'Price: \$${stock['Stock Price (USD)']}',
                    color: AppColor.textWhite,
            ),
            SizedBox(height: 5.0),
            CustomText(
                text: 'Growth: ${stock['Growth (%)']}',
              color: stock['Growth (%)'].startsWith('+') ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
