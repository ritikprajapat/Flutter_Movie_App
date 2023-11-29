import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class CastCard extends GetView<HomeController> {
  const CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              './assets/blackclover.jpg',
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Ritik Prajapat',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (!controller.isCharcter.value) ...[
            SizedBox(height: 4),
            Text('Director'),
          ],
        ],
      ),
    );
  }
}
