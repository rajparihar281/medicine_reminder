import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/storage_service.dart';
import 'services/notification_service.dart';
import 'providers/medicine_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Storage (Hive)
  final storageService = StorageService();
  await storageService.init();

  // 2. Initialize Notifications
  final notificationService = NotificationService();
  await notificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MedicineProvider())],
      child: MaterialApp(
        title: 'Medicine Reminder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Design Constraint: Teal Primary
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          scaffoldBackgroundColor: Colors.teal.shade50,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
          // Design Constraint: Orange Accents
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
            accentColor: Colors.orange,
          ),
          useMaterial3:
              false, // Keeping it standard Material 2 for consistent colors
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
