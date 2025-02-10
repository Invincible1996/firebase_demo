import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '消息通知',
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFB52C20),
              child: Icon(Icons.notifications, color: Colors.white, size: 20),
            ),
            title: Text('系统通知 ${index + 1}'),
            subtitle: Text('这是第 ${index + 1} 条系统通知的内容说明'),
            trailing: Text(
              '${DateTime.now().subtract(Duration(days: index)).month}月${DateTime.now().subtract(Duration(days: index)).day}日',
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
