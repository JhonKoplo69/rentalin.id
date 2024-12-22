import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../views/connection_view.dart';

class ConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final isConnected = false.obs; // Variabel untuk menyimpan status koneksi
  String? lastRoute;

 
  @override
  void onInit() {
    super.onInit();
   _connectivity.onConnectivityChanged.listen((connectivityResult) {
  if (connectivityResult.contains(ConnectivityResult.none)) {
  } else {
    _checkInitialConnectionStatus();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //       content: Text('Data sedang diupload ke Firebase Firestore!')),
    // );
  }
});
  Future<void> _checkInitialConnectionStatus() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      _showConnectionSnackbar(false);
      
    } else {
      isConnected.value = true;
      _showConnectionSnackbar(true);
    }
  }

  void _showConnectionSnackbar(bool connected) {
    if (connected) {
      Get.snackbar(
        'Koneksi Stabil',
        'Aplikasi terhubung ke internet.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Koneksi Terputus',
        'Aplikasi tidak terhubung ke internet.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
}