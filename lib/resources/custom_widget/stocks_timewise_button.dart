import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/companywise_stocks_provider/companywise_stocks_provider.dart';

class StockTimeButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  StockTimeButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () => onPressed(),
        child: isSelected
            ? Container(
          width: width / 6,
          height: height / 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isSelected ? Colors.blue : Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        )
            : Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
  }
}
