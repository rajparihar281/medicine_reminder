import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/medicine.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';

class MedicineProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  final NotificationService _notificationService = NotificationService();
  List<Medicine> _medicines = [];

  List<Medicine> get medicines => _medicines;

  MedicineProvider() {
    _loadMedicines();
  }

  void _loadMedicines() {
    _medicines = _storageService.getMedicines();
    _sortMedicines();
    notifyListeners();
  }

  void _sortMedicines() {
    // Sort logic: Earliest time first
    _medicines.sort((a, b) {
      final aTime = a.scheduledTime.hour * 60 + a.scheduledTime.minute;
      final bTime = b.scheduledTime.hour * 60 + b.scheduledTime.minute;
      return aTime.compareTo(bTime);
    });
  }

  Future<void> addMedicine(String name, String dosage, DateTime time) async {
    final id = const Uuid().v4();
    final newMedicine = Medicine(
      id: id,
      name: name,
      dosage: dosage,
      scheduledTime: time,
    );

    // 1. Save to DB
    await _storageService.addMedicine(newMedicine);

    // 2. Schedule Notification (Using hashcode of ID as unique int ID)
    await _notificationService.scheduleNotification(
      id: newMedicine.id.hashCode,
      title: "Time for your medicine!",
      body: "Take $name ($dosage)",
      scheduledTime: time,
    );

    // 3. Update State
    _loadMedicines();
  }

  Future<void> removeMedicine(String id) async {
    await _notificationService.cancelNotification(id.hashCode);
    await _storageService.deleteMedicine(id);
    _loadMedicines();
  }
}
