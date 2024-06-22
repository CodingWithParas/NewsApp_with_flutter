import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shorts/Controller/NewsController.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search Any Type News..Sport, India etc..",
                  // prefixIcon: Icon(Icons.search),
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: InputBorder.none),
            ),
          ),
          Obx(
            () => newsController.isNewsForYouLoading.value
                ? Container(
                    padding: EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      newsController.searchNews(searchController.text);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: Icon(Icons.search),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
