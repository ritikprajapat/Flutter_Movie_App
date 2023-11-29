import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/base/base.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class HomeController extends BaseController<HomeRepository> {
  final isSeason = false.obs;
  final isCharcter = false.obs;
  final isSingleSeason = false.obs;
  final PageController pageController = PageController();
  final currentIndex = 0.obs;

  final trendingMovies = <Movies>[].obs;
  final topRatedMovies = <Movies>[].obs;

  void loadData() async {
    await getTrendingMovie();
    await getTopRatedMovie();
  }

  Future getTrendingMovie() async {
    try {
      final RepoResponse<MovieResponse> response = await repository.getTrendingMovie();
      if (response.data != null) {
        trendingMovies(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future getTopRatedMovie() async {
    try {
      final RepoResponse<MovieResponse> response = await repository.getTopRatedMovie();
      if (response.data != null) {
        topRatedMovies(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }
}
