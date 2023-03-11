import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.orange,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _itemsInCart = 0;
  List<Map> products = [
    {
      'id': '1',
      'title': 'Kit Kat',
      'price': 1,
      'imageUrl': "images/kitkat.png",
    },
    {
      'id': '2',
      'title': 'Platano',
      'price': 2,
      'imageUrl': "images/platano.png",
    },
    {
      'id': '3',
      'title': 'M&M',
      'price': 1.5,
      'imageUrl': "images/mnm.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text('La Nevera Shop'),
            Icon(
              Icons.icecream_outlined,
              color: Colors.white,
              size: 24.0,
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                isLabelVisible: _itemsInCart > 0,
                label: Text('$_itemsInCart'),
                child: const Icon(
                  Icons.shop,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _itemsInCart++;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      products[index]['imageUrl'],
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      products[index]['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${products[index]['price']}€',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
