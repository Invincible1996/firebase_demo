import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/confirm_dialog.dart';
import '../routes/app_router.dart';

@RoutePage()
class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  // 模拟地址数据，实际项目中应该从Firebase获取
  final List<Map<String, String>> addresses = [
    {
      'name': '张三',
      'phone': '13800138000',
      'address': '广东省深圳市南山区科技园南区科技南十二路2号金蝶软件园',
      'isDefault': 'true',
    },
    {
      'name': '李四',
      'phone': '13900139000',
      'address': '广东省广州市天河区天河路208号',
      'isDefault': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '我的收货地址',
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: addresses.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address['name'] ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          address['phone'] ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => _editAddress(index),
                          child: const Icon(Icons.edit, size: 20),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => _deleteAddress(index),
                          child: const Icon(Icons.delete_outline, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      address['address'] ?? '',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    if (address['isDefault'] == 'true')
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '默认地址',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: ElevatedButton(
              onPressed: _addNewAddress,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text(
                '新增收货地址',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addNewAddress() async {
    final result = await context.router.push(
      AddShippingAddressRoute(),
    );
    if (result != null && result is Map<String, String>) {
      setState(() {
        if (result['isDefault'] == 'true') {
          for (var address in addresses) {
            address['isDefault'] = 'false';
          }
        }
        addresses.add(result);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('地址添加成功')),
        );
      }
    }
  }

  void _editAddress(int index) async {
    final address = addresses[index];
    final result = await context.router.push(
      AddShippingAddressRoute(
        name: address['name'] ?? '',
        phone: address['phone'] ?? '',
        address: address['address'] ?? '',
        isDefault: address['isDefault'] ?? 'false',
        editIndex: index.toString(),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        if (result['isDefault'] == 'true') {
          for (var address in addresses) {
            address['isDefault'] = 'false';
          }
        }
        addresses[index] = result;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('地址修改成功')),
        );
      }
    }
  }

  void _deleteAddress(int index) async {
    final bool? result = await ConfirmDialog.show<bool>(
      context: context,
      title: '删除地址',
      content: '确定要删除这个地址吗？',
      onConfirm: () => true,
      onCancel: () => false,
    );

    if (result == true) {
      setState(() {
        addresses.removeAt(index);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('地址已删除')),
        );
      }
    }
  }
}
