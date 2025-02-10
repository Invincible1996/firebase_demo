import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class HelpFeedbackPage extends StatefulWidget {
  const HelpFeedbackPage({super.key});

  @override
  State<HelpFeedbackPage> createState() => _HelpFeedbackPageState();
}

class _HelpFeedbackPageState extends State<HelpFeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  final List<String> _faqList = [
    '如何修改用户名？',
    '如何设置消息通知？',
    '如何保护账号安全？',
    '如何联系客服？',
    '如何删除账号？',
  ];

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '帮助与反馈',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 常见问题部分
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '常见问题',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqList.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_faqList[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: 实现常见问题详情页面导航
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // 问题反馈部分
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '问题反馈',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _feedbackController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: '请详细描述您遇到的问题或建议...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_feedbackController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('请输入反馈内容')),
                          );
                          return;
                        }
                        // TODO: 实现反馈提交逻辑
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('感谢您的反馈，我们会尽快处理')),
                        );
                        _feedbackController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        '提交反馈',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 联系方式部分
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '联系我们',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text('客服电话：400-123-4567'),
                  const Text('服务时间：周一至周日 9:00-18:00'),
                  const Text('电子邮箱：support@example.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
