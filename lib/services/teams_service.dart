import 'package:firebase_database/firebase_database.dart';

class TeamsService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // 获取所有球队
  Future<List<Map<String, dynamic>>> getAllTeams() async {
    try {
      final snapshot = await _database.child('teams').get();
      List<Map<String, dynamic>> teams = [];

      if (snapshot.exists) {
        // 将 snapshot.value 转换为 List
        List<dynamic> values = snapshot.value as List<dynamic>;

        // 遍历列表，将每个非空的项添加到结果中
        for (var i = 0; i < values.length; i++) {
          if (values[i] != null) {
            teams.add(Map<String, dynamic>.from(values[i] as Map));
          }
        }
      }
      return teams;
    } catch (e) {
      print('Error getting teams: $e');
      return [];
    }
  }

// 按分区查询球队
  Future<List<Map<String, dynamic>>> getTeamsByDivision(String division) async {
    try {
      final snapshot = await _database.child('teams').get();
      List<Map<String, dynamic>> teams = [];

      if (snapshot.exists) {
        List<dynamic> values = snapshot.value as List<dynamic>;

        for (var i = 0; i < values.length; i++) {
          if (values[i] != null && values[i]['division'] == division) {
            teams.add(Map<String, dynamic>.from(values[i] as Map));
          }
        }
      }
      return teams;
    } catch (e) {
      print('Error getting teams by division: $e');
      return [];
    }
  }

  // 按联盟查询球队
  Future<List<Map<String, dynamic>>> getTeamsByConference(
      String conference) async {
    final snapshot = await _database
        .child('teams')
        .orderByChild('conference')
        .equalTo(conference)
        .get();

    List<Map<String, dynamic>> teams = [];
    if (snapshot.exists) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        teams.add(Map<String, dynamic>.from(value as Map));
      });
    }
    return teams;
  }

  // 按城市查询球队
  Future<List<Map<String, dynamic>>> getTeamsByCity(String city) async {
    final snapshot =
        await _database.child('teams').orderByChild('city').equalTo(city).get();

    List<Map<String, dynamic>> teams = [];
    if (snapshot.exists) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        teams.add(Map<String, dynamic>.from(value as Map));
      });
    }
    return teams;
  }
}
