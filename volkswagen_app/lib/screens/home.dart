import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:volkswagen_app/data/data.dart';
import 'package:volkswagen_app/screens/detail_screen.dart';
import 'package:volkswagen_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 85,
                ),
                Text('Hi John',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    )),
                Text(
                  'Pick a car',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
                    height: 35,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          filled: true,
                          fillColor: AppColors.greyColor,
                          hintText: 'Search by brand, category, price, year',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 53,
                ),
                TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.circular(50), // this rounds the corners
                      color: Colors.black,
                    ),
                    tabs: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Tab(
                          text: 'Sedan',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Tab(
                          text: 'Suv',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Tab(
                          text: 'Racecar',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Tab(
                          text: 'Van',
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 58,
                ),
                Container(
                  height: 170,
                  child: TabBarView(
                    children: [
                      carous(desc: 'sedan'),
                      carous(
                        desc: 'suv',
                      ),
                      carous(desc: 'racecar'),
                      carous(desc: 'van')
                    ],
                  ),
                ),
                SizedBox(
                  height: 59,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        color: Color(0xFC4C4C4).withOpacity(0.13),
                        padding: EdgeInsets.all(14),
                        height: 82,
                        child: Row(
                          children: [
                            Container(
                                width: 85,
                                child: Image.asset(
                                  'assets/car_1.png',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 9,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'A flagship’s Evolutionary Style ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    "Mercedes' flagship sedan is back with more comfort,safety, driver assistance ",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        color: Color(0xFC4C4C4).withOpacity(0.13),
                        padding: EdgeInsets.all(14),
                        height: 82,
                        child: Row(
                          children: [
                            Container(
                                width: 85,
                                child: Image.asset(
                                  'assets/car_1.png',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 9,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'A flagship’s Evolutionary Style ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    "Mercedes' flagship sedan is back with more comfort,safety, driver assistance ",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 84,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class carous extends StatelessWidget {
  final String desc;
  const carous({
    super.key,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(enableInfiniteScroll: false),
      items: cars.where((element) => element.type == desc).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(car: i)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        i.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      i.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
