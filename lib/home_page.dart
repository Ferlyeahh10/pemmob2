import 'package:flutter/material.dart';
import 'models/item.dart';
import 'services/item_service.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final Function? onAddItem;

  const HomePage({super.key, this.onAddItem});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];
  bool _isLoading = true;

  // Icon categories dengan emoji
  final Map<String, List<Map<String, String>>> iconCategories = {
    'Food': [
      {'emoji': '🍕', 'label': 'Pizza'},
      {'emoji': '🍰', 'label': 'Cake'},
      {'emoji': '☕', 'label': 'Coffee'},
      {'emoji': '🍜', 'label': 'Noodles'},
      {'emoji': '🍦', 'label': 'Ice Cream'},
      {'emoji': '🍫', 'label': 'Chocolate'},
    ],
    'Friends': [
      {'emoji': '👥', 'label': 'Friends'},
      {'emoji': '💑', 'label': 'Partner'},
      {'emoji': '👨‍👩‍👧‍👦', 'label': 'Family'},
      {'emoji': '🤝', 'label': 'Meeting'},
      {'emoji': '💝', 'label': 'Gift'},
      {'emoji': '🎉', 'label': 'Party'},
    ],
    'Hobbies': [
      {'emoji': '📚', 'label': 'Reading'},
      {'emoji': '🎮', 'label': 'Gaming'},
      {'emoji': '🎵', 'label': 'Music'},
      {'emoji': '🎨', 'label': 'Art'},
      {'emoji': '📸', 'label': 'Photo'},
      {'emoji': '✍️', 'label': 'Writing'},
    ],
    'Nature': [
      {'emoji': '🌸', 'label': 'Flowers'},
      {'emoji': '🌈', 'label': 'Rainbow'},
      {'emoji': '☀️', 'label': 'Sunshine'},
      {'emoji': '🌙', 'label': 'Moon'},
      {'emoji': '⭐', 'label': 'Stars'},
      {'emoji': '🦋', 'label': 'Butterfly'},
    ],
    'Achievement': [
      {'emoji': '🏆', 'label': 'Trophy'},
      {'emoji': '🎓', 'label': 'Study'},
      {'emoji': '💪', 'label': 'Strength'},
      {'emoji': '✅', 'label': 'Done'},
      {'emoji': '🎯', 'label': 'Goal'},
      {'emoji': '💯', 'label': '100%'},
    ],
    'Feelings': [
      {'emoji': '💖', 'label': 'Love'},
      {'emoji': '✨', 'label': 'Sparkle'},
      {'emoji': '🌟', 'label': 'Star'},
      {'emoji': '😊', 'label': 'Happy'},
      {'emoji': '🥰', 'label': 'Love Face'},
      {'emoji': '😌', 'label': 'Peaceful'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadItems();
    if (widget.onAddItem != null) {
      widget.onAddItem!(() => _showItemDialog());
    }
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
    });

    final items = await _itemService.getItems();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    setState(() {
      _items = items;
      _isLoading = false;
    });
  }

  Map<String, List<Item>> _groupItemsByDate() {
    Map<String, List<Item>> grouped = {};

    for (var item in _items) {
      final dateKey = DateFormat('yyyy-MM-dd').format(item.createdAt);
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(item);
    }

    return grouped;
  }

  String _getDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final itemDate = DateTime(date.year, date.month, date.day);

    if (itemDate == today) {
      return 'Hari Ini 🌟';
    } else if (itemDate == yesterday) {
      return 'Kemarin 🌙';
    } else {
      return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(date);
    }
  }

  Future<void> _showItemDialog({Item? item}) async {
    final titleController = TextEditingController(text: item?.title ?? '');
    final descriptionController = TextEditingController(text: item?.description ?? '');
    String selectedIcon = item?.iconEmoji ?? '✨';

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Text(selectedIcon),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item == null ? 'Add Happiness' : 'Edit Happiness',
                  style: TextStyle(
                    color: Color(0xFFD4A574),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose an icon:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A574),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.maxFinite,
                  height: 280,
                  child: DefaultTabController(
                    length: iconCategories.length,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: Color(0xFFD4A574),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color(0xFFD4A574),
                          tabs: iconCategories.keys.map((category) {
                            return Tab(text: category);
                          }).toList(),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: iconCategories.entries.map((entry) {
                              return SingleChildScrollView(
                                padding: EdgeInsets.all(8),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: entry.value.map((icon) {
                                    final isSelected = selectedIcon == icon['emoji'];
                                    return InkWell(
                                      onTap: () {
                                        setDialogState(() {
                                          selectedIcon = icon['emoji']!;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Color(0xFFF5E6D3)
                                              : Colors.grey[100],
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: isSelected
                                                ? Color(0xFFD4A574)
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              icon['emoji']!,
                                              style: TextStyle(fontSize: 28),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              icon['label']!,
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.grey[700],
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'What made you happy?',
                    labelStyle: TextStyle(color: Color(0xFFD4A574)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD4A574), width: 2),
                    ),
                    prefixIcon: Icon(Icons.sentiment_satisfied_alt, color: Color(0xFFD4A574)),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Tell me more... (optional)',
                    labelStyle: TextStyle(color: Color(0xFFD4A574)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD4A574), width: 2),
                    ),
                    prefixIcon: Icon(Icons.edit_note, color: Color(0xFFD4A574)),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty) {
                  if (item == null) {
                    final newItem = Item(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: titleController.text,
                      description: descriptionController.text,
                      createdAt: DateTime.now(),
                      iconEmoji: selectedIcon,
                    );
                    await _itemService.addItem(newItem);
                  } else {
                    item.title = titleController.text;
                    item.description = descriptionController.text;
                    item.iconEmoji = selectedIcon;
                    await _itemService.updateItem(item);
                  }
                  Navigator.pop(context);
                  _loadItems();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD4A574),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteItem(Item item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Text('🥺'),
            SizedBox(width: 8),
            Text(
              'Delete this memory?',
              style: TextStyle(color: Color(0xFFD4A574)),
            ),
          ],
        ),
        content: Text('Are you sure you want to delete "${item.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[300],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _itemService.deleteItem(item.id);
      _loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFFD4A574)),
            SizedBox(height: 16),
            Text(
              'Loading your happiness...',
              style: TextStyle(color: Color(0xFFD4A574)),
            ),
          ],
        ),
      );
    }

    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🧸',
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(height: 16),
            Text(
              'No happiness yet!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A574),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tap the + button to add\nsomething that made you happy today',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    final groupedItems = _groupItemsByDate();
    final sortedDates = groupedItems.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final dateKey = sortedDates[index];
        final items = groupedItems[dateKey]!;
        final date = items.first.createdAt;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: Text(
                _getDateLabel(date),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A574),
                ),
              ),
            ),
            ...items.map((item) => _buildHappinessCard(item)),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildHappinessCard(Item item) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFF8F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF5E6D3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                item.iconEmoji,
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF8B6F47),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.description.isNotEmpty) ...[
                SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ],
              SizedBox(height: 8),
              Text(
                DateFormat('HH:mm').format(item.createdAt),
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFD4A574),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Color(0xFFD4A574)),
                onPressed: () => _showItemDialog(item: item),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red[300]),
                onPressed: () => _deleteItem(item),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
