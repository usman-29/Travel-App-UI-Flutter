import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<String> image = [
    'london.jpg',
    'paris.jpg',
    'sydney.jpg',
    'maldives.jpg',
    'santorini.jpg',
    'canyon-park.jpg',
  ];
  bool isFav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: 200,
                        child: Image.asset(
                          'assets/images/${image[index]}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      icon: Icon(Icons.favorite,
                          size: 30, color: isFav ? Colors.red : Colors.grey),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
