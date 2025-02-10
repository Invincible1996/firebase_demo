import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/app_router.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  Widget _buildSettingItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // 顶部背景
                ClipPath(
                  clipper: _CustomClipper(),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFB52C20), Color(0xFFD64C42)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ),
                // 用户信息卡片
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFB52C20),
                                    width: 2,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Color(0xFFF5F5F5),
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Color(0xFFB52C20),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '用户',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'ID: 123456',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFB52C20)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        '普通会员',
                                        style: TextStyle(
                                          color: Color(0xFFB52C20),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            _buildSettingItem(
                              title: '账号设置',
                              icon: Icons.settings,
                              onTap: () => context.router.push(const AccountSettingsRoute()),
                            ),
                            const Divider(height: 1),
                            _buildSettingItem(
                              title: '消息通知',
                              icon: Icons.notifications,
                              onTap: () => context.router.pushNamed('/notification'),
                            ),
                            const Divider(height: 1),
                            _buildSettingItem(
                              title: '隐私设置',
                              icon: Icons.security,
                              onTap: () => context.router.pushNamed('/privacy-settings'),
                            ),
                            const Divider(height: 1),
                            _buildSettingItem(
                              title: '帮助与反馈',
                              icon: Icons.help,
                              onTap: () => context.router.pushNamed('/help-feedback'),
                            ),
                            const Divider(height: 1),
                            _buildSettingItem(
                              title: '关于我们',
                              icon: Icons.info,
                              subtitle: 'Version 1.0.0',
                              onTap: () => context.router.pushNamed('/about-us'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height - 50);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
