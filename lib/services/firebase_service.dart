import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // 1. 基本查询 - 获取特定节点的数据
  Future<DataSnapshot> getDataOnce(String path) async {
    final snapshot = await _database.child(path).get();
    return snapshot;
  }

  // 2. 实时监听数据变化
  Stream<DatabaseEvent> streamData(String path) {
    return _database.child(path).onValue;
  }

  // 3. 按条件查询
  Future<DataSnapshot> queryByChild({
    required String path,
    required String childKey,
    required dynamic value,
  }) async {
    final snapshot =
        await _database.child(path).orderByChild(childKey).equalTo(value).get();
    return snapshot;
  }

  // 4. 范围查询
  Future<DataSnapshot> queryByRange({
    required String path,
    required String childKey,
    required dynamic startAt,
    required dynamic endAt,
  }) async {
    final snapshot = await _database
        .child(path)
        .orderByChild(childKey)
        .startAt(startAt)
        .endAt(endAt)
        .get();
    return snapshot;
  }

  // 5. 限制结果数量
  Future<DataSnapshot> queryWithLimit({
    required String path,
    required int limit,
  }) async {
    final snapshot = await _database.child(path).limitToFirst(limit).get();
    return snapshot;
  }
}

// 使用示例
class ExampleUsage {
  final FirebaseService _firebaseService = FirebaseService();

  // 示例：获取用户数据
  Future<void> getUserExample() async {
    try {
      final snapshot = await _firebaseService.getDataOnce('users/123');
      if (snapshot.exists) {
        Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        print('用户名: ${userData['name']}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // 示例：实时监听数据
  void streamUserData() {
    _firebaseService.streamData('users/123').listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        Map<dynamic, dynamic> userData =
            event.snapshot.value as Map<dynamic, dynamic>;
        print('数据更新: $userData');
      }
    }, onError: (error) {
      print('Error: $error');
    });
  }

  // 示例：按年龄查询用户
  Future<void> queryUsersByAge() async {
    try {
      final snapshot = await _firebaseService.queryByChild(
        path: 'users',
        childKey: 'age',
        value: 25,
      );

      if (snapshot.exists) {
        Map<dynamic, dynamic> users = snapshot.value as Map<dynamic, dynamic>;
        users.forEach((key, value) {
          print('用户ID: $key, 数据: $value');
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
