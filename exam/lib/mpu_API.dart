import 'dart:html';

import 'main.dart';
import 'package:http/http.dart' as http;



class PP{
  Future<void> getNews() async{
    var response = http.get(Uri.parse("https://new.mospolytech.ru/news/"));
     var client = http.Client();
     var newsModel = null;

     print(response);
}

  @override
  void initState() {
    super.initState();
  }
}


// class Parse_Manager{
//   Future<NewsModel> getNews() async{
//     var client = http.Client();
//     var newsModel = null;
//   }

//   try {
//     var response = await client.get(String.news_url);
//     if (response == 200) {
//       var jsonString = response.body;
//       var jsonMap = json.decode(jsonString);

//       newsModel = NewsModel.fromJson(jsonMap);
//     }
//   } catch (Exception){
//     return newsModel
//   }
// }