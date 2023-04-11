
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';

class IsolateService{

  static const notificationChannelId = 'my_foreground';
  static const notificationId = 888;

  static Future<void> onStart(ServiceInstance serviceInstance) async {
    late StreamSubscription<Position> _positionStream;
    late List<Position> _positionHistory;
    DateTime startTime = DateTime.now();

    _positionHistory = [];
    _positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high, distanceFilter: 5))
        .listen((Position position) {
      _positionHistory.add(position);
      double travelled_km = 0;
      for (int i = 0; i < _positionHistory.length - 1; i++) {
        travelled_km += Geolocator.distanceBetween(
            _positionHistory[i].latitude,
            _positionHistory[i].longitude,
            _positionHistory[i + 1].latitude,
            _positionHistory[i + 1].longitude);
      }

      //send data to isolate

      Map<String, dynamic> dataToSend = {};
      dataToSend['travelled_km'] = '$travelled_km,$startTime,$position';
      serviceInstance.invoke('km', dataToSend);
      debugPrint("MANI KM  ISOLATE $dataToSend");
    });

    //receive data to isolate
    serviceInstance.on("stop").listen((event) {
      String message='Service Stopped';
      serviceInstance.stopSelf();
      debugPrint("MANI DATA TO STOP RECEIVED");

      if (event!['action'] == 'stopService') {
        //send-data from isolate to main
        Map<String, dynamic> dataToSend = {'message': message};
        serviceInstance.invoke('afterStop', dataToSend);
        debugPrint("MANI DATA TO STOP $dataToSend");
      }
    });
  }

  Future<void> initializeService() async {
    debugPrint('INSIDE BACKGROUND SERVICE');
    final service = FlutterBackgroundService();
    await service.configure(
        androidConfiguration: AndroidConfiguration(
          onStart: IsolateService.onStart,
          autoStart: true,
          isForegroundMode: true,
        ),
        iosConfiguration: IosConfiguration());
  }
}