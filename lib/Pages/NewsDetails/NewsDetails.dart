import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shorts/Controller/NewsController.dart';
import 'package:news_shorts/Models/NewsModel.dart';

class NewsdetailsPage extends StatelessWidget {

  final NewsModel news;
  const NewsdetailsPage({
    super.key, required this.news
  });


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          child: Row(
                            children: [Icon(Icons.arrow_back_ios_new),
                              Text("Back")],
                          ),
                        ),
                      )
                    ],
                  ),
                SizedBox(height: 30,),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(news.urlToImage ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                            fit: BoxFit.cover
                            ),
                          ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 15,),
                Text(news.title ?? "No Title",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      news.publishedAt!,
                    style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Text(
                        news.author![0],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(news.author!,
                      style: TextStyle(fontSize: 18,
                      color: Theme.of(context).colorScheme.secondaryContainer) ,
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(news.description?? "N/A",
                        style: TextStyle(fontSize: 18,
                            color: Theme.of(context).colorScheme.secondaryContainer) ,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
