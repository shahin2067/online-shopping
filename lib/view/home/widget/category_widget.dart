import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            //color: Colors.grey.withOpacity(0.3),
            child: Center(child: Text('Category')),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 150,
                  width: 250,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      );
  }
}
