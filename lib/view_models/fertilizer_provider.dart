part of 'provider.dart';

class FertilizerProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Fertilizer? _fertilizer;
  Fertilizer? get fertilizer => _fertilizer;

  Future<void> updateFertilizer(bool control) async {
    try {
      final response = await http.put(
          Uri.parse(
              'https://smartfarm-app-4f440-default-rtdb.asia-southeast1.firebasedatabase.app/fertilizer.json'),
          body: jsonEncode(control));
      if (response.statusCode == 200) {
        _fertilizer = Fertilizer(control);
        _isLoading = false;
        notifyListeners();
      } else {
        print('gagal menyalakan air');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

}
