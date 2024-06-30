part of 'provider.dart';

class SensorProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Sensor? _sensor;
  Sensor? get sensor => _sensor;

  Future<void> getSensor() async{

  }
}