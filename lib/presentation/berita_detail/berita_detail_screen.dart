import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:jdih_bumn/data/model/response/stage/berita_response_model.dart';
import 'package:jdih_bumn/presentation/berita_detail/widget/bagikan_button_berita_widget.dart';
import 'package:share_plus/share_plus.dart';

class BeritaDetailScreen extends StatefulWidget {
  final Item? berita;
  const BeritaDetailScreen({super.key, required this.berita});

  @override
  State<BeritaDetailScreen> createState() => _BeritaDetailScreenState();
}

class _BeritaDetailScreenState extends State<BeritaDetailScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String parseHtmlString(String? htmlString) {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;

      return parsedString;
    }

    int hitungString = parseHtmlString(widget.berita?.narasi).length;

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
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //height: 250,
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
                // Image.network(
                //   "${widget.berita?.imagePathOriFull}",
                //   width: MediaQuery.of(context).size.width,
                //   height: 250,
                //   fit: BoxFit.cover,
                // ),
                child: CachedNetworkImage(
                  imageUrl: "${widget.berita?.imagePathOriFull}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 24.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                // height: parseHtmlString(widget.berita.narasi).length <= 1100
                //     ? 700
                //     : parseHtmlString(widget.berita.narasi).length > 750 &&
                //             parseHtmlString(widget.berita.narasi).length <=
                //                 3500
                //         ? 1000
                //         : parseHtmlString(widget.berita.narasi).length >
                //                     3500 &&
                //                 parseHtmlString(widget.berita.narasi).length <=
                //                     8000
                //             ? 2700
                //             : 3100,
                //height: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      "${widget.berita?.judul}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      parseHtmlString(widget.berita?.narasi),
                      style: const TextStyle(
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
                String urlLink = "${widget.berita?.urlDetailBerita}";
                print(parseHtmlString(widget.berita?.narasi).length);
                await Share.share(urlLink);
              },
            )
          ],
        ),
      ),
    );
  }
}
