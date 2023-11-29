import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.getTrendingMovie().toString());
    log('${controller.trendingMovies.toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Ritik Prajapat',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Icon(Icons.notifications),
                SizedBox(width: 12),
                Icon(Icons.search),
              ],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 260,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.trendingMovies.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: HeroCard(
                          movie: controller.trendingMovies[index],
                        ),
                      );
                    },
                    onPageChanged: (int page) => controller.currentIndex.value = page,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(10, (index) {
                    return buildDot(index);
                  }),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest movies',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.trendingMovies.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: LatestCard(
                          movie: controller.trendingMovies[index],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top rated',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.topRatedMovies.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: TopRatedCard(
                          movie: controller.topRatedMovies[index],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      alignment: Alignment.center,
      height: 8,
      width: controller.currentIndex.value == index ? 24 : 8,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: controller.currentIndex.value == index ? Colors.blue : Colors.grey.withOpacity(.25),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
