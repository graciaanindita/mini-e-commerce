import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashSale(),
    );
  }
}

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  int detik = 8150;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (detik > 0) {
        setState(() {
          detik--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String waktu() {
    int jam = detik ~/ 3600;
    int menit = (detik % 3600) ~/ 60;
    int det = detik % 60;

    return '${jam.toString().padLeft(2, '0')}:'
        '${menit.toString().padLeft(2, '0')}:'
        '${det.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'Flash Sale',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 5),
                      Text('(3)'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),
              const Divider(),

              // BANNER
              Container(
                height: 155,
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: Colors.amber,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'FLASH SALE 9.9',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Berakhir dalam',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            waktu(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1607083206968-13611e3d76db?w=500',
                        width: 130,
                        height: 115,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // JUDUL
              const Text(
                'Daftar Produk',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // PRODUK
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: ProductCard(
                        diskon: '10% OFF',
                        // Menggunakan gambar placeholder gadget/phone dari Unsplash yang aman agar tidak error
                        gambar: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
                        nama: 'Iphone 17 Pro',
                        hargaLama: 'Rp 15.000.000',
                        harga: 'Rp 13.500.000',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ProductCard(
                        diskon: '10% OFF',
                        gambar: 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=500',
                        nama: 'Iphone 16 plus',
                        hargaLama: 'Rp 14.000.000',
                        harga: 'Rp 12.500.000',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget terpisah untuk Kartu Produk agar tombol Like (State) bisa ditekan mandiri tiap produk
class ProductCard extends StatefulWidget {
  final String diskon;
  final String gambar;
  final String nama;
  final String hargaLama;
  final String harga;

  const ProductCard({
    super.key,
    required this.diskon,
    required this.gambar,
    required this.nama,
    required this.hargaLama,
    required this.harga,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DISKON & TOMBOL LOVE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  widget.diskon,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // GAMBAR PRODUK
          Image.network(
            widget.gambar,
            height: 110,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 8),

          // NAMA PRODUK
          Text(
            widget.nama,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),

          const SizedBox(height: 5),

          // HARGA LAMA
          Text(
            widget.hargaLama,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
            ),
          ),

          // HARGA BARU
          Text(
            widget.harga,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const Spacer(),

          // TOMBOL KERANJANG
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('+ Keranjang', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}