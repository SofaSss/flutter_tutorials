import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial_riverpod/services/joke_service.dart';

final jokeServiceProvider = Provider((ref) => JokeService());

final jokeProvider = FutureProvider((ref) async {
  final service = ref.watch(jokeServiceProvider);
  return service.fetchRandomJoke();
});
