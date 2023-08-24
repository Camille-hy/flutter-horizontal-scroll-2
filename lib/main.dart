import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Scroll',
      home: HorizontalScroll(),
    );
  }
}

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll({super.key});

  @override
  State<StatefulWidget> createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  int currentIndex = 0;
  final List<String> _images = ['cat1.jpg', 'cat2.jpg', 'cat3.jpg', 'cat4.jpg'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Scroll'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
          children: [
            SizedBox(height:160,),
            Container(
              height: 300,
              width: 400,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/${_images[index]}',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              width: 260,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex ? Colors.amber : Colors.grey,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
    );
  }
}
