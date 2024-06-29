part of 'model.dart';

class Fertilizer {
  final bool kontrolPupuk;

  Fertilizer(this.kontrolPupuk);

  factory Fertilizer.fromJson(Map<dynamic, dynamic> json) {
    return Fertilizer(json['fertilizer']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fertilizer': kontrolPupuk,
    };
  }
}