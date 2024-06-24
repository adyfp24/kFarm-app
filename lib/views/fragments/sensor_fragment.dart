part of 'fragment.dart';

class SensorFragment extends StatefulWidget {
  const SensorFragment({super.key});

  @override
  State<SensorFragment> createState() => _SensorFragmentState();
}

class _SensorFragmentState extends State<SensorFragment> {
  double _moistureValue = 60;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            
            child: Text('Monitoring kelembapan tanah',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 25, color: Colors.red),
                  GaugeRange(
                      startValue: 26, endValue: 50, color: Colors.orange),
                  GaugeRange(startValue: 51, endValue: 75, color: Colors.green),
                  GaugeRange(startValue: 76, endValue: 100, color: Colors.blue),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: _moistureValue),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        '$_moistureValue%',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  ),
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        'Kondisi tanah basah',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.8,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
