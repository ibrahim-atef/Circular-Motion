import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DiseasesScreen(),
    );
  }
}

// شاشة الأمراض
class DiseasesScreen extends StatelessWidget {
  // قائمة الأمراض مع الأدوية الخاصة بها
  final Map<String, List<String>> medicines = {
    'نزلة برد': ['باراسيتامول (Panadol)', 'سيتريزين (Zyrtec)', 'شراب أكتيفيد (Actifed Syrup)'],
    'التهاب الحلق': ['أموكسيسيلين (Amoxicillin)', 'شراب ستربسلز (Strepsils Syrup)', 'بخاخ تانتم فيردي (Tantum Verde)'],
    'الربو': ['بخاخ فينتولين (Ventolin Inhaler)', 'أقراص مونتيلوكاست (Montelukast)', 'بخاخ سيريتايد (Seretide)'],
    'التهاب الأذن': ['قطرة أوتوكالم (Otocomb Drops)', 'أموكسيسيلين (Amoxicillin)', 'قطرة كانديبيوتيك (Candibiotic)'],
    'الصداع النصفي': ['مسكن باراسيتامول (Panadol)', 'مسكن إيبوبروفين (Ibuprofen)', 'سوماتريبتان (Sumatriptan)'],
  };

  @override
  Widget build(BuildContext context) {
    // استخراج أسماء الأمراض من المفاتيح في الخريطة
    final List<String> diseases = medicines.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('الأمراض المتاحة'),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(diseases[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicinesScreen(
                    disease: diseases[index],
                    medicines: medicines,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// شاشة الأدوية
class MedicinesScreen extends StatelessWidget {
  final String disease;
  final Map<String, List<String>> medicines;

  MedicinesScreen({required this.disease, required this.medicines});

  @override
  Widget build(BuildContext context) {
    final List<String> medicinesForDisease = medicines[disease] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('الأدوية لـ $disease'),
      ),
      body: ListView.builder(
        itemCount: medicinesForDisease.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicinesForDisease[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrescriptionScreen(
                    disease: disease,
                    medicine: medicinesForDisease[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// شاشة الروشتة
class PrescriptionScreen extends StatelessWidget {
  final String disease;
  final String medicine;

  PrescriptionScreen({required this.disease, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('روشتة العلاج'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المرض: $disease',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'الدواء: $medicine',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'تعليمات الطبيب:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. تناول الدواء بعد الأكل.\n'
                  '2. الالتزام بالجرعة المحددة.\n'
                  '3. استشارة الطبيب عند حدوث أي أعراض جانبية.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
