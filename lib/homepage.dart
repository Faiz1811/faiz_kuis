import 'package:flutter/material.dart';
import 'dataDummy.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima username dari route arguments
    final String username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Sampah'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greetings Text
            Text(
              "Selamat Pagi '$username'! Yuk buat perubahan positif bagi lingkungan sekarang",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Card tentang Bank Sampah Keliling
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail
                Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(text: "Apa itu Bank Sampah Keliling?\n"),
                        TextSpan(
                          text:
                              "Bank Sampah akan hadir di dekat rumah Anda, ",
                        ),
                        TextSpan(
                          text: "Pelajari teknisnya lebih lanjut",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // List Jadwal Pengambilan Sampah
            const Text(
              "Jadwal Pengambilan Sampah:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  final schedule = scheduleList[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        schedule.imageUrl,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported);
                        },
                      ),
                      title: Text(schedule.wasteBankName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Area: ${schedule.coverageArea}"),
                          Text(
                              "Tanggal: ${schedule.implementationDate} (${schedule.startTime} - ${schedule.endTime})"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
