import 'dart:convert';
import 'dart:io';

import '../app_exception/app_exception.dart';
import 'baseApi_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async{
    dynamic responseJson ;
    try {
      final response= await http.get(Uri.parse(url)).timeout(Duration(seconds: 180),
      onTimeout: (){
        return Future.error("TimeOut");
      }
      );
      responseJson  = jsonDecode(response.body.toString()) ;
      print(responseJson);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson ;
  }
}