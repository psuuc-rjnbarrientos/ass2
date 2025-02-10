import 'package:barrientos_assignment2/item.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingListAppHomeScreen(),
    );
  }
}

class ShoppingListAppHomeScreen extends StatefulWidget {
  const ShoppingListAppHomeScreen({super.key});

  @override
  State<ShoppingListAppHomeScreen> createState() =>
      _ShoppingListAppHomeScreenState();
}

class _ShoppingListAppHomeScreenState extends State<ShoppingListAppHomeScreen> {
  late TextEditingController itemCtrl = TextEditingController();
  late Realm realm;
  late RealmResults<Item> itemResults;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    realm = Realm(Configuration.local([Item.schema]));
    loadItems();
  }

  void loadItems() {
    itemResults = realm.all<Item>();
    setState(() {});
  }

  void addItem() {
    realm.write(() {
      realm.add(Item(itemCtrl.text));
    });
    itemCtrl.clear();

    loadItems();
  }

  void deleteCheckedItems() {
    realm.write(() {
      final checkedItems = itemResults.where((item) => item.isChecked).toList();
      realm.deleteMany(checkedItems);
    });

    loadItems();
  }

  void itemCheckUncheck() {
    bool allChecked = itemResults.every((item) => item.isChecked);

    realm.write(() {
      for (var item in itemResults) {
        item.isChecked = !allChecked;
      }

      loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.check_circle_outlined),
          onPressed: itemCheckUncheck,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services_rounded),
            onPressed: deleteCheckedItems,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: TextField(
                  controller: itemCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item',
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: addItem,
                    child: const Text('Add'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemResults.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = itemResults[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.itemName),
                      trailing: Checkbox(
                        value: item.isChecked,
                        onChanged: (value) {
                          realm.write(() {
                            item.isChecked = value ?? false;
                          });
                          loadItems();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
