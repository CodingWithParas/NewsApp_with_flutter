import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:news_shorts/Models/NewsModel.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsController extends GetxController{

  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newForYou6 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews10 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews10 = <NewsModel>[].obs;
  RxList<NewsModel> bussinessNewList = <NewsModel>[].obs;
  RxList<NewsModel> bussinessNewList10 = <NewsModel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBussinessLoading = false.obs;


  FlutterTts flutterTts = FlutterTts();



  void onInit() async{
    super.onInit();
    getNewsForYou();
    getTrandingNews();
    getAppleNews();
    getBussinessNews();
    getTeslaNews();
  }
  Future<void> getTrandingNews() async{
    isTrandingLoading.value = true;
    String baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals) {
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isTrandingLoading.value = false;
    // print(trandingNewsList);

  }

  Future<void> getNewsForYou() async{
    isNewsForYouLoading.value = true;
    String baseURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newForYou6.value = newsForYouList.sublist(0, 6).obs;
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async{
    isAppleLoading.value = true;
    String baseURL = "https://newsapi.org/v2/everything?q=apple&from=2024-06-02&to=2024-06-02&sortBy=popularity&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNews10.value = appleNewsList.sublist(0, 6).obs;
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isAppleLoading.value= false;

  }

  Future<void> getTeslaNews() async{
    isTeslaLoading.value = true;
    String baseURL = "https://newsapi.org/v2/everything?q=tesla&from=$DateTime.timestamp()&sortBy=publishedAt&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaNews10.value = teslaNewsList.sublist(0, 6).obs;
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isTeslaLoading.value = false;

  }

  Future<void> getBussinessNews() async{
    isBussinessLoading.value= true;
    String baseURL = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for(var news in articals) {
          bussinessNewList.add(NewsModel.fromJson(news));
        }
        bussinessNewList10.value = bussinessNewList.sublist(0,6).obs;
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isBussinessLoading.value= false;

  }

  Future<void> searchNews(String search) async{
    isNewsForYouLoading.value= true;
    String baseURL = "https://newsapi.org/v2/everything?q=$search&apiKey=db705a84257e47ca9255ddbb8bef47f5";
    try{
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if(response.statusCode == 200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i =0;
        for(var news in articals){
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if(i == 10){
            break;
          }
        }
      }else {
        print("Something went wrong in Tranding News");
      }
    }catch(ex){
      print(ex);
    }
    isNewsForYouLoading.value= false;

  }

}
