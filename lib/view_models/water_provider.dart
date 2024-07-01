part of 'provider.dart';

class WaterProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Watering? _watering;
  Watering? get watering => _watering;

  Future<void> updateWatering(bool control) async{

  }
}
