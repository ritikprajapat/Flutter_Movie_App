import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class HomeRepository extends BaseRepository {
  Future<RepoResponse<MovieResponse>> getTrendingMovie() async {
    String apiURL = AppUrls.trendingMovie;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MovieResponse.fromJson(response));
  }

  Future<RepoResponse<MovieResponse>> getTopRatedMovie() async {
    String apiURL = AppUrls.topRatedMovie;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MovieResponse.fromJson(response));
  }
}
