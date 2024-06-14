part of 'page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Smartfarm App'),
        ),
        body: const <Widget>[
          SensorFragment(),
          WaterFragment(),
          FertilizerFragment()
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_door),
            label: 'kelembapan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'penyiraman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.air),
            label: 'pemupukan',
          )
        ],
        onTap: setSelectedIndex,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
