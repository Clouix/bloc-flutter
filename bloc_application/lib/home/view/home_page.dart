

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey Ale'),
        centerTitle: true,
      ),
      body: Image.network("https://wow.zamimg.com/modelviewer/wrath/webthumbs/npc/218/22234.png"),
    );
  }
}