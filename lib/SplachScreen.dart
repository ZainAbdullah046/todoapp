import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/Home.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplachScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://unsplash.com/photos/running-black-porsche-sedan-3ZUsNJhi_Ik"),
        ),
      ),
    ));
  }
}
