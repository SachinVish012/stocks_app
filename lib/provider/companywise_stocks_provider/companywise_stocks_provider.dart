import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../resources/json_data/detailed_jsonData.dart';
import '../../resources/models/stock_details_model.dart';

class CompanyWiseStockProvider with ChangeNotifier{

  //----for dashboard stocks data---http://jsonblob.com/1215258015975727104
  Map<String, dynamic> _jsonMap = json.decode(DetailsStocksJson().jsonData);
  Map<String, dynamic> get jsonMap=>_jsonMap;


  List<StocksDetailsModel> _stocksDetails = [];
  List<StocksDetailsModel> get stocksDetails=>_stocksDetails;

  //---for change stocks- day,week,view
  String _selectedDateStocks="1D";
  String get selectedDateStocks=>_selectedDateStocks;

  String _selectedStockValue="";
  String get selectedDateStockValue=>_selectedStockValue;

  //-----for change according to select range.
  void changeSelectedRange(value){
    _selectedDateStocks=value;
    notifyListeners();
  }

  //-----mapping value and adding in list
  Future<void> setValue()async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.clear,
    );
    _stocksDetails=[];
    _selectedDateStocks="1D";
   _jsonMap.forEach((key, value) {
      _stocksDetails.add(StocksDetailsModel.fromJson(value));
    });
    await EasyLoading.dismiss();
    notifyListeners();
  }



}