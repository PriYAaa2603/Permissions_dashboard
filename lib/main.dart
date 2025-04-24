import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'app_permissions_provider.dart'; // Create this file later

void main() {
  runApp(PermissionDashboardApp());
}

class PermissionDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppPermissionsProvider(),
      child: MaterialApp(
        title: 'Permissions Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PermissionsHomePage(),
      ),
    );
  }
}

class PermissionsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppPermissionsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('App Permissions'),
      ),
      body: FutureBuilder(
        future: provider.loadPermissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.apps.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.apps[index].name),
                subtitle: Text('Camera: ${provider.apps[index].cameraStatus}'),
                trailing: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    provider.requestPermission(provider.apps[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}