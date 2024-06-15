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
          automaticallyImplyLeading: false,
          title: const Text('Smartfarm App'),
        ),
        body: const <Widget>[
          SensorFragment(),
          ControlFragment(),
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_door),
            label: 'monitoring',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'kontroling',
          ),
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
