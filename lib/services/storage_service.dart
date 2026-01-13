import 'package:hive_flutter/hive_flutter.dart';
import '../models/medicine.dart';

class StorageService {
  static const String boxName = 'medicine_box';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MedicineAdapter());
    await Hive.openBox<Medicine>(boxName);
  }

  Box<Medicine> getBox() {
    return Hive.box<Medicine>(boxName);
  }

  Future<void> addMedicine(Medicine medicine) async {
    final box = getBox();
    await box.put(medicine.id, medicine);
  }

  Future<void> deleteMedicine(String id) async {
    final box = getBox();
    await box.delete(id);
  }

  List<Medicine> getMedicines() {
    final box = getBox();
    return box.values.toList();
  }
}
