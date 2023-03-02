import 'package:flutter/material.dart';

import '../../../config/widgets/text_base.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBase('ProfilePage'),
        centerTitle: true,
      ),
      body: Center(
        child: TextBase(
          'ProfilePage is working',
        ),
      ),
    );
  }
}
