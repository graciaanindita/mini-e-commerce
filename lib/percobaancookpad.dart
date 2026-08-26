import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Cookpad_logo.svg/3840px-Cookpad_logo.svg.png?utm_source=id.wikipedia.org&utm_campaign=index&utm_content=thumbnail',
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        CircleAvatar(
                         backgroundImage: NetworkImage('https://i.pinimg.com/1200x/45/20/14/452014bd5e599f98bba24f4d491b099b.jpg'),// Ganti dengan URL gambar profil yang sesuai
                          radius: 15,
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon( 
                            Icons.notifications_none_rounded,
                            color: Colors.black87,
                            size: 22,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_sharp, color: Colors.grey[600], size: 22),
                    const SizedBox(width: 10), // Memberikan jarak antara ikon dan TextField
                    const Expanded(
                      child: TextField( // Menggunakan TextField untuk input teks
                        decoration: InputDecoration(
                          hintText: 'Ketik buah...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 17),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://i.pinimg.com/1200x/94/29/a6/9429a69e253dba3eb66662e3aa96440d.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 7),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Pencarian Populer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 100 / 55,
                children: [
                  _buildRecipeItem(
                    'Pisang',
                    'https://i.pinimg.com/1200x/a1/d4/dd/a1d4ddfae6dc565b4803e1e4469e1159.jpg',
                  ),
                  _buildRecipeItem(
                    'Apel',
                    'https://i.pinimg.com/1200x/33/a1/58/33a158aca937ec804b8871264a610a36.jpg',
                  ), 
                  _buildRecipeItem(
                    'Kiwi',
                    'https://i.pinimg.com/736x/15/61/12/15611267e36aa37227ae80a20de847f4.jpg',
                  ),
                  _buildRecipeItem(
                    'Lemon',
                    'https://i.pinimg.com/736x/05/2f/b9/052fb9bbd53f35befdae819ae842b423.jpg',
                  ),
                  _buildRecipeItem(
                    'Jeruk',
                    'https://i.pinimg.com/736x/5b/93/2d/5b932d70b2bf302ee75885946ce6fe8f.jpg',
                  ),
                  _buildRecipeItem(
                    'Anggur',
                    'https://i.pinimg.com/736x/6a/c8/18/6ac818b8a64ae377412a3ab31659e14e.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeItem(String title, String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, //
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              title.toLowerCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}