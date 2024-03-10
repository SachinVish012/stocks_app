import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/provider/companywise_stocks_provider/companywise_stocks_provider.dart';
import 'package:stocks_app/provider/dashboard_provider/dashboard_provider.dart';
import 'package:stocks_app/view/dashborad_screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>DashboardProvider()),
          ChangeNotifierProvider(create: (_)=>CompanyWiseStockProvider()),
        ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DashboardScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

