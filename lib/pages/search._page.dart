import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int count = 0;
  List<String> image = [
    'london.jpg',
    'paris.jpg',
    'sydney.jpg',
    'maldives.jpg',
    'santorini.jpg',
    'canyon-park.jpg',
  ];
  List<String> city = [
    'London',
    'Paris',
    'Sydney',
    'Maldives',
    'Santorini',
    'Arizona',
  ];
  List<String> place = [
    'Big Ben',
    'Disney Land',
    'Opera House',
    'Maldives',
    'Santorini',
    'Canyon Park',
  ];
  List<String> info = [
    'The tower housing Big Ben was formally known as St. Stephen/'
        's Tower until 2012, when it was renamed Elizabeth Tower on the occasion of Elizabeth II/'
        's Diamond Jubilee, celebrating 60 years on the British throne.',
    'Disneyland Paris is a bucket list experience for Disney fans, regardless of when you visit. However, now is an especially magical time to check out the resort, as it/'
        's celebrating its 30th anniversary in 2022, with celebrations set to continue until Sept. 30, 2023.',
    'The Sydney Opera House is a multi-venue performing arts centre in Sydney. Located on the foreshore of Sydney Harbour, it is widely regarded as one of the world/'
        's most famous and distinctive buildings and a masterpiece of 20th-century architecture.',
    'The Maldives is famous for a number of reasons, including its vibrant culture, pristine beaches, sprawling greenery, and fascinating landmarks. Apart from the numerous enchanting landmarks, Maldives is also famous for water sports and other adventure activities.',
    'Santorini is renowned for its tradition in wine making and boasts vast vineyards and fine wine varieties. Its boutique wineries are a must as they offer the ultimate ambrosial experience.',
    'he Grand Canyon is probably the most famous canyon in Arizona: for good reason. This canyon is like a bowl and has two rims: the north and south rim.',
  ];
  final double imageWidth = 150;
  final double imageHeight = 250;
  bottomSheet(BuildContext context, String image, String city, String place,
      String info) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    city,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        place,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.favorite),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: Text(
                    info,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          Icon(
            Icons.filter_alt_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Top Tours',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'For Your Request',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: imageWidth / imageHeight,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: GestureDetector(
                              onTap: () {
                                bottomSheet(
                                  context,
                                  'assets/images/${image[index]}',
                                  city[index],
                                  place[index],
                                  info[index],
                                );
                              },
                              child: SizedBox(
                                height: imageHeight,
                                width: imageWidth,
                                child: Image.asset(
                                  'assets/images/${image[index]}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            place[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
