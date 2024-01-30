import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/body_kamus_widget.dart';

class BodyKamusPageTwo extends StatefulWidget {
  const BodyKamusPageTwo({super.key});

  @override
  State<BodyKamusPageTwo> createState() => _BodyKamusPageTwoState();
}

class _BodyKamusPageTwoState extends State<BodyKamusPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          BodyKamusWidget(
              istilah: "Badan Usaha Milik Negara/BUMN",
              definisi:
                  "Badan usaha yang seluruh atau sebagian besar modalnya dimiliki oleh negara melalui penyertaan secara langsung yang berasal dari kekayaan negara yang dipisahkan."),
          BodyKamusWidget(
            istilah: "Badan Usaha Milik Negara",
            definisi:
                "Keputusan Deputi Bidang Keuangan dan Manajemen Risiko tentang Petunjuk Teknis Penilaian Indeks Kematangan Risiko (Risk Maturity Index) di Lingkungan Badan Usaha Milik Negara Subtext",
          ),
          BodyKamusWidget(
              istilah: "Perusahaan Perseroan Terbuka/ Persero Terbuka",
              definisi:
                  "Persero yang modal dan jumlah pemegang sahamnya memenuhi kriteria tertentu atau Persero yang melakukan penawaran umum sesuai dengan peraturan perundang-undangan di bidang pasar modal."),
          BodyKamusWidget(
              istilah: "Komisaris/Dewan Komisaris",
              definisi:
                  "Keputusan Deputi Bidang Keuangan dan Manajemen Risiko tentang Petunjuk Teknis Penilaian Indeks Kematangan Risiko (Risk Maturity Index) di Lingkungan Badan Usaha Milik Negara Subtext"),
          BodyKamusWidget(
              istilah: "Perusahaan Perseroan/Persero",
              definisi:
                  "Persero adalah BUMN yang berbentuk perseroan terbatas yang modalnya terbagi dalam saham yang seluruh atau paling sedikit 51% (lima puluh satu persen) sahamnya dimiliki oleh Negara republik Indonesia yang tujuan utamanya mengejar keuntungan."),
        ],
      ),
    );
  }
}
