import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _placeholderLink(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This link is a placeholder'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Union Shop',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: const Text('About Us'),
          ),
          TextButton(
            onPressed: () => _placeholderLink(context),
            child: const Text('Contact'),
          ),
          TextButton(
            onPressed: () => _placeholderLink(context),
            child: const Text('Privacy Policy'),
          ),
          TextButton(
            onPressed: () => _placeholderLink(context),
            child: const Text('Terms & Conditions'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/collections');
            },
            child: const Text('Collections'),
          ),


          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),

          const Text(
            '© University of Portsmouth Students’ Union',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}