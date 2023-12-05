import 'package:shared_preferences/shared_preferences.dart';

class DataRepository {
  static Future<void> storeSuccessCount(int count) async {
    int? existingCount = await getSuccessCount();
    print("existing count === ${existingCount}");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("count", existingCount! + count);
  }

  static Future<int?> getSuccessCount() async {
    int? value;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getInt("count");
    if (value == null) {
      return 0;
    } else {
      return value;
    }
  }
}
