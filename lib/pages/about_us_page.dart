import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '关于我们',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/ic_apple.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Firebase商城',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            _buildInfoSection(
              context,
              [
                _buildInfoItem('官方网站', 'https://example.com'),
                _buildInfoItem('联系我们', 'contact@example.com'),
                _buildInfoItem('服务条款', '点击查看详情'),
                _buildInfoItem('隐私政策', '点击查看详情'),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              '© 2024 Firebase商城 版权所有',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildInfoItem(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: () {
        // TODO: 实现相应功能
      },
    );
  }
}
