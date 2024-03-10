import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/resources/colors/app_colors.dart';

import '../../provider/companywise_stocks_provider/companywise_stocks_provider.dart';
import 'details_widget/data_view_widget.dart';
import 'details_widget/day_selection_button.dart';

class CompanyWiseStocks extends StatefulWidget {
  const CompanyWiseStocks({super.key});

  @override
  State<CompanyWiseStocks> createState() => _CompanyWiseStocksState();
}

class _CompanyWiseStocksState extends State<CompanyWiseStocks> {

  @override
  void initState() {
    getValue();
    super.initState();
  }
  Future<void> getValue() async {
    await Provider.of<CompanyWiseStockProvider>(context, listen: false).setValue();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.dashboard_black,
      body: Container(
        height: height/1,
        width: double.infinity,
        margin: EdgeInsets.only(top: height/14),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---for range selection. Day, Week, Month, Year.
                DaySelectionButtom(),
                //---------data show widget
                DataViewWidget(),
              ],
            ),
        ),

      ),
    );
  }
}

