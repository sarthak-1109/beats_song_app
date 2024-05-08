import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<void> setSongAsPremium(int songId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('premium_song_$songId', true);
  }

  Future<bool> isSongPremium(int songId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('premium_song_$songId') ?? false;
  }
}
