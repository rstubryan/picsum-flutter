import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PictureNavigation(),
    );
  }
}

class PictureNavigation extends StatefulWidget {
  @override
  _PictureNavigationState createState() => _PictureNavigationState();
}

class _PictureNavigationState extends State<PictureNavigation> {
  List<String> imageUrls = [
    "https://picsum.photos/300",
    "https://picsum.photos/301",
    "https://picsum.photos/302",
    "https://picsum.photos/303",
    "https://picsum.photos/304",
    "https://picsum.photos/305",
    "https://picsum.photos/306",
    "https://picsum.photos/307",
    "https://picsum.photos/308",
    "https://picsum.photos/309",
  ];

  int currentIndex = 0;

  void goToFirst() {
    setState(() {
      currentIndex = 0;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
    });
  }

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + imageUrls.length) % imageUrls.length;
    });
  }

  void goToLast() {
    setState(() {
      currentIndex = imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Navigation'),
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrls[currentIndex]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: goToFirst,
                  child: Text('First'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToNext,
                  child: Text('Next'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToPrevious,
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToLast,
                  child: Text('Last'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
