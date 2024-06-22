import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shorts/Components/NavigationBar.dart';
import 'package:news_shorts/Controller/NewsController.dart';
import 'package:news_shorts/Pages/ArticalPage/widgets/SearchWidget.dart';
import 'package:news_shorts/Pages/NewsDetails/NewsDetails.dart';

import '../../Components/NewsTileLoading.dart';
import '../../HomePage/Widgets/NewsTile.dart';

class Articalpage extends StatelessWidget {
  const Articalpage ({super.key,});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Searchwidget(),
              SizedBox(height: 20,),
              Obx( () => newsController.isNewsForYouLoading.value ?
              Column(
                children: [
                  Newstileloading(),
                  Newstileloading(),
                  Newstileloading(),
                  Newstileloading(),
                  Newstileloading(),
                  Newstileloading(),
                ],
              ) :
                 Column(
                  children: newsController. newsForYouList
                      .map(
                        (e) => Newstile(
                      ontab: () {
                        Get.to(NewsdetailsPage(
                          news: e,
                        ));
                      },
                      imageUrl: e.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                      title: e.title ?? "Title ",
                      author: e.author ?? "unknown",
                      time: e.publishedAt ?? "Today",
                    ),
                  )
                      .toList(),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
