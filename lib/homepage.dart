import 'package:flutter/material.dart';

// widget imports
import 'package:music_app/widgets/artist_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          const SizedBox(height: 20),
          const Text('Favorite artists'),
          const SizedBox(height: 20),
          Row(
            children: [
              circleArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 1');
              }),
              circleArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 2');
              }),
              circleArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 3');
              }),       
            ]),
          const Text('Your songs'),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                child: const Text('Artist 1'),
                onPressed: () {
                }
              ),
              TextButton(
                child: const Text('Artist 1'),
                onPressed: () {
                }
              ),
              TextButton(
                child: const Text('Artist 1'),
                onPressed: () {
                }
              ),
            ]
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              squareArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 1');
              }), 
              squareArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 2');
              }), 
              squareArtist('https://bayeight.com/wp-content/uploads/2022/01/what-is-asession-musician.jpg.webp', () {
                print('Artist 3');
              }), 
            ],  
          )
        ]
      )
    );
  }
} 