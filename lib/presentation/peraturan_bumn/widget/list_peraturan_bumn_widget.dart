// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/peraturan_bumn_detail/peraturan_bumn_detail_screen.dart';

class ListPeraturanBumnWidget extends StatefulWidget {
  const ListPeraturanBumnWidget({Key? key}) : super(key: key);

  @override
  State<ListPeraturanBumnWidget> createState() =>
      _ListPeraturanBumnWidgetState();
}

class _ListPeraturanBumnWidgetState extends State<ListPeraturanBumnWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PeraturanBumnDetailScreen()),
        );
      },
      child: SizedBox(
        height: 330,
        width: 361,
        child: Column(
          children: [
            Container(
              height: 260,
              width: 361,
              //color: Colors.brown,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: 260,
                    width: 341,
                    //color: Colors.yellow,
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '91/PUU-XVIII/2020',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0093AD),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'T.E.U Badan/Orang : Mahkamah Konstitusi',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Pengujian Formil Undang-Undang Nomor 11 Tahun 2020 tentang Cipta Kerja terhadap Undang-Undang Dasar Negara Republik Indonesia Tahun 1945',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFECF0F1),
              height: 30,
              width: 360,
              padding: const EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140,
                    height: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 8.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '06-12-2023',
                          style: TextStyle(
                            fontSize: 9.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Icon(
                          Icons.remove_red_eye,
                          size: 8.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '2.731 K',
                          style: TextStyle(
                            fontSize: 9.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
