// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Item(
    String itemName, {
    bool isChecked = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Item>({
        'isChecked': false,
      });
    }
    RealmObjectBase.set(this, 'itemName', itemName);
    RealmObjectBase.set(this, 'isChecked', isChecked);
  }

  Item._();

  @override
  String get itemName =>
      RealmObjectBase.get<String>(this, 'itemName') as String;
  @override
  set itemName(String value) => RealmObjectBase.set(this, 'itemName', value);

  @override
  bool get isChecked => RealmObjectBase.get<bool>(this, 'isChecked') as bool;
  @override
  set isChecked(bool value) => RealmObjectBase.set(this, 'isChecked', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Stream<RealmObjectChanges<Item>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Item>(this, keyPaths);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'itemName': itemName.toEJson(),
      'isChecked': isChecked.toEJson(),
    };
  }

  static EJsonValue _toEJson(Item value) => value.toEJson();
  static Item _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'itemName': EJsonValue itemName,
      } =>
        Item(
          fromEJson(itemName),
          isChecked: fromEJson(ejson['isChecked'], defaultValue: false),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Item._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('itemName', RealmPropertyType.string),
      SchemaProperty('isChecked', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
