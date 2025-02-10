import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _allowLocationServices = true;
  bool _allowPushNotifications = true;
  bool _allowDataCollection = true;
  bool _showOnlineStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '隐私设置',
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildSwitchTile(
                  '位置服务',
                  '允许访问您的位置信息',
                  _allowLocationServices,
                  (value) => setState(() => _allowLocationServices = value),
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  '推送通知',
                  '接收应用推送通知',
                  _allowPushNotifications,
                  (value) => setState(() => _allowPushNotifications = value),
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  '数据收集',
                  '允许收集使用数据以改进服务',
                  _allowDataCollection,
                  (value) => setState(() => _allowDataCollection = value),
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  '在线状态',
                  '显示您的在线状态',
                  _showOnlineStatus,
                  (value) => setState(() => _showOnlineStatus = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // 隐私协议链接
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildLinkTile('隐私政策'),
                const Divider(height: 1),
                _buildLinkTile('用户协议'),
                const Divider(height: 1),
                _buildLinkTile('个人信息收集清单'),
                const Divider(height: 1),
                _buildLinkTile('第三方信息共享清单'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '我们重视并保护您的隐私。您可以随时更改这些设置。',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildLinkTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // TODO: 实现隐私政策等文档的查看功能
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('正在查看$title')),
        );
      },
    );
  }
}
