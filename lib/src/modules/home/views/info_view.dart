import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class InfoView extends GetView<HomeController> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.srcOver,
                      ),
                      child: Image.asset(
                        './assets/blackclover.jpg',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.play_circle_outline_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                      Text(
                        'Play Trailer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Black Clover',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    child: Text(
                      '12+',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '170 Episodes',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Summer 2017',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Watch now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Officia id qui consequat nostrud qui sint ad cupidatat sunt nisi. Commodo consectetur sunt ut magna. Amet culpa ex duis sit amet qui sit irure fugiat quis incididunt. Enim enim exercitation labore ut adipisicing aliqua pariatur.Enim enim exercitation labore ut adipisicing aliqua pariatur.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      controller.isSeason.value = false;
                      controller.isCharcter.value = false;
                      controller.isSingleSeason.value = false;
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      'Director & Crew',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      controller.isSeason.value = false;
                      controller.isCharcter.value = true;
                      controller.isSingleSeason.value = false;
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      'Charcters',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      controller.isSeason.value = true;
                      controller.isCharcter.value = false;
                      controller.isSingleSeason.value = false;
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      'Seasons',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  return controller.isSeason.value
                      ? controller.isCharcter.value
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: CastCard(),
                                  );
                                },
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: SeasonsCard(),
                                  );
                                },
                              ),
                            )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: CastCard(),
                              );
                            },
                          ),
                        );
                },
              ),
              Obx(
                () {
                  return controller.isSingleSeason.value
                      ? Container(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Season 1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 12),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: SingleSeasonCard(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
