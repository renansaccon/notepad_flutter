import 'package:dio/dio.dart';
import 'package:myapp/model/new_phrase.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://zenquotes.io')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/api/random')
  Future<List<NewModelPhrase>> getNewPhrase();


}