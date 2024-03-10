import 'package:stocks_app/resources/api_url/api_url.dart';

import '../../data/network/networkAPI_service.dart';

class DashboardRepo{
  final _ApiServices=NetworkApiServices();

  Future<dynamic> getDataDashboard() async{
    print(AppURL.dashboardAPI);
    final response=await _ApiServices.getApi(AppURL.dashboardAPI);
    return response;
  }
}