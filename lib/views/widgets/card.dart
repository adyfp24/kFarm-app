part of 'widget.dart';

class ControllingCard extends StatefulWidget {
  final String title;
  final String field;

  const ControllingCard({super.key, required this.title, required this.field});

  @override
  State<ControllingCard> createState() => _ControllingCardState();
}

class _ControllingCardState extends State<ControllingCard> {
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    // Initialize the current state from the provider
    if (widget.field == 'watering') {
      _isActive = Provider.of<WaterProvider>(context, listen: false).watering?.kontrolAir ?? false;
    } else if (widget.field == 'fertilizer') {
      _isActive = Provider.of<FertilizerProvider>(context, listen: false).fertilizer?.kontrolPupuk ?? false;
    }
  }

  void _onToggle(bool value) {
    setState(() {
      _isActive = value;
    });

    if (widget.field == 'watering') {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2420231561.
      Provider.of<WaterProvider>(context, listen: false).updateWatering(value);
    } else if (widget.field == 'fertilizer') {
      Provider.of<FertilizerProvider>(context, listen: false).updateFertilizer(value);
    }
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
                        activeColor: Colors.amber,
                        inactiveThumbColor: Colors.amber[100],
                        value: _isActive,
                        onChanged: _onToggle,
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
