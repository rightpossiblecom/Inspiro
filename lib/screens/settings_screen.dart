import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(color: themeProvider.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.textColor),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: themeProvider.currentGradient),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.info_outline, color: themeProvider.textColor),
              title: Text(
                'About',
                style: TextStyle(color: themeProvider.textColor),
              ),
              subtitle: Text(
                'Inspiro provides short motivational quotes for daily inspiration.',
                style: TextStyle(color: themeProvider.secondaryTextColor),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: themeProvider.textColor,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: themeProvider.textColor),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: themeProvider.secondaryTextColor,
              ),
              onTap: () {
                // TODO: Replace with actual privacy policy URL when available
                // _launchUrl('https://example.com/privacy');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy Policy coming soon!')),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: themeProvider.textColor,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(color: themeProvider.textColor),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: themeProvider.secondaryTextColor,
              ),
              onTap: () {
                // _launchUrl('mailto:support@inspiro.com');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contact support: support@inspiro.com'),
                  ),
                );
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(color: themeProvider.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
