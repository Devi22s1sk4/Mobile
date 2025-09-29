import 'package:flutter/material.dart';

void main() {
  runApp(const FilmMockupApp());
}

class FilmMockupApp extends StatelessWidget {
  const FilmMockupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Rekomendasi Mockup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const FilmMockupScreen(),
    );
  }
}

class FilmMockupScreen extends StatelessWidget {
  const FilmMockupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Wireframe Film Rekomendasi",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // GridView: daftar halaman
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 900) crossAxisCount = 3;
              if (constraints.maxWidth < 700) crossAxisCount = 2;
              if (constraints.maxWidth < 500) crossAxisCount = 1;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.7,
                children: [
                  _buildMockup("Splash Screen", _buildSplashMockup()),
                  _buildMockup("Home Screen", _buildHomeMockup()),
                  _buildMockup("Detail Film", _buildDetailMockup()),
                  _buildMockup("Search Screen", _buildSearchMockup()),
                  _buildMockup("Favorite Screen", _buildFavoriteMockup()),
                  _buildMockup("Profile Screen", _buildProfileMockup()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMockup(String title, Widget content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            width: double.infinity,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          // Mockup content dengan Stack
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[400]!, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Stack(children: [content]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSplashMockup() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[600]!, Colors.grey[900]!],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.movie_creation_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "CineMatch",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Film Rekomendasi Terbaik",
              style: TextStyle(color: Colors.white70, fontSize: 7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeMockup() {
    return Stack(
      children: [
        Column(
          children: [
            // Header
            Container(
              height: 30,
              color: Colors.grey[700],
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Text(
                    "CineMatch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.search, color: Colors.white, size: 12),
                  const SizedBox(width: 6),
                  Icon(Icons.favorite_border, color: Colors.white, size: 12),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kategori Horizontal
                    const Text(
                      "Kategori",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          _categoryChip("Action"),
                          _categoryChip("Drama"),
                          _categoryChip("Comedy"),
                          _categoryChip("Horror"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Film Populer (Horizontal)
                    const Text(
                      "Film Populer",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(child: _filmCardHorizontal("Film A", "8.5")),
                          const SizedBox(width: 4),
                          Expanded(child: _filmCardHorizontal("Film B", "7.8")),
                          const SizedBox(width: 4),
                          Expanded(child: _filmCardHorizontal("Film C", "9.1")),
                          const SizedBox(width: 4),
                          Expanded(child: _filmCardHorizontal("Film D", "8.3")),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Rekomendasi
                    const Text(
                      "Rekomendasi Untuk Anda",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: _filmCardGrid("Film E", "Action", "8.7"),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: _filmCardGrid("Film F", "Drama", "7.9"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _categoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 6,
            color: Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _filmCardHorizontal(String title, String rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.movie, color: Colors.white, size: 15),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 5, color: Colors.white),
                        const SizedBox(width: 1),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: const TextStyle(fontSize: 5, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _filmCardGrid(String title, String genre, String rating) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: const Center(
                child: Icon(Icons.movie, color: Colors.white, size: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    Text(
                      genre,
                      style: TextStyle(fontSize: 5, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Icon(Icons.star, size: 5, color: Colors.grey[700]),
                    Text(rating, style: const TextStyle(fontSize: 4)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailMockup() {
    return Stack(
      children: [
        Column(
          children: [
            // Poster besar
            Container(
              height: 90,
              color: Colors.grey[400],
              child: const Center(
                child: Icon(
                  Icons.movie_creation,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kang Mak",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(Icons.star, size: 7, color: Colors.grey[700]),
                        const Text(" 7.2", style: TextStyle(fontSize: 6)),
                        const SizedBox(width: 6),
                        Text(
                          "2024",
                          style: TextStyle(
                            fontSize: 6,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "1h 40m",
                          style: TextStyle(
                            fontSize: 6,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Genre: Horor, Komedi",
                      style: TextStyle(fontSize: 5),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Sinopsis",
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "Mak dan teman-temannya kembali dari wajib militer. Mereka singgah di sebuah desa dan menginap di rumah seorang wanita cantik bernama Nak. Tanpa disadari, Nak sebenarnya adalah hantu kuntilanak yang telah meninggal saat melahirkan.",
                          style: TextStyle(
                            fontSize: 5,
                            color: Colors.grey[700],
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: _actionButton(
                            Icons.play_arrow,
                            "Tonton",
                            Colors.grey[700]!,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: _actionButton(
                            Icons.favorite_border,
                            "Simpan",
                            Colors.grey[600]!,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Film Serupa",
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(child: _similarFilm("Danur")),
                          const SizedBox(width: 3),
                          Expanded(child: _similarFilm("KKN")),
                          const SizedBox(width: 3),
                          Expanded(child: _similarFilm("Pengabdi")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Back button
        Positioned(
          top: 6,
          left: 6,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, size: 11, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 8, color: Colors.white),
          const SizedBox(width: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 6,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _similarFilm(String title) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Icon(Icons.movie, color: Colors.white, size: 15),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(title, style: const TextStyle(fontSize: 5), maxLines: 1),
      ],
    );
  }

  Widget _buildSearchMockup() {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 35),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: _searchResultItem(
                        "The Great Movie",
                        "Action",
                        "8.5",
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: _searchResultItem("Amazing Story", "Drama", "7.9"),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: _searchResultItem("Funny Times", "Comedy", "8.2"),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: _searchResultItem("Dark Night", "Horror", "7.5"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Search bar
        Positioned(
          top: 6,
          left: 6,
          right: 6,
          child: Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 10, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(
                  "Cari film...",
                  style: TextStyle(fontSize: 6, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchResultItem(String title, String genre, String rating) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 3)],
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.movie, size: 12, color: Colors.white),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  genre,
                  style: TextStyle(fontSize: 5, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, size: 6, color: Colors.grey[700]),
              const SizedBox(width: 1),
              Text(rating, style: const TextStyle(fontSize: 5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteMockup() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 28,
              color: Colors.grey[700],
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Film Favorit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: _favoriteCard("Danur", "Horor", "7.5")),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _favoriteCard(
                        "KKN di Desa Penari",
                        "Horor",
                        "7.0",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: _favoriteCard("Pengabdi Setan", "Horor", "6.6"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _favoriteCard(
                        "Perempuan Tanah Jahanam",
                        "Horor",
                        "6.5",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _favoriteCard(String title, String genre, String rating) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.movie, color: Colors.white, size: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Text(
                          genre,
                          style: TextStyle(
                            fontSize: 5,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.star, size: 5, color: Colors.grey[700]),
                        Text(rating, style: const TextStyle(fontSize: 4)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 3,
          right: 3,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, size: 8, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileMockup() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[600]!, Colors.grey[800]!],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    const Center(
                      child: Text(
                        "Devi Siska",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "devi@gmail.com",
                        style: TextStyle(fontSize: 6, color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _profileMenuItem(Icons.person, "Edit Profil"),
                    const SizedBox(height: 3),
                    _profileMenuItem(Icons.notifications, "Notifikasi"),
                    const SizedBox(height: 3),
                    _profileMenuItem(Icons.language, "Bahasa"),
                    const SizedBox(height: 3),
                    _profileMenuItem(Icons.help_outline, "Bantuan"),
                    const SizedBox(height: 3),
                    _profileMenuItem(Icons.info_outline, "Tentang Aplikasi"),
                    const SizedBox(height: 6),
                    Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Profile picture
        Positioned(
          top: 25,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
                child: Icon(Icons.person, size: 22, color: Colors.grey[800]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileMenuItem(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(icon, size: 10, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 6, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Icon(Icons.chevron_right, size: 10, color: Colors.grey[600]),
        ],
      ),
    );
  }
}
