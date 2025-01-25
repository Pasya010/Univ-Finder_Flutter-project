import 'package:flutter/material.dart';
import 'package:univ_finder_app/view/collection_page.dart';
import 'package:univ_finder_app/view/home_page.dart';

class PagesNavigator extends StatefulWidget {
  const PagesNavigator({super.key});

  @override
  State<PagesNavigator> createState() => _PagesNavigatorState();
}

class _PagesNavigatorState extends State<PagesNavigator> {
  final PageController _pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  void navigateBottomBar(int index) async {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'UNIV FINDER',
          style: TextStyle(fontFamily: 'LibreBaskerville', fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: [
                    const HomePage(),
                    const CollectionPage(),
                  ],
                ),
              ),
            ],
          ),

          // Button for page navigation
          Positioned(
            bottom: 40,
            right: 70,
            left: 70,
            child: Container(
              height: 70,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // home button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: selectedIndex == 0
                          ? Size.fromRadius(30)
                          : Size.fromRadius(20),
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      iconColor: Colors.black,
                    ),
                    onPressed: () => navigateBottomBar(0),
                    child: Icon(Icons.home),
                  ),

                  // collection button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: selectedIndex == 1
                          ? Size.fromRadius(30)
                          : Size.fromRadius(20),
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      iconColor: Colors.black,
                    ),
                    onPressed: () => navigateBottomBar(1),
                    child: Icon(Icons.bookmark),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
