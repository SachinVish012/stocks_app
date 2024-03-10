import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/resources/colors/app_colors.dart';
import 'package:stocks_app/resources/custom_widget/custom_text_widget.dart';
import 'package:stocks_app/resources/custom_widget/stocks_timewise_button.dart';

import '../../../provider/companywise_stocks_provider/companywise_stocks_provider.dart';

class DaySelectionButtom extends StatefulWidget {
  @override
  _DaySelectionButtomState createState() => _DaySelectionButtomState();
}

class _DaySelectionButtomState extends State<DaySelectionButtom> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("DaySelectionButtom--screen");
    //final provider=Provider.of<CompanyWiseStockProvider>(context,listen: false);
    return Column(
        children: [
          Consumer<CompanyWiseStockProvider>(
            builder: (context, value, child) {
              return  Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: AppColor.dashboard_black
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Stocks",
                      color: AppColor.textWhite,
                    ),
                    StockTimeButton(
                      text: '1D',
                      isSelected: value.selectedDateStocks == '1D',
                      onPressed: (){
                        value.changeSelectedRange('1D');
                      },
                    ),
                    StockTimeButton(
                      text: '1W',
                      isSelected: value.selectedDateStocks == '1W',
                      onPressed: (){
                        value.changeSelectedRange('1W');
                      },
                    ),
                    StockTimeButton(
                      text: '1M',
                      isSelected: value.selectedDateStocks == '1M',
                      onPressed: (){
                        value.changeSelectedRange('1M');
                      },
                    ),
                    StockTimeButton(
                      text: '1Y',
                      isSelected: value.selectedDateStocks == '1Y',
                      onPressed: (){
                        value.changeSelectedRange('1Y');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      )
    ;
  }
}

