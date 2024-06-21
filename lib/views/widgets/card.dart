part of 'widget.dart';

class ControllingCard extends StatefulWidget {
  final String title;
  final String field;

  const ControllingCard({super.key, required this.title, required this.field});

  @override
  State<ControllingCard> createState() => _ControllingCardState();
}

class _ControllingCardState extends State<ControllingCard> {
  bool isSwitched = false;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _initializeSwitch();
  }

  void _initializeSwitch() {
    _subscription = _dbRef.child(widget.field).onValue.listen((event) {
      if (event.snapshot.value != null) {
        final value = event.snapshot.value as bool;
        if (mounted) {
          setState(() {
            isSwitched = value;
          });
        }
      }
    }, onError: (error) {
      print("Error initializing switch: $error");
    });
  }

  void toggleSwitch(bool value) async {
    print("Toggle Switch: $value"); // Debug statement
    if (mounted) {
      setState(() {
        isSwitched = value;
      });
    }
    try {
      await _dbRef.child(widget.field).set(isSwitched);
      print("Data updated successfully."); // Debug statement
    } catch (error) {
      print("Error updating switch: $error");
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(widget.title),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1346744481/id/foto/koki-anonim-memanen-sayuran-segar-di-sebuah-peternakan.jpg?s=612x612&w=0&k=20&c=H5uO1LR0LweNgzIY1P5C1-Zr8q9BpPzM-t7-2dL9jO0='),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Transform.scale(
                      scale: 2.0,
                      child: Switch(
                        activeColor: Colors.yellow,
                        value: isSwitched,
                        onChanged: toggleSwitch,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'OFF',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ON',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}