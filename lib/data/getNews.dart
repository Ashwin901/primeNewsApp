import 'dart:convert';

import 'package:http/http.dart';

class GetNews{
Future getData(String url)async{
  Response response = await get(url);
  var newsData = jsonDecode(response.body);
  return newsData;
}
}