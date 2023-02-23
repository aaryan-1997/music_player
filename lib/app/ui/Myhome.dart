import 'package:flutter/material.dart';
import 'Sliders.dart';

class Myhome extends StatefulWidget {
  var index;
  Myhome({this.index});
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  int selectedIndex = 0;
  void initState() {
    super.initState();
    selectedIndex = widget.index ?? 0;
  }

  final widgetOptions = [
    FirstHomePage(),
    Container(),
    Container(),
    Container()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_replace_outlined), label: ('Find')),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam), label: ('Videos')),
          BottomNavigationBarItem(
              icon: Icon(Icons.device_hub), label: ('My Library')),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        selectedFontSize: 15.0,
        unselectedFontSize: 15.0,
        onTap: onItemTapped,
      ),
    );
  }
}

class FirstHomePage extends StatefulWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notifications),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 60,
                    width: 200,
                  ),
                  Icon(Icons.settings),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0)
                                .copyWith(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending Playlist".toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    "View All".toUpperCase(),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("View all");
                              },
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Sliders(
                              name: "Hit de mero",
                              subTitle:
                                  "main music" /*HtmlTags.removeTag(htmlString: data.Details)*/,
                              assetName: index == 1
                                  ? "https://png.pngtree.com/png-clipart/20190515/original/pngtree-music-and-live-music-logo-with-neon-light-effect-vector-png-image_3669646.jpg"
                                  : "https://is2-ssl.mzstatic.com/image/thumb/Music116/v4/ca/a3/d6/caa3d625-ca08-d0b6-98e4-910971da9022/cover.jpg/400x400bb.jpg",
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0)
                                .copyWith(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Stations".toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    "View All".toUpperCase(),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("View all");
                              },
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Sliders(
                              name: "Hit de mero",
                              subTitle:
                                  "" /*HtmlTags.removeTag(htmlString: data.Details)*/,
                              type: "stations",
                              assetName: index == 1
                                  ? "https://i1.sndcdn.com/artworks-b6lDRYqk3oWT-0-t500x500.jpg"
                                  : "https://i1.sndcdn.com/artworks-b6lDRYqk3oWT-0-t500x500.jpg",
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0)
                                .copyWith(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Artist Radio".toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    "View All".toUpperCase(),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("View all");
                              },
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Sliders(
                              name: "Narendra Singh New",
                              subTitle:
                                  "Artist" /*HtmlTags.removeTag(htmlString: data.Details)*/,
                              type: "artist",
                              assetName: index == 1
                                  ? "https://bugyalvalley.com/wp-content/uploads/2019/11/narendra-singh-negi.jpg"
                                  : "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2018/06/09/Pictures/_2106c1ec-6c01-11e8-a936-b61db2dd9125.jpg",
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0)
                                .copyWith(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Release".toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    "View All".toUpperCase(),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("View all");
                              },
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Sliders(
                              name: "Song name",
                              subTitle:
                                  "main music" /*HtmlTags.removeTag(htmlString: data.Details)*/,
                              assetName: index == 1
                                  ? "https://png.pngtree.com/png-clipart/20190515/original/pngtree-music-and-live-music-logo-with-neon-light-effect-vector-png-image_3669646.jpg"
                                  : "https://is2-ssl.mzstatic.com/image/thumb/Music116/v4/ca/a3/d6/caa3d625-ca08-d0b6-98e4-910971da9022/cover.jpg/400x400bb.jpg",
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0)
                                .copyWith(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fresh Hits".toUpperCase(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    "View All".toUpperCase(),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("View all");
                              },
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Sliders(
                              name: "Hit de mero",
                              subTitle:
                                  "main music" /*HtmlTags.removeTag(htmlString: data.Details)*/,
                              assetName: index == 1
                                  ? "https://png.pngtree.com/png-clipart/20190515/original/pngtree-music-and-live-music-logo-with-neon-light-effect-vector-png-image_3669646.jpg"
                                  : "https://is2-ssl.mzstatic.com/image/thumb/Music116/v4/ca/a3/d6/caa3d625-ca08-d0b6-98e4-910971da9022/cover.jpg/400x400bb.jpg",
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.grey,
        bottomNavigationBar: Container(
          height: 70,
          child: Container(),
        ));
  }
}
