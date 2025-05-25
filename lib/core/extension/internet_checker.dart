import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkChecker {

  /// This method checks internet connectivity before executing the provided [apiCall].
  static Future<void> checkInternetAndExecute({
    required BuildContext context,
    required Future<void> Function() apiCall,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // Show dialog or toast for no internet
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "يرجى التحقق من وجود انترنت ",
            )));
      }
    } else {
      // Execute the API call
      await apiCall();
    }
  }
}