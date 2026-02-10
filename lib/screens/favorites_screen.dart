import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../providers/favorites_provider.dart';
import '../providers/theme_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  void _shareQuote(Quote quote) {
    Share.share('"${quote.text}" - ${quote.author}\n\nSent from Inspiro');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.textColor),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: themeProvider.currentGradient),
        child: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            final favorites = favoritesProvider.favorites;

            if (favorites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: themeProvider.secondaryTextColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "No favorites yet",
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(color: themeProvider.secondaryTextColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Save quotes you love!",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final quote = favorites[index];
                return Dismissible(
                  key: Key('${quote.text}_${quote.author}'),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    favoritesProvider.removeFavorite(quote);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Removed from favorites')),
                    );
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white.withOpacity(0.9),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        '"${quote.text}"',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          color: const Color(0xFF2D3142),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "- ${quote.author}",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: const Color(0xFF9C9EAE)),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.share, color: Color(0xFF2D3142)),
                        onPressed: () => _shareQuote(quote),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
