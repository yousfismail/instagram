import 'package:flutter/material.dart';
import 'package:instagram_app/screens/add_post.dart';
import 'package:instagram_app/screens/home.dart';
import 'package:instagram_app/screens/profile.dart';
import 'package:instagram_app/screens/search.dart';
import 'package:instagram_app/shered/colors.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override 
  final PageController _pageController = PageController();
  int page = 0; 

  navigate2Screen(int indexx) {
    _pageController.jumpToPage(indexx);
    setState(() {
      page = indexx; 
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            onPressed: () {
              navigate2Screen(0);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: page == 1 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(1);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: page == 2 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(2);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: page == 3 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(3);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: page == 4 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(4);
            },
          ),
        ],
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/img/instagram.svg",
          color: primaryColor,
          height: 32,
        ),
      ),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        // controller: _pageController,
        children: [
          Home(),
          Search(),
          AddPost(),
          Center(child: Text("Love u ♥")),
          Profile(),
        ],
      ),
    );
  }
}
