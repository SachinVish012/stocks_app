import 'package:flutter/material.dart';
import 'package:stocks_app/resources/json_data/dashboard_json_data.dart';

import '../../repository/dashboard_repo/dashboard_repo.dart';

class DashboardProvider with ChangeNotifier{

  //----for dashboard stocks data---http://jsonblob.com/1215258015975727104
  List<Map<String, dynamic>> _stocksdata=DashboardJsonData().dashbboardstocks;
  List<Map<String, dynamic>> get stocksdata=> _stocksdata;

  //---- for selecting a company and display the data accordingly.
  String _selectedCompName="";
  String get selectedCompName=>_selectedCompName;

  void setComp(comp){
    _selectedCompName="";
    _selectedCompName=comp;
    notifyListeners();
  }
}