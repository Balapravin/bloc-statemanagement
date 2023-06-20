

import 'package:flutter/material.dart';

class StartRating extends StatelessWidget {
  final int ratingcount;
   const StartRating({Key? key, required this.ratingcount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(children:
      List.generate(5, (index) {
        return index < ratingcount ?const Icon(Icons.star, color: Colors.amber, size: 16,):const Icon(Icons.star_border,size: 16,);
      })
    );
  }
}
