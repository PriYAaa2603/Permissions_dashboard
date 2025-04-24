import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class App {
  final String name;
  String cameraStatus;
  
  App({required this.name, required this.cameraStatus});
}

class AppPermissionsProvider with ChangeNotifier {
  List<App> apps = [];

  Future<void> loadPermissions() async {
    // Load the apps and their permission statuses
    // For demonstration, using static data
    apps = [
      App(name: 'Camera App', cameraStatus: 'Denied'),
      App(name: 'Location App', cameraStatus: 'Denied'),
      // Add more apps as necessary
    ];

    // Check real permission status here
    for (var app in apps) {
      var status = await Permission.camera.status;
      app.cameraStatus = status.isGranted ? 'Granted' : 'Denied';
    }
    notifyListeners();
  }

  void requestPermission(App app) async {
    if (await Permission.camera.request().isGranted) {
      app.cameraStatus = 'Granted';
    } else {
      app.cameraStatus = 'Denied';
    }
    notifyListeners();
  }
}