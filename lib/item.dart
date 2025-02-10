import 'package:realm/realm.dart';

part 'item.realm.dart';

@RealmModel()
class _Item {
  late String itemName;
  bool isChecked = false;
}
