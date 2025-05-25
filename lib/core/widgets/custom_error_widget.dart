import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errMassage,
    this.onRetry, // Callback function for retry
  });

  final String errMassage;
  final VoidCallback? onRetry; // Optional callback for retry

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: AppSize.s40,
          ),
          SizedBox(height: AppSize.s10),
          Text(
            errMassage,
            style: TextStyle(color: Colors.red, fontSize: AppSize.s18),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            SizedBox(height: AppSize.s20),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
