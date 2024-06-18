part of 'fragment.dart';

class ControlFragment extends StatefulWidget {
  const ControlFragment({super.key});

  @override
  State<ControlFragment> createState() => _ControlFragmentState();
}

class _ControlFragmentState extends State<ControlFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllingCard(title: 'Penyiraman Otomatis',),
            SizedBox(height: 40,),
            ControllingCard(title: 'Pemupukan Otomatis',)
          ],
        ),
      ),
    );
  }
}