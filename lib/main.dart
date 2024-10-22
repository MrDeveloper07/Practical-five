import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrameAnimationScreen(),
    );
  }
}

class FrameAnimationScreen extends StatefulWidget {
  @override
  _FrameAnimationScreenState createState() => _FrameAnimationScreenState();
}

class _FrameAnimationScreenState extends State<FrameAnimationScreen> {
  int _frameIndex = 0;
  Timer? _timer;
  List<String> _frames = [
    'assets/img1.avif',
    'assets/img2.avif',
    'assets/img3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startFrameAnimation();
  }

  void _startFrameAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 210), (Timer timer) {
      setState(() {
        _frameIndex = (_frameIndex + 1) % _frames.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frame Animation')),
      body: Center(
        child: Image.asset(
          _frames[_frameIndex], // Display the current frame
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
