import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial_riverpod/providers/cart_notifier.dart';
import 'package:tutorial_riverpod/providers/products_provider.dart';
import 'package:tutorial_riverpod/screens/joke_generator/joke_generator_screen.dart';
import 'package:tutorial_riverpod/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const JokeGeneratorScreen(),
              ),
            ),
            child: const Text('Next tutorial'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                itemCount: allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blueGrey.withOpacity(0.05),
                    child: Column(
                      children: [
                        Image.asset(
                          allProducts[index].image,
                          width: 60,
                          height: 60,
                        ),
                        Text(allProducts[index].title),
                        Text('${allProducts[index].price}р'),
                        cartProducts.contains(allProducts[index])
                            ? TextButton(
                                onPressed: () {
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .removeProduct(allProducts[index]);
                                },
                                child: const Text("Remove"),
                              )
                            : TextButton(
                                onPressed: () {
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .addProduct(allProducts[index]);
                                },
                                child: const Text('Add'),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
