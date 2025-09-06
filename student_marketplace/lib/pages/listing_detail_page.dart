import 'package:flutter/material.dart';
import '../models/listing.dart';

class ListingDetailPage extends StatelessWidget {
  final Listing listing;
  const ListingDetailPage({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(listing.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: 320,
                  color: theme.colorScheme.primaryContainer,
                  child: const Center(child: Icon(Icons.image, size: 72)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listing.title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text('${listing.school} • ${listing.grade} • ${listing.subject} • ${listing.type}', style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 16),
                  Text('${listing.priceJd.toStringAsFixed(0)} JD', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text(listing.description),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline),
                        label: const Text('Contact Seller'),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Back'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

