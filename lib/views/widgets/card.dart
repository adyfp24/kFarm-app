part of 'widget.dart';

class ControllingCard extends StatefulWidget {
  const ControllingCard({super.key});

  @override
  State<ControllingCard> createState() => _ControllingCardState();
}

class _ControllingCardState extends State<ControllingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(
          color: Colors.black, 
          width: 1.0, 
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: MediaQuery.of(context).size.height * 0.30,
      child: const Row(
        children: [
          Column(
            children: [Text('col 1')],
          ),
          Column(
            children: [Text('col 1')],
          ),
        ],
      ),
    );
  }
}
