import 'package:flutter/material.dart';
import '../models/listing.dart';
import 'listing_detail_page.dart';
import 'create_listing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedSchool;
  String? selectedGrade;
  String? selectedSubject;
  String? selectedType;

  final List<String> schools = <String>[
    'All Schools',
    'Amman Baccalaureate School',
    'International Academy Amman',
    'King’s Academy',
    'University of Jordan',
    'German Jordanian University',
    'Yarmouk University',
  ];

  final List<String> grades = <String>[
    'All Grades',
    'Grade 7',
    'Grade 8',
    'Grade 9',
    'Grade 10',
    'Grade 11',
    'Grade 12',
    'Undergraduate',
    'Graduate',
  ];

  final List<String> subjects = <String>[
    'All Subjects',
    'Math',
    'Physics',
    'Chemistry',
    'Biology',
    'English',
    'Arabic',
    'Computer Science',
    'Engineering',
    'Business',
  ];

  final List<String> types = <String>[
    'All Types',
    'Books',
    'Notes',
    'Tutoring',
    'Stationery',
    'Electronics',
  ];

  @override
  void initState() {
    super.initState();
    selectedSchool = schools.first;
    selectedGrade = grades.first;
    selectedSubject = subjects.first;
    selectedType = types.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Marketplace'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                final created = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CreateListingPage()),
                );
                if (created == true) {
                  setState(() {});
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('List a Product (1 JD)'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilters(context),
            const SizedBox(height: 16),
            Expanded(child: _buildListingsGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          runSpacing: 12,
          spacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _dropdown(
              label: 'School/University',
              value: selectedSchool,
              options: schools,
              onChanged: (v) => setState(() => selectedSchool = v),
            ),
            _dropdown(
              label: 'Grade/Level',
              value: selectedGrade,
              options: grades,
              onChanged: (v) => setState(() => selectedGrade = v),
            ),
            _dropdown(
              label: 'Subject',
              value: selectedSubject,
              options: subjects,
              onChanged: (v) => setState(() => selectedSubject = v),
            ),
            _dropdown(
              label: 'Type',
              value: selectedType,
              options: types,
              onChanged: (v) => setState(() => selectedType = v),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedSchool = schools.first;
                  selectedGrade = grades.first;
                  selectedSubject = subjects.first;
                  selectedType = types.first;
                });
              },
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }

  List<Listing> _filteredListings() {
    return SampleData.listings.where((listing) {
      final bool schoolOk = selectedSchool == null || selectedSchool == 'All Schools' || listing.school == selectedSchool;
      final bool gradeOk = selectedGrade == null || selectedGrade == 'All Grades' || listing.grade == selectedGrade;
      final bool subjectOk = selectedSubject == null || selectedSubject == 'All Subjects' || listing.subject == selectedSubject;
      final bool typeOk = selectedType == null || selectedType == 'All Types' || listing.type == selectedType;
      return schoolOk && gradeOk && subjectOk && typeOk;
    }).toList();
  }

  Widget _buildListingsGrid(BuildContext context) {
    final theme = Theme.of(context);
    final items = _filteredListings();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3 / 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final listing = items[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ListingDetailPage(listing: listing)),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  color: theme.colorScheme.primaryContainer,
                  child: const Icon(Icons.menu_book, size: 48),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listing.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 6),
                      Text('${listing.school} • ${listing.subject}', style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 6),
                      Text('${listing.priceJd.toStringAsFixed(0)} JD', style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return SizedBox(
      width: 240,
      child: DropdownButtonFormField<String>(
        value: value,
        items: options
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

