import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/berita/widget/berita_widget.dart';

class ListBeritaWidget extends StatefulWidget {
  const ListBeritaWidget({super.key});

  @override
  State<ListBeritaWidget> createState() => _ListBeritaWidgetState();
}

class _ListBeritaWidgetState extends State<ListBeritaWidget> {
  @override
  void initState() {
    //context.read<GetProdukHukumBloc>().add(DoGetProdukHukumEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //0.55
        childAspectRatio: 0.65,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const BeritaWidget();
      },
    );
  }
}
