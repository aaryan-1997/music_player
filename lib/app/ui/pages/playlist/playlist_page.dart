import 'package:flutter/material.dart';

import '../../../config/widgets/text_base.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBase('PlaylistPage'),
        centerTitle: true,
      ),
      body: Center(
        child: TextBase(
          'PlaylistPage is working',
        ),
      ),
    );
  }
}
