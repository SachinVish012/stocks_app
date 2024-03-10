class StocksDetailsModel {
  final String name;
  final ReturnData returnData;
  final int open;
  final int prevClose;
  final int volume;
  final FundamentalData fundamentalData;

  StocksDetailsModel({
    required this.name,
    required this.returnData,
    required this.open,
    required this.prevClose,
    required this.volume,
    required this.fundamentalData,
  });

  factory StocksDetailsModel.fromJson(Map<String, dynamic> json) {
    return StocksDetailsModel(
      name: json['name'],
      returnData: ReturnData.fromJson(json['returnData']),
      open: json['open'],
      prevClose: json['prevClose'],
      volume: json['volume'],
      fundamentalData: FundamentalData.fromJson(json['fundamentalData']),
    );
  }
}

class ReturnData {
  final String day;
  final String week;
  final String month;
  final String year;

  ReturnData({
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  factory ReturnData.fromJson(Map<String, dynamic> json) {
    return ReturnData(
      day: json['1Day Return (%)'],
      week: json['1Week Return (%)'],
      month: json['1Month Return (%)'],
      year: json['1Year Return (%)'],
    );
  }
}

class FundamentalData {
  final String mktCap;
  final String roe;
  final double bookValue;
  final int faceValue;

  FundamentalData({
    required this.mktCap,
    required this.roe,
    required this.bookValue,
    required this.faceValue,
  });

  factory FundamentalData.fromJson(Map<String, dynamic> json) {
    return FundamentalData(
      mktCap: json['Mkt Cap'],
      roe: json['ROE'],
      bookValue: json['Book Value'],
      faceValue: json['Face Value'],
    );
  }
}

