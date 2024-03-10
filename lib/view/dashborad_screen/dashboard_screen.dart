import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/provider/dashboard_provider/dashboard_provider.dart';
import 'package:stocks_app/resources/colors/app_colors.dart';
import 'package:stocks_app/resources/localization/localization.dart';
import 'package:stocks_app/view/dashborad_screen/widget/dashboard_widget.dart';

import '../../resources/custom_widget/custom_text_widget.dart';
import '../details_byComp_screen/detailsbyComp_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    print("Dashboard");
    return Scaffold(
      backgroundColor: AppColor.dashboard_black,
      appBar: AppBar(
        backgroundColor: AppColor.dashboard_black,
        title: Center(
          child: CustomText(
            text: AppLanguage.stocks_title,
            color: AppColor.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        margin: EdgeInsets.all(10),
        child:
        Consumer<DashboardProvider>(
          builder: (context, value, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: value.stocksdata.length,
              itemBuilder: (context, index) {
                final stock = value.stocksdata[index];
                return GestureDetector(
                  onTap: (){
                    //----for set company name for showing stock. We can also pass the same value through a constructor.
                    value.setComp(stock['Stock Name']);
                    print(stock['Stock Name'].toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyWiseStocks()));
                  },
                    child: StockCard(stock: stock)
                );
              },
            );
          },
        )
      ),
    );
  }
}
