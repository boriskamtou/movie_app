import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/models/category.dart';
import 'package:movie_app/widgets/space10.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu-screen';
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Category> _categories = [
    Category(
      id: DateTime.now().toString(),
      title: 'Movie',
      image: 'assets/images/icon_movie.png',
    ),
    Category(
      id: DateTime.now().toString(),
      title: 'TV Shows',
      image: 'assets/images/icon_tv.png',
    ),
    Category(
      id: DateTime.now().toString(),
      title: 'Drama',
      image: 'assets/images/icon_drama.png',
    ),
    Category(
      id: DateTime.now().toString(),
      title: 'News',
      image: 'assets/images/icon_news.png',
    ),
    Category(
      id: DateTime.now().toString(),
      title: 'Sport',
      image: 'assets/images/icon_sport.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kOrangeDarkColor,
                        kOrangeHellColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.menu,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 100,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 40,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  //TODO:
                                  print('Hello');
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF8D8C8C),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              hintText: 'Search...',
                              hintStyle: kHintTextStyle,
                              fillColor: kWhite,
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: kBackgroundColor,
                      child: ListView.builder(
                        itemCount: _categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: kSimpleOrange,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kSimpleOrange.withOpacity(0.5),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: Center(
                                  child: Image.asset(
                                    _categories[i].image,
                                    width: 50,
                                  ),
                                ),
                              ),
                              Space10(),
                              Text(
                                _categories[i].title,
                                style: TextStyle(color: kWhite, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Space10(),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Recommended for you',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kWhite,
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //TODO:
                                },
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Space10(),
                          Container(
                            child: Expanded(
                              child: ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, i) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/movie$i.png',
                                      width: 150,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Space10(),
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Popular Movie',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kWhite,
                                fontSize: 18,
                              ),
                            ),
                            Space10(),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, i) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'assets/images/movie$i.png',
                                    width: 80,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
