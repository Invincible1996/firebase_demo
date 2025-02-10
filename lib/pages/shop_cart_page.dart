import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class ShopCartPage extends StatefulWidget {
  const ShopCartPage({super.key});

  @override
  State<ShopCartPage> createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'iPhone 16',
      'price': 8999,
      'image': 'assets/images/img_iphone16.png',
      'count': 1,
      'isSelected': true,
    },
    {
      'name': 'AirPods Pro',
      'price': 1999,
      'image': 'assets/images/ic_airpods_pro.jpeg',
      'count': 2,
      'isSelected': true,
    },
  ];

  bool _isAllSelected = true;

  double get _totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      if (item['isSelected']) {
        total += item['price'] * item['count'];
      }
    }
    return total;
  }

  void _toggleSelectAll() {
    setState(() {
      _isAllSelected = !_isAllSelected;
      for (var item in _cartItems) {
        item['isSelected'] = _isAllSelected;
      }
    });
  }

  void _toggleSelectItem(int index) {
    setState(() {
      _cartItems[index]['isSelected'] = !_cartItems[index]['isSelected'];
      _isAllSelected = _cartItems.every((item) => item['isSelected']);
    });
  }

  void _updateItemCount(int index, bool increase) {
    setState(() {
      if (increase) {
        _cartItems[index]['count']++;
      } else if (_cartItems[index]['count'] > 1) {
        _cartItems[index]['count']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '购物车',
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Checkbox(
                          value: item['isSelected'],
                          onChanged: (_) => _toggleSelectItem(index),
                        ),
                        Image.asset(
                          item['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '¥${item['price']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFB52C20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _updateItemCount(index, false),
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text(
                              '${item['count']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () => _updateItemCount(index, true),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, -2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isAllSelected,
                      onChanged: (_) => _toggleSelectAll(),
                    ),
                    const Text('全选'),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '合计: ¥${_totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFB52C20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '已选${_cartItems.where((item) => item['isSelected']).length}件商品',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 实现结算功能
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('结算功能开发中...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB52C20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('结算'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
