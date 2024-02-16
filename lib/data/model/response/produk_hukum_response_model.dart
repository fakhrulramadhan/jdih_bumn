import 'dart:convert';

// https://jdih.bumn.go.id/api/service-to-jdihn
class ProdukHukumResponseModel {
  final int? idData;
  final String? tahunPengundangan;
  final DateTime? tanggalPengundangan;
  final String? jenis;
  final String? noPeraturan;
  final String? judul;
  final String? noPanggil;
  final String? singkatanJenis;
  final String? tempatTerbit;
  final String? penerbit;
  final String? deskripsiFisik;
  final String? sumber;
  final String? subjek;
  final String? isbn;
  final String? status;
  final String? bahasa;
  final String? bidangHukum;
  final String? teuBadan;
  final String? nomorIndukBuku;
  final String? fileDownload;
  final String? urlDownload;
  final String? urlDetailPeraturan;
  final int? operasi;
  final int? display;

  ProdukHukumResponseModel({
    this.idData,
    this.tahunPengundangan,
    this.tanggalPengundangan,
    this.jenis,
    this.noPeraturan,
    this.judul,
    this.noPanggil,
    this.singkatanJenis,
    this.tempatTerbit,
    this.penerbit,
    this.deskripsiFisik,
    this.sumber,
    this.subjek,
    this.isbn,
    this.status,
    this.bahasa,
    this.bidangHukum,
    this.teuBadan,
    this.nomorIndukBuku,
    this.fileDownload,
    this.urlDownload,
    this.urlDetailPeraturan,
    this.operasi,
    this.display,
  });

  ProdukHukumResponseModel copyWith({
    int? idData,
    String? tahunPengundangan,
    DateTime? tanggalPengundangan,
    String? jenis,
    String? noPeraturan,
    String? judul,
    String? noPanggil,
    String? singkatanJenis,
    String? tempatTerbit,
    String? penerbit,
    String? deskripsiFisik,
    String? sumber,
    String? subjek,
    String? isbn,
    String? status,
    String? bahasa,
    String? bidangHukum,
    String? teuBadan,
    String? nomorIndukBuku,
    String? fileDownload,
    String? urlDownload,
    String? urlDetailPeraturan,
    int? operasi,
    int? display,
  }) =>
      ProdukHukumResponseModel(
        idData: idData ?? this.idData,
        tahunPengundangan: tahunPengundangan ?? this.tahunPengundangan,
        tanggalPengundangan: tanggalPengundangan ?? this.tanggalPengundangan,
        jenis: jenis ?? this.jenis,
        noPeraturan: noPeraturan ?? this.noPeraturan,
        judul: judul ?? this.judul,
        noPanggil: noPanggil ?? this.noPanggil,
        singkatanJenis: singkatanJenis ?? this.singkatanJenis,
        tempatTerbit: tempatTerbit ?? this.tempatTerbit,
        penerbit: penerbit ?? this.penerbit,
        deskripsiFisik: deskripsiFisik ?? this.deskripsiFisik,
        sumber: sumber ?? this.sumber,
        subjek: subjek ?? this.subjek,
        isbn: isbn ?? this.isbn,
        status: status ?? this.status,
        bahasa: bahasa ?? this.bahasa,
        bidangHukum: bidangHukum ?? this.bidangHukum,
        teuBadan: teuBadan ?? this.teuBadan,
        nomorIndukBuku: nomorIndukBuku ?? this.nomorIndukBuku,
        fileDownload: fileDownload ?? this.fileDownload,
        urlDownload: urlDownload ?? this.urlDownload,
        urlDetailPeraturan: urlDetailPeraturan ?? this.urlDetailPeraturan,
        operasi: operasi ?? this.operasi,
        display: display ?? this.display,
      );

  factory ProdukHukumResponseModel.fromRawJson(String str) =>
      ProdukHukumResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProdukHukumResponseModel.fromJson(Map<String, dynamic> json) =>
      ProdukHukumResponseModel(
        idData: json["idData"],
        tahunPengundangan: json["tahun_pengundangan"],
        tanggalPengundangan: json["tanggal_pengundangan"] == null
            ? null
            : DateTime.parse(json["tanggal_pengundangan"]),
        jenis: json["jenis"],
        noPeraturan: json["noPeraturan"],
        judul: json["judul"],
        noPanggil: json["noPanggil"],
        singkatanJenis: json["singkatanJenis"],
        tempatTerbit: json["tempatTerbit"],
        penerbit: json["penerbit"],
        deskripsiFisik: json["deskripsiFisik"],
        sumber: json["sumber"],
        subjek: json["subjek"],
        isbn: json["isbn"],
        status: json["status"],
        bahasa: json["bahasa"],
        bidangHukum: json["bidangHukum"],
        teuBadan: json["teuBadan"],
        nomorIndukBuku: json["nomorIndukBuku"],
        fileDownload: json["fileDownload"],
        urlDownload: json["urlDownload"],
        urlDetailPeraturan: json["urlDetailPeraturan"],
        operasi: json["operasi"],
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "idData": idData,
        "tahun_pengundangan": tahunPengundangan,
        "tanggal_pengundangan":
            "${tanggalPengundangan!.year.toString().padLeft(4, '0')}-${tanggalPengundangan!.month.toString().padLeft(2, '0')}-${tanggalPengundangan!.day.toString().padLeft(2, '0')}",
        "jenis": jenis,
        "noPeraturan": noPeraturan,
        "judul": judul,
        "noPanggil": noPanggil,
        "singkatanJenis": singkatanJenis,
        "tempatTerbit": tempatTerbit,
        "penerbit": penerbit,
        "deskripsiFisik": deskripsiFisik,
        "sumber": sumber,
        "subjek": subjek,
        "isbn": isbn,
        "status": status,
        "bahasa": bahasa,
        "bidangHukum": bidangHukum,
        "teuBadan": teuBadan,
        "nomorIndukBuku": nomorIndukBuku,
        "fileDownload": fileDownload,
        "urlDownload": urlDownload,
        "urlDetailPeraturan": urlDetailPeraturan,
        "operasi": operasi,
        "display": display,
      };
}
