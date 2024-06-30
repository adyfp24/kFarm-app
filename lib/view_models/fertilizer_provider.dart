part of 'provider.dart';

class FertilizerProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Fertilizer? _fertilizer;
  Fertilizer? get fertilizer => _fertilizer;

  Future<void> turnOn() async{

  }

  Future<void> turnOff() async{
    
  }
}
