import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/motorcycle.dart';

class UpdateMotorcycleController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var motorcycle = Motorcycle(
    merkMotor: '',
    motorName: '',
    typeMotor: '',
    platMotor: '',
    pricePerDay: 0.0,
    isRecommended: false,
  ).obs;

  void updateMotorcycle(Motorcycle updatedMotorcycle) async {
    try {
      if (updatedMotorcycle.id == null) {
        Get.snackbar('Error', 'Document ID tidak tersedia');
        return;
      }

      await _firestore
          .collection("Manage MotorCycle")
          .doc(updatedMotorcycle.id)
          .update({
        'Merk Motor': updatedMotorcycle.merkMotor,
        'Motor Name': updatedMotorcycle.motorName,
        'Plat Motor': updatedMotorcycle.platMotor,
        'Price/Day': updatedMotorcycle.pricePerDay,
        'Recommendation': updatedMotorcycle.isRecommended,
        'Type Motor': updatedMotorcycle.typeMotor
      });

      Get.snackbar('Sukses', 'Data berhasil diupdate');
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate data: $e');
    }
  }

  void clearInputs() {
    motorcycle.value = Motorcycle(
      merkMotor: '',
      motorName: '',
      typeMotor: '',
      platMotor: '',
      pricePerDay: 0.0,
      isRecommended: false,
    );
  }
}