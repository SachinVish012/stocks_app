class DetailsStocksJson{
  final String jsonData = '''
  {
    "ABC Corp": {
      "name": "ABC Corp",
      "returnData": {
        "1Day Return (%)": "+2.3%",
        "1Week Return (%)": "+1.8%",
        "1Month Return (%)": "+5.2%",
        "1Year Return (%)": "+15.6%"
      },
      "open": 90,
      "prevClose": 91,
      "volume": 4494994,
      "fundamentalData": {
        "Mkt Cap": "10B",
        "ROE": "12.5%",
        "Book Value": 50.75,
        "Face Value": 10
      }
    },
    "XYZ Inc": {
      "name": "XYZ Inc",
      "returnData": {
        "1Day Return (%)": "-1.1%",
        "1Week Return (%)": "-0.5%",
        "1Month Return (%)": "-3.2%",
        "1Year Return (%)": "+8.9%"
      },
      "open": 105,
      "prevClose": 104,
      "volume": 5249831,
      "fundamentalData": {
        "Mkt Cap": "15B",
        "ROE": "9.8%",
        "Book Value": 40.2,
        "Face Value": 5
      }
    }
  }
  ''';
}