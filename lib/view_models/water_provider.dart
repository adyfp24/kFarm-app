part of 'provider.dart';

class WaterProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Watering? _watering;
  Watering? get watering => _watering;

  Future<void> updateWatering(bool control) async {
    final response = await http.put(
        Uri.parse(
            'https://smartfarm-app-4f440-default-rtdb.asia-southeast1.firebasedatabase.app/watering.json'),
        body: jsonEncode(control));
    if (response.statusCode == 200) {
      _watering = Watering(control);
      _isLoading = false;
      notifyListeners();
    } else {
      print('gagal menyalakan air');
      notifyListeners();
    }
  }
}
