part of 'fragment.dart';

class SensorFragment extends StatefulWidget {
  const SensorFragment({super.key});

  @override
  State<SensorFragment> createState() => _SensorFragmentState();
}

class _SensorFragmentState extends State<SensorFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Monitoring Fragment'),
    );
  }
}