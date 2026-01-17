import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item.dart';

class ItemService {
  static const String _storageKey = 'items';

  Future<List<Item>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? itemsJson = prefs.getString(_storageKey);

    if (itemsJson == null) {
      return [];
    }

    final List<dynamic> decoded = json.decode(itemsJson);
    return decoded.map((item) => Item.fromJson(item)).toList();
  }

  Future<void> saveItems(List<Item> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> addItem(Item item) async {
    final items = await getItems();
    items.add(item);
    await saveItems(items);
  }

  Future<void> updateItem(Item updatedItem) async {
    final items = await getItems();
    final index = items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      items[index] = updatedItem;
      await saveItems(items);
    }
  }

  Future<void> deleteItem(String id) async {
    final items = await getItems();
    items.removeWhere((item) => item.id == id);
    await saveItems(items);
  }
}
