import 'package:flutter/material.dart';
import 'package:movie_app/src/data/data.dart';

import '../../../core/core.dart';

class HeroCard extends StatelessWidget {
  final Movies? movie;
  const HeroCard({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      width: MediaQuery.of(context).size.width,
      color: Colors.white.withOpacity(0.2),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(top: 8),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      padding: EdgeInsets.zero,
                      label: Text(
                        'Live Now',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      movie?.originalTitle ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      // movie?.overview ?? '',
                      'Voluptate sit nulla labore eiusmod cupidatat dolore esse sint magna ullamco magna voluptate. ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Watch now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                './assets/blackclover.jpg',
                width: 200,
                height: 252,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
