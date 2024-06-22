import 'package:flutter/material.dart';

import '../../Models/NewsModel.dart';

class Trandingcard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;

  final VoidCallback ontap;



  const Trandingcard(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.author, required this.ontap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(5),
        // height: 300,
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$tag",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text("$time", style: Theme.of(context).textTheme.labelSmall)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: Text(
                  "$title",
                  maxLines: 2,
                  style: TextStyle(fontSize: 16),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    author![0],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text("$author",))
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
