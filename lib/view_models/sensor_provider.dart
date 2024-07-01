part of 'provider.dart';

class SensorProvider extends ChangeNotifier {
  int _humidity = 0;
  int get humidity => _humidity;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final DatabaseReference _db =
      FirebaseDatabase.instance.ref().child('humidity');

  Future<void> getSensor() async {
    try {
      final response = await http.get(Uri.parse(
          'https://smartfarm-app-4f440-default-rtdb.asia-southeast1.firebasedatabase.app/.json'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _humidity = json['humidity'];
        _isLoading = false;
        notifyListeners();
      } else {
        print('gagal fetch');
        notifyListeners();
      }
    } catch (e) {
      print('error fetching realtime data $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  // StreamSubscription<DatabaseEvent>? _subscription;

  // void startMonitoring() {
  //   _subscription = _db.onValue.listen((event) {
  //     _humidity = event.snapshot.value as int; // Ensure to handle null values if needed
  //     _isLoading = false;
  //     notifyListeners();
  //   }, onError: (error) {
  //     print('Error getting realtime data: $error');
  //     _isLoading = false;
  //     notifyListeners();
  //   });
  // }

  // void stopMonitoring() {
  //   _subscription?.cancel();
  // }

  // @override
  // void dispose() {
  //   _subscription?.cancel();
  //   super.dispose();
  // }
}
