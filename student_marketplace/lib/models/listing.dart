class Listing {
  final String id;
  final String title;
  final String description;
  final String school;
  final String grade;
  final String subject;
  final String type; // e.g., Book, Notes, Tutoring
  final double priceJd;
  final String? imageUrl;

  const Listing({
    required this.id,
    required this.title,
    required this.description,
    required this.school,
    required this.grade,
    required this.subject,
    required this.type,
    required this.priceJd,
    this.imageUrl,
  });
}

class SampleData {
  static List<Listing> listings = <Listing>[
    Listing(
      id: '1',
      title: 'Calculus Book - Like New',
      description: 'Stewart Calculus textbook, minimal highlights, great for first-year calculus.',
      school: 'University of Jordan',
      grade: 'Undergraduate',
      subject: 'Math',
      type: 'Books',
      priceJd: 15,
      imageUrl: null,
    ),
    Listing(
      id: '2',
      title: 'Physics Notes - Mechanics',
      description: 'Well-organized notes covering kinematics and dynamics with diagrams.',
      school: 'Amman Baccalaureate School',
      grade: 'Grade 11',
      subject: 'Physics',
      type: 'Notes',
      priceJd: 5,
      imageUrl: null,
    ),
    Listing(
      id: '3',
      title: 'Intro to Programming Tutoring',
      description: 'One-on-one sessions in Dart/Python for beginners. Online or in-person.',
      school: 'German Jordanian University',
      grade: 'Undergraduate',
      subject: 'Computer Science',
      type: 'Tutoring',
      priceJd: 10,
      imageUrl: null,
    ),
    Listing(
      id: '4',
      title: 'Graphing Calculator',
      description: 'Casio fx-991EX ClassWiz, perfect condition.',
      school: 'International Academy Amman',
      grade: 'Grade 12',
      subject: 'Math',
      type: 'Electronics',
      priceJd: 20,
      imageUrl: null,
    ),
  ];
}

