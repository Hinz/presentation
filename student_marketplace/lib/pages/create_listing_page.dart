import 'package:flutter/material.dart';
import '../models/listing.dart';

class CreateListingPage extends StatefulWidget {
  const CreateListingPage({super.key});

  @override
  State<CreateListingPage> createState() => _CreateListingPageState();
}

class _CreateListingPageState extends State<CreateListingPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  String school = 'University of Jordan';
  String grade = 'Undergraduate';
  String subject = 'Math';
  String type = 'Books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List a Product (1 JD)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(labelText: 'Title'),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _descriptionController,
                          minLines: 4,
                          maxLines: 6,
                          decoration: const InputDecoration(labelText: 'Description'),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Price (JD)'),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Required';
                            final d = double.tryParse(v);
                            if (d == null || d <= 0) return 'Enter a valid price';
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: school,
                          items: const [
                            'Amman Baccalaureate School',
                            'International Academy Amman',
                            'King’s Academy',
                            'University of Jordan',
                            'German Jordanian University',
                            'Yarmouk University',
                          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => school = v ?? school),
                          decoration: const InputDecoration(labelText: 'School/University'),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: grade,
                          items: const [
                            'Grade 7', 'Grade 8', 'Grade 9', 'Grade 10', 'Grade 11', 'Grade 12', 'Undergraduate', 'Graduate'
                          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => grade = v ?? grade),
                          decoration: const InputDecoration(labelText: 'Grade/Level'),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: subject,
                          items: const [
                            'Math','Physics','Chemistry','Biology','English','Arabic','Computer Science','Engineering','Business'
                          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => subject = v ?? subject),
                          decoration: const InputDecoration(labelText: 'Subject'),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: type,
                          items: const ['Books','Notes','Tutoring','Stationery','Electronics']
                              .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => type = v ?? type),
                          decoration: const InputDecoration(labelText: 'Type'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      // Placeholder payment step: charge 1 JD per listing
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Pay Listing Fee'),
                          content: const Text('A 1 JD fee is required to list this item.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                SampleData.listings.add(Listing(
                                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                                  title: _titleController.text.trim(),
                                  description: _descriptionController.text.trim(),
                                  school: school,
                                  grade: grade,
                                  subject: subject,
                                  type: type,
                                  priceJd: double.parse(_priceController.text.trim()),
                                ));
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Pay 1 JD & Publish'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Publish Listing'),
                  ),
                  const SizedBox(width: 12),
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

