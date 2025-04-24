import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:permissions_dashboard/main.dart';
import 'package:permissions_dashboard/app_permissions_provider.dart';

void main() {
  testWidgets('Permissions Dashboard loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(PermissionDashboardApp());

    // Verify that the app title is displayed
    expect(find.text('App Permissions'), findsOneWidget);

    // Wait for any async operations to complete
    await tester.pumpAndSettle();
  });
}
