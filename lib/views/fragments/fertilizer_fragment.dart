import 'package:flutter/material.dart';

class FertilizerFragment extends StatefulWidget {
  const FertilizerFragment({super.key});

  @override
  State<FertilizerFragment> createState() => _FertilizerFragmentState();
}

class _FertilizerFragmentState extends State<FertilizerFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('pemupukan otomatis'),
    );
  }
}