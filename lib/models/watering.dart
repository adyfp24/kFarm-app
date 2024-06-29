part of 'model.dart';

class Watering {
  final bool kontrolAir;

  Watering(this.kontrolAir);

  factory Watering.fromJson(Map<dynamic, dynamic> json) {
    return Watering(json['watering']);
  }

  Map<String, dynamic> toJson() {
    return {
      'watering': kontrolAir,
    };
  }
}
