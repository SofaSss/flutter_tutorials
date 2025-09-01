import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial_riverpod/providers/joke_provider.dart';

class JokeGeneratorScreen extends StatelessWidget {
  const JokeGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke Generator')),
      body: SizedBox.expand(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final joke = ref.watch(jokeProvider);
            return Stack(
              alignment: Alignment.center,
              children: [
                switch (joke) {
                  AsyncData(:final value) => SelectableText(
                    '${value.setup}\n\n'
                    '${value.punchline}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                  AsyncError(error: != null) => const Text(
                    'Error fetching joke',
                  ),
                  AsyncLoading() => const CircularProgressIndicator(),
                  _ => Container(),
                },
                if (joke
                    .isRefreshing) // AsyncValue.isRefreshing. Этот флаг имеет значение true, когда доступны старые данные и выполняется новый запрос.
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(),
                  ),
                Positioned(
                  bottom: 20,
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(jokeProvider),
                    child: const Text('Get another joke'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
