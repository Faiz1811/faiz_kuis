import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Bank Sampah Keliling'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "Bank sampah keliling adalah inisiatif yang bertujuan untuk meningkatkan partisipasi masyarakat dalam pengelolaan sampah dan pencegahan pencemaran lingkungan. Biasanya dilaksanakan oleh komunitas atau organisasi non-pemerintah, bank sampah keliling menggunakan kendaraan khusus untuk mengumpulkan sampah dari rumah ke rumah atau dari lokasi yang telah ditentukan.\n\n"
                  "Setelah dikumpulkan, sampah tersebut dibersihkan, dipilah, dan diolah menjadi bahan daur ulang. Melalui bank sampah keliling, masyarakat diberikan kesempatan untuk berpartisipasi aktif dalam menjaga lingkungan sekaligus memperoleh insentif berupa hadiah atau uang sebagai imbalan dari sampah yang mereka berikan.\n\n"
                  "Dengan demikian, bank sampah keliling memiliki peran penting dalam mengedukasi masyarakat tentang pentingnya pengelolaan sampah yang berkelanjutan dan membantu mengurangi jumlah sampah yang masuk ke tempat pembuangan akhir.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
