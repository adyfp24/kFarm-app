part of 'model.dart';

class Sensor {
  final int nilaiKelembapan;

  Sensor(this.nilaiKelembapan);

  factory Sensor.fromJson(Map<dynamic, dynamic> json) {
    return Sensor(json['humidity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'humidity': nilaiKelembapan,
    };
  }
}