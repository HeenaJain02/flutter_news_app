import 'dart:convert';

import 'package:news_app/model/articlemodel.dart';
import 'package:news_app/views/article_views.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];
  Future<void> getNews() async{
    String url="http://newsapi.org/v2/top-headlines?country=in&apiKey=d425aba4ded74a4dbc98d18a3da3617c";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null&& element['description']!=null){
          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],

            content: element["context"]

          );
          news.add(articleModel);
        }

      });

    }

}

}
class CategoryNewsClass{
  List<ArticleModel> news=[];
  Future<void> getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d425aba4ded74a4dbc98d18a3da3617c";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null&& element['description']!=null){
          ArticleModel articleModel= ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],

              content: element["context"]

          );
          news.add(articleModel);
        }

      });

    }

  }

}