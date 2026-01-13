import 'package:hive/hive.dart';

part 'medicine.g.dart'; // This will be generated

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String dosage;

  @HiveField(3)
  final DateTime scheduledTime;

  Medicine({
    required this.id,
    required this.name,
    required this.dosage,
    required this.scheduledTime,
  });
} 