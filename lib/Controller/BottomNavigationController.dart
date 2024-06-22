import 'package:get/get.dart';
import 'package:news_shorts/HomePage/homepage.dart';
import 'package:news_shorts/Pages/ArticalPage/ArticalPage.dart';


class BottomNavController extends GetxController{

  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    Articalpage(),
  ];


}