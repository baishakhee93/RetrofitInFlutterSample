import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_flutter_sample/model/post_model.dart';
import 'package:retrofit_flutter_sample/model/request_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

/*  @GET("android_json_file.json")
  Future<List<RequestModel>> getRequestModel();*/
  @GET("posts")
  Future<List<PostModel>> getRequestModel();
}
