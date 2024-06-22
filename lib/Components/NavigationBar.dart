import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shorts/Controller/BottomNavigationController.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {

    BottomNavController controller = Get.put(BottomNavController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 120,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  controller.index.value = 0;
                },
                child: Obx( () =>
                   AnimatedContainer(
                     duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: controller.index.value == 0 ?
                        Theme.of(context).colorScheme.primary  : null,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        // size: 25,
                        color: controller.index.value == 0 ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  controller.index.value = 1;
                },
                child: Obx(() =>
                   AnimatedContainer(
                     duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: controller.index.value == 1 ?
                        Theme.of(context).colorScheme.primary  : null,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Icon(Icons.search_rounded,
                        color: controller.index.value == 1 ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.onBackground,

                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

