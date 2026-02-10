import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';
import '../providers/favorites_provider.dart';
import '../providers/theme_provider.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote _currentQuote;

  @override
  void initState() {
    super.initState();
    _currentQuote = QuoteService.getRandomQuote();
  }

  void _generateNewQuote() {
    setState(() {
      _currentQuote = QuoteService.getRandomQuote();
    });
  }

  void _shareQuote() {
    Share.share(
      '"${_currentQuote.text}" - ${_currentQuote.author}\n\nSent from Inspiro',
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Inspiro',
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(color: themeProvider.textColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.textColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette_outlined),
            onPressed: () {
              themeProvider.nextTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: themeProvider.currentGradient),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Quote Card with Animation
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.05),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: KeyedSubtree(
                  key: ValueKey<String>(_currentQuote.text),
                  child: Column(
                    children: [
                      Text(
                        '"${_currentQuote.text}"',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeProvider.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "- ${_currentQuote.author}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: themeProvider.secondaryTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 3),

              // Interaction Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    onPressed: _shareQuote,
                    icon: const Icon(Icons.share),
                    iconSize: 28,
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Consumer<FavoritesProvider>(
                    builder: (context, favoritesProvider, child) {
                      final isFav = favoritesProvider.isFavorite(_currentQuote);
                      return IconButton.filled(
                        onPressed: () {
                          favoritesProvider.toggleFavorite(_currentQuote);
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : null,
                        ),
                        iconSize: 28,
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: isFav ? Colors.white : null,
                          foregroundColor: isFav ? Colors.red : null,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _generateNewQuote,
                  child: const Text("Inspire Me"),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
