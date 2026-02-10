import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  int _themeIndex = 0;
  static const String _themeKey = 'theme_index';

  int get themeIndex => _themeIndex;

  // Define gradients here for easy access
  static const List<LinearGradient> gradients = [
    // 0: Default Soft Blue-Purple
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFF8F9FE), Color(0xFFE8EAF6)],
    ),
    // 1: Sunset
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFFFECD2), Color(0xFFFCB69F)],
    ),
    // 2: Cool Mint
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFE0F7FA), Color(0xFF80DEEA)],
    ),
    // 3: Lavender Dream
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFF3E5F5), Color(0xFFCE93D8)],
    ),
    // 4: Warm Peach
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFFFF3E0), Color(0xFFFFCC80)],
    ),
    // 5: Night Mode (ish)
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF2D3142), Color(0xFF4F5D75)],
    ),
  ];

  Color get textColor =>
      _themeIndex == 5 ? Colors.white : const Color(0xFF2D3142);
  Color get secondaryTextColor =>
      _themeIndex == 5 ? Colors.white70 : const Color(0xFF9C9EAE);

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeIndex = prefs.getInt(_themeKey) ?? 0;
    notifyListeners();
  }

  Future<void> setTheme(int index) async {
    if (index >= 0 && index < gradients.length) {
      _themeIndex = index;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, _themeIndex);
      notifyListeners();
    }
  }

  void nextTheme() {
    int nextIndex = (_themeIndex + 1) % gradients.length;
    setTheme(nextIndex);
  }

  LinearGradient get currentGradient => gradients[_themeIndex];
}
