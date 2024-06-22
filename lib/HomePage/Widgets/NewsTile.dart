import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontab;

  const Newstile({super.key, required this.imageUrl, required this.title, required this.time, required this.author, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      Flexible(child: Text("$author"))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text("$title",
                    maxLines: 2,),
                  SizedBox(height: 15,),
                  Text("$time", style: Theme.of(context).textTheme.labelSmall,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
