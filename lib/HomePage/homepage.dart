import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_shorts/Components/NewsTileLoading.dart';
import 'package:news_shorts/Components/TrendingLoadingCard.dart';
import 'package:news_shorts/Controller/NewsController.dart';
import 'package:news_shorts/HomePage/Widgets/NewsTile.dart';
import 'package:news_shorts/HomePage/Widgets/TrandingCard.dart';
import 'package:news_shorts/Models/NewsModel.dart';
import 'package:news_shorts/Pages/NewsDetails/NewsDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.dashboard),
                  ),
                  Text(
                    "NEWS APP",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                  InkWell(
                    onTap: () {
                      newsController.newsForYouList();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(Icons.person),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hottest News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                          () => newsController.isTrandingLoading.value
                        ? Row(
                          children: [
                          Trendingloadingcard(),
                          Trendingloadingcard()
                           ],
                        )
                        : Row(
                            children: newsController.trandingNewsList
                                .map(
                                  (e) => Trandingcard(
                                    ontap: () {
                                      Get.to(NewsdetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                                    title: e.title??"No Title",
                                    author: e.author ?? "unknown",
                                    tag: "Trending No 1",
                                    time: e.publishedAt!,
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News For You',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => newsController.isNewsForYouLoading.value
                    ? Column(
                  children: [
                    Newstileloading(),
                    Newstileloading(),
                    Newstileloading(),
                    Newstileloading(),
                  ],
                )
                    : Column(
                        children: newsController.newForYou6
                            .map(
                              (e) => Newstile(
                                ontab: () {
                                  Get.to(NewsdetailsPage(
                                    news: e,
                                  ));
                                },
                                imageUrl: e.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                                title: e.title?? "No Title",
                                author: e.author ?? "unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apple News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                      () => newsController.isAppleLoading.value
                      ? Row(
                        children: [
                          Trendingloadingcard(),
                          Trendingloadingcard()
                        ],
                      )
                      : Row(
                    children: newsController.appleNews10
                        .map(
                          (e) => Trandingcard(
                        ontap: () {
                          Get.to(NewsdetailsPage(
                            news: e,
                          ));
                        },
                        imageUrl: e.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                        title: e.title ?? "No TITLE",
                        author: e.author ?? "unknown",
                        tag: "Trending No 1",
                        time: e.publishedAt!,
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tesla News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
               Obx(
                () => newsController.isTeslaLoading.value
                    ? Column(
                      children: [
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                       ],
                    )
                    : Column(
                        children: newsController.teslaNews10
                            .map(
                              (e) => Newstile(
                                ontab: () {
                                  Get.to(NewsdetailsPage(
                                    news: e,
                                  ));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                                title: e.title ?? "No Title",
                                author: e.author ?? "unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                      () => newsController.isBussinessLoading.value
                      ? Row(
                        children: [
                          Trendingloadingcard(),
                          Trendingloadingcard()
                        ],
                      )
                      : Row(
                    children: newsController.bussinessNewList10
                        .map(
                          (e) => Trandingcard(
                        ontap: () {
                          Get.to(NewsdetailsPage(
                            news: e,
                          ));
                        },
                        imageUrl: e.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                        title: e.title ?? "No Title",
                        author: e.author ?? "unknown",
                        tag: "Trending No 1" ?? "N/A",
                        time: e.publishedAt ?? "N/A",
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
