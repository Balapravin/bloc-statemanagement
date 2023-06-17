

import 'package:flutter/material.dart';

class StartRating extends StatelessWidget {
  final int ratingcount;
   StartRating({super.key, required this.ratingcount});

  @override
  Widget build(BuildContext context) {
    return  Row(children:
      List.generate(5, (index) {
        return index < ratingcount ? Icon(Icons.star, color: Colors.amber, size: 16,):Icon(Icons.star_border,size: 16,);
      })
    );
  }
}
