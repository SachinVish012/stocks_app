import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/companywise_stocks_provider/companywise_stocks_provider.dart';
import '../../../provider/dashboard_provider/dashboard_provider.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/custom_widget/custom_text_widget.dart';
import 'custom_cart_widget.dart';

class DataViewWidget extends StatelessWidget {
  const DataViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      height: height/1.2,
      child: Consumer<CompanyWiseStockProvider>(
        builder: (context, value, child) {
          return
            ListView.builder(
              itemCount: value.stocksDetails.length,
              itemBuilder: (context, index) {
                final company = value.stocksDetails[index];
                final dashboardProvider=Provider.of<DashboardProvider>(context);
                //----condition for company wise data. if we want to see all data just remove if condition.
                if(dashboardProvider.selectedCompName==company.name ) {
                  return
                    Column(
                    children: [
                      //---for company
                      CustomCard(
                        text: company.name,
                        subtitleText: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoItem(
                                    'Open', '\$${company.open.toString()}'),
                                _buildInfoItem('Prev Close',
                                    '\$${company.prevClose.toString()}'),
                                _buildInfoItem('Volume',
                                    '\$${company.volume.toString()}'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            value.selectedDateStocks == "1D" ?
                            _buildInfoItem1(value.selectedDateStocks,
                                '\$${company.returnData.day.toString()}') :
                            value.selectedDateStocks == "1W"
                                ? _buildInfoItem1(value.selectedDateStocks,
                                '\$${company.returnData.week.toString()}')
                                :
                            value.selectedDateStocks == "1M" ?
                            _buildInfoItem1(value.selectedDateStocks,
                                '\$${company.returnData.month.toString()}') :
                            _buildInfoItem1(value.selectedDateStocks,
                                '\$${company.returnData.year.toString()}')

                          ],
                        )
                      ),
                      //---for Fundamental
                      CustomCard(
                          text: "Fundamental",
                          subtitleText: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoItem('Mkt Cap',
                                  '\$${company.fundamentalData.mktCap
                                      .toString()}'),
                              _buildInfoItem('ROE',
                                  '\$${company.fundamentalData.roe
                                      .toString()}'),
                              _buildInfoItem('Book Value',
                                  '\$${company.fundamentalData.bookValue
                                      .toString()}'),
                              _buildInfoItem('Face Value',
                                  '\$${company.fundamentalData.faceValue
                                      .toString()}'),
                            ],
                          )
                      ),
                    ],
                  );
                }
                else return SizedBox();
              },
            );
        },
      ),
    );
  }
  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        CustomText(text: label),
        SizedBox(height: 5),
        CustomText(text: value),
      ],
    );
  }
  Widget _buildInfoItem1(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        CustomText(text: label+" Return"),
        SizedBox(height: 5),
        CustomText(text: value,color: value.contains('+') ? Colors.green : Colors.red,),
      ],
    );
  }
}
