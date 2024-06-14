import 'package:flutter/material.dart';

class WaterFragment extends StatefulWidget {
  const WaterFragment({super.key});

  @override
  State<WaterFragment> createState() => _WaterFragmentState();
}

class _WaterFragmentState extends State<WaterFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('penyiraman otomatis'),
    );
  }
}