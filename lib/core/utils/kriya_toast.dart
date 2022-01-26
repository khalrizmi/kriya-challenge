import 'package:fluttertoast/fluttertoast.dart';
import 'package:kriya_test/ui/shared/shared_color.dart';

class KriyaToast {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
