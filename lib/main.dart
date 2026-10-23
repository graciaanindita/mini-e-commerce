import 'package:flutter/material.dart';
import 'package:flutter_application_1/layouting_dasar.dart';

void main() {  
  runApp(const LayoutingDasar());
}   

class MyApp extends StatelessWidget {
  const MyApp({super.key});  

  @override  
  Widget build(BuildContext context) {    
    return const MaterialApp(       
      title: 'Latihan Dart', 
      home: DartDemoPage(), 
    ); 
  } 
}   

class DartDemoPage extends StatefulWidget {  
  const DartDemoPage({super.key});  

  @override  
  State<DartDemoPage> createState() => _DartDemoPageState();
}   

class _DartDemoPageState extends State<DartDemoPage> {  
  int angka = 16; 
  String? hasilData;  
  String? namaLengkap = "Gracia Anindita";   
  bool sedangMemuat = false;
    
  String cekGanjilGenap(int nilai) {
    switch (nilai % 2) {
      case 0:
        return "Genap";
      case 1:
        return "Ganjil";
      default:
        return "Tidak diketahui";
    }
  }

  Future<void> ambilDataAsync() async {
    setState(() {
      sedangMemuat = true;
    });

    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      hasilData = "Data berhasil dimuat!";
      sedangMemuat = false;
    });
  }

  @override  
  Widget build(BuildContext context) { 
    return Scaffold(   
      appBar: AppBar(title: const Text('Latihan Dasar Dart')),     
      body: Center(       
        child: Column(       
          mainAxisAlignment: MainAxisAlignment.center,       
          children: [
            Text(
              'Angka $angka adalah ${cekGanjilGenap(angka)}',
            ),

            Text(
              'Nama Lengkap: ${namaLengkap ?? "Belum diisi"}',
            ),

            const SizedBox(height: 20),

            sedangMemuat
                ? const CircularProgressIndicator()
                : Text(hasilData ?? 'Data belum dimuat'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: sedangMemuat ? null : ambilDataAsync,
              child: const Text('Ambil Data'),
            ),
          ],
        ),
      ),
    );
  }
}