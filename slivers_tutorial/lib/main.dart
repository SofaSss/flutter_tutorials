import 'package:flutter/material.dart';

void main() {
  runApp(SliversApp());
}

class SliversApp extends StatelessWidget {
  const SliversApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              backgroundColor: Colors.yellow,
              toolbarHeight: 150,
              // pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Что такое сливеры и с чем их едят ',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'тяу тяу тяу ',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                      Icon(Icons.heart_broken),
                    ],
                  ),
                ),
              ),
            ),

            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              centerTitle: false,
              title: Text(
                'опа тут второй аппбар',
                style: TextStyle(color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://i.pinimg.com/originals/20/5d/95/205d9582975737a8b02fb1e5bbc02fd5.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}
