import 'package:movie_app/src/core/core.dart';

class AppUrls {
  static const String baseURL = "https://api.themoviedb.org/3";
  static const String trendingMovie = "$baseURL/trending/movie/day?language=en-US?&api_key=${AppConstants.ApiKey}";
  static const String topRatedMovie = "$baseURL/movie/top_rated?language=en-US&page=1?&api_key=${AppConstants.ApiKey}";
}
