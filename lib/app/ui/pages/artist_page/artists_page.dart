import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_app/app/widgets/background/custom_background.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({Key? key}) : super(key: key);

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  ScrollController _scrollController = ScrollController();
  double height = 200;
  bool showButton = false;
  @override
  void initState() {
    _scrollController.addListener(() {
       log("${_scrollController.position.maxScrollExtent}");
      if (_scrollController.position.maxScrollExtent <= height) {
       
        setState(() {
          showButton = true;
        });
      } else {
        setState(() {
          showButton = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackground(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text('My App'),
                  pinned: true,
                  expandedHeight: height,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://static.toiimg.com/photo/msid-85678940/85678940.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    showButton ? Icon(Icons.abc) : SizedBox.shrink(),
                  ],
                ),
              ];
            },
            body: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
