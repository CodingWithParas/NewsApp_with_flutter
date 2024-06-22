import 'package:flutter/material.dart';

import 'LoadingContainer.dart';

class Newstileloading extends StatelessWidget {
  const Newstileloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Loadingcontainer(
            width: 120,
            height: 120,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Loadingcontainer(width:30,
                        height: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:Loadingcontainer(width: MediaQuery.of(context).size.width/4,
                          height: 10),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Loadingcontainer(width: MediaQuery.of(context).size.width/2,
                        height: 10),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Loadingcontainer(width: MediaQuery.of(context).size.width/2.2,
                        height: 10),
                  ],
                ),
                SizedBox(height: 15,),
                Loadingcontainer(width: MediaQuery.of(context).size.width/4,
                    height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
