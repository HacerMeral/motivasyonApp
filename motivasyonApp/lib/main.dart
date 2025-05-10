import 'package:flutter/material.dart';
import 'dart:math'; //Rastgele sayı üretmek için gerekli. Random sınıfı burada tanımlıdır.

void main() => runApp(
  MotivasyonApp(),
); //Flutter'da uygulamayı başlatan fonksiyondur. İçine bir Widget verilir.

class MotivasyonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivasyon Sözleri',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: const Color(0xFFFFF2CC),
      ),
      home: MotivasyonSayfasi(), //home, ilk açılacak sayfayı belirtir.
      debugShowCheckedModeBanner:
          false, //Sağ üstte çıkan “DEBUG” yazısını gizlemek için.
    );
  }
}

class MotivasyonSayfasi extends StatefulWidget {
  //StatefulWidget: Ekranda değişen veri varsa (örneğin her butona basınca sözün değişmesi), bu yapı kullanılır.
  @override
  _MotivasyonSayfasiState createState() => _MotivasyonSayfasiState();
}

class _MotivasyonSayfasiState extends State<MotivasyonSayfasi> {
  final List<Map<String, String>> sozveGorsel = [
    {
      'soz': 'Bugün harika şeyler başarabilirim.',
      'gorsel': 'assets/image/1.png',
    },
    {'soz': 'Her gün daha da güçleniyorum.', 'gorsel': 'assets/image/2.png'},
    {'soz': 'Zorluklar beni büyütür.', 'gorsel': 'assets/image/3.png'},
    {
      'soz': 'Başarısızlık, başarının bir parçasıdır.',
      'gorsel': 'assets/image/4.png',
    },
    {
      'soz': 'Ben yeterliyim, güçlüyüm, değerliyim.',
      'gorsel': 'assets/image/5.png',
    },
    {'soz': 'Küçük adımlar büyük yol aldırır.', 'gorsel': 'assets/image/6.png'},
    {
      'soz': 'Pes etmiyorum çünkü değerim büyük.',
      'gorsel': 'assets/image/7.png',
    },
    {'soz': 'Hayallerime giden yoldayım.', 'gorsel': 'assets/image/8.png'},
  ];

  String seciliSoz = 'Her gün daha da güçleniyorum.';
  String seciliGorsel = 'assets/image/2.png';

  void yeniSozGetir() {
    final random = Random();
    final secilen = sozveGorsel[random.nextInt(sozveGorsel.length)];
    setState(() {
      seciliSoz = secilen['soz']!;
      seciliGorsel = secilen['gorsel']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pisienginar'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(seciliGorsel, width: 200),
              const SizedBox(height: 20),
              Text(
                seciliSoz,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 77, 46, 6),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: yeniSozGetir,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Yeni Söz Getir',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
