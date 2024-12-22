import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class RentController extends GetxController {
  

  //TODO: Implement RentController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var latitude = ''.obs;
  var longitude = ''.obs;
  var address = ''.obs;

  // Fungsi untuk mendapatkan lokasi
  Future<void> getLocation() async {
    try {
      // Periksa izin lokasi
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          "Error",
          "Location services are disabled.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            "Error",
            "Location permissions are denied.",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          "Error",
          "Location permissions are permanently denied.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Ambil lokasi saat ini
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();

      // Ambil alamat berdasarkan koordinat
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        address.value =
            '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to get location: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  

  void increment() => count.value++;
}