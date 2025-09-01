import 'package:dio/dio.dart';
import 'package:tutorial_riverpod/models/joke.dart';

class JokeService {
  final dio = Dio();

  Future<Joke> fetchRandomJoke() async {
    final responce = await dio.get<Map<String, Object?>>(
      'https://official-joke-api.appspot.com/random_joke',
    );
    return Joke.fromJson(responce.data!);
  }
}
