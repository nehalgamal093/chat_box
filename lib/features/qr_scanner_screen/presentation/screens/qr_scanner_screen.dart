import 'package:chat_box/features/user_profile/presentation/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey();
 final MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:MobileScanner(
        controller: controller,
        onDetect: (barcode) {

          final String? code = barcode.barcodes[0].rawValue;
          if (code != null) {
            controller.stop();
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserProfileScreen(id: code))
            );
          }
        },
      ),
    );
  }




}
