import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/berita_detail/widget/bagikan_button_berita_widget.dart';
import 'package:share_plus/share_plus.dart';

class BeritaDetailzScreen extends StatefulWidget {
  //final Item berita;
  const BeritaDetailzScreen({super.key});

  @override
  State<BeritaDetailzScreen> createState() => _BeritaDetailzScreenState();
}

class _BeritaDetailzScreenState extends State<BeritaDetailzScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Berita"),
        centerTitle: true,
        actions: const [],
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // image: DecorationImage(
                //     image: AssetImage('assets/images/appbar-bg2.png'),
                //     fit: BoxFit.cover)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "assets/images/berita-satu.png",
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                height: 900,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Column(
                  children: [
                    Text(
                      "Rangkaian Pertama Kegiatan Sosialisasi Peraturan Menteri BUMN Hasil Simplifikasi dan Penataan Pada Level Teknis",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      '''Rangkaian pertama sosialisasi 3 (tiga) Peraturan Menteri BUMN hasil penataan regulasi dan simplifikasi yaitu Peraturan Menteri BUMN No. PER-1/MBU/3/2023, Peraturan Menteri BUMN No. PER-2/MBU/3/2023 dan Peraturan Menteri BUMN No. PER-3/MBU/3/2023 yang diundangkan tanggal 24 Maret 2023 telah dilaksanakan oleh Kementerian BUMN. Sosialisasi tersebut dilaksanakan Rabu (15/11) bertempat di Ballroom Gedung Danareksa Jakarta. Sosialisasi yang digelar Deputi Bidang Hukum dan Perundang-undangan ini ditujukan untuk pegawai Kementerian BUMN dan karyawan BUMN level teknis Klaster Minerba, Emigas dan Industri Kesehatan, yang menangani fungsi dan tugas sesuai dengan materi sosialisasi.
Kegiatan dibuka langsung Robertus Bilitea selaku Deputi Bidang Hukum dan Perundang-undangan Kementerian BUMN. Dalam kesempatan ini, Robertus menyampaikan tujuan sosialisasi ini, salah satunya untuk mendapatkan feedback dan saran dari para peserta sosialisasi. Kegiatan kemudian dilanjutkan dengan pemaparan materi oleh empat narasumber. Narsumber pertama yaitu Asdep Bidang Manajemen Risiko dan Kepatuhan, Dwi Ary Purnomo, memaparkan materi mengenai Penerapan Manajemen Risiko pada BUMN. Narasumber kedua, Asisten Deputi Bidang Hukum Korporasi/Plt. Asisten Deputi Bidang Peraturan Perundang-undangan, Rini Widyastuti memaparkan materi Penugasan Khusus, Prinsip Tata Kelola BUMN, dan Pedoman Kegiatan Korporasi Signifikan BUMN. Narasumber ketiga, Asisten Deputi Bidang Keuangan, Bin Nahadi, memaparkan materi Penilaian Tingkat Kesehatan, Perencanaan Strategis dan Pelaporan. Adapun narasumber sesi keempat adalah Asisten Deputi Bidang Teknologi dan Informasi/Plt. Asisten Deputi Bidang Manajemen SDM BUMN yang memaparkan materi Tata Cara Pengangkatan anggota Direksi/Dekom/Dewas BUMN dan Penghasilan anggota Dekom/Dewas BUMN.
Para peserta sosialisasi terlihat antusias dengan adanya sosialisasi tersebut, yang terekspresikan dalam sesi tanya jawab. Semoga dengan adanya sosialisasi ini, BUMN dapat lebih memahami substasi pengaturan terbaru dalam Peraturan Menteri BUMN tersebut sehingga dapat menunjang peningkatan kinerja BUMN. #BUMNUntukIndonesia
#JDIHKementerianBUMN
#SobatJDIHBUMN''',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  offset: const Offset(0, -10),
                  blurRadius: 1),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BagikanButtonBeritaWidget(
              onPressed: () async {
                const urlLink = "https://www.youtube.com/watch?v=CNUBhb_cM6E";

                await Share.share("This cat is cute $urlLink");
              },
            )
          ],
        ),
      ),
    );
  }
}
