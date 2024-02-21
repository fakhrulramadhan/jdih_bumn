// To parse this JSON data, do
//
//     final peraturanResponseModel = peraturanResponseModelFromJson(jsonString);

import 'dart:convert';

PeraturanResponseModel peraturanResponseModelFromJson(String str) =>
    PeraturanResponseModel.fromJson(json.decode(str));

String peraturanResponseModelToJson(PeraturanResponseModel data) =>
    json.encode(data.toJson());

class PeraturanResponseModel {
  final List<Item>? items;

  PeraturanResponseModel({
    this.items,
  });

  PeraturanResponseModel copyWith({
    List<Item>? items,
  }) =>
      PeraturanResponseModel(
        items: items ?? this.items,
      );

  factory PeraturanResponseModel.fromJson(Map<String, dynamic> json) =>
      PeraturanResponseModel(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final String? noPeraturan;
  final int? id;
  final String? tahunPengundangan;
  final DateTime? tanggalPengundangan;
  final String? jenis;
  final String? judul;
  final BidangHukum? noPanggil;
  final SingkatanJenis? singkatanJenis;
  final TempatTerbit? tempatTerbit;
  final BidangHukum? penerbit;
  final BidangHukum? deskripsiFisik;
  final BidangHukum? isbn;
  final Status? status;
  final Bahasa? bahasa;
  final BidangHukum? bidangHukum;
  final TeuBadan? teuBadan;
  final BidangHukum? nomorIndukBuku;
  final String? fileDownload;
  final String? urlDownload;
  final String? urlDetailPeraturan;
  final int? idOriginData;
  final String? slug;
  final int? countReader;
  final String? fileLampiran;
  final String? fileAbstrak;
  final DateTime? tglPenetapan;
  final String? perNoBaru;
  final String? perNoObjek;
  final String? urlFileLampiran;
  final String? urlFileAbstrak;
  final dynamic seeData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<DetailStatusPeraturan>? detailStatusPeraturan;

  Item({
    this.noPeraturan,
    this.id,
    this.tahunPengundangan,
    this.tanggalPengundangan,
    this.jenis,
    this.judul,
    this.noPanggil,
    this.singkatanJenis,
    this.tempatTerbit,
    this.penerbit,
    this.deskripsiFisik,
    this.isbn,
    this.status,
    this.bahasa,
    this.bidangHukum,
    this.teuBadan,
    this.nomorIndukBuku,
    this.fileDownload,
    this.urlDownload,
    this.urlDetailPeraturan,
    this.idOriginData,
    this.slug,
    this.countReader,
    this.fileLampiran,
    this.fileAbstrak,
    this.tglPenetapan,
    this.perNoBaru,
    this.perNoObjek,
    this.urlFileLampiran,
    this.urlFileAbstrak,
    this.seeData,
    this.createdAt,
    this.updatedAt,
    this.detailStatusPeraturan,
  });

  Item copyWith({
    String? noPeraturan,
    int? id,
    String? tahunPengundangan,
    DateTime? tanggalPengundangan,
    String? jenis,
    String? judul,
    BidangHukum? noPanggil,
    SingkatanJenis? singkatanJenis,
    TempatTerbit? tempatTerbit,
    BidangHukum? penerbit,
    BidangHukum? deskripsiFisik,
    BidangHukum? isbn,
    Status? status,
    Bahasa? bahasa,
    BidangHukum? bidangHukum,
    TeuBadan? teuBadan,
    BidangHukum? nomorIndukBuku,
    String? fileDownload,
    String? urlDownload,
    String? urlDetailPeraturan,
    int? idOriginData,
    String? slug,
    int? countReader,
    String? fileLampiran,
    String? fileAbstrak,
    DateTime? tglPenetapan,
    String? perNoBaru,
    String? perNoObjek,
    String? urlFileLampiran,
    String? urlFileAbstrak,
    dynamic seeData,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<DetailStatusPeraturan>? detailStatusPeraturan,
  }) =>
      Item(
        noPeraturan: noPeraturan ?? this.noPeraturan,
        id: id ?? this.id,
        tahunPengundangan: tahunPengundangan ?? this.tahunPengundangan,
        tanggalPengundangan: tanggalPengundangan ?? this.tanggalPengundangan,
        jenis: jenis ?? this.jenis,
        judul: judul ?? this.judul,
        noPanggil: noPanggil ?? this.noPanggil,
        singkatanJenis: singkatanJenis ?? this.singkatanJenis,
        tempatTerbit: tempatTerbit ?? this.tempatTerbit,
        penerbit: penerbit ?? this.penerbit,
        deskripsiFisik: deskripsiFisik ?? this.deskripsiFisik,
        isbn: isbn ?? this.isbn,
        status: status ?? this.status,
        bahasa: bahasa ?? this.bahasa,
        bidangHukum: bidangHukum ?? this.bidangHukum,
        teuBadan: teuBadan ?? this.teuBadan,
        nomorIndukBuku: nomorIndukBuku ?? this.nomorIndukBuku,
        fileDownload: fileDownload ?? this.fileDownload,
        urlDownload: urlDownload ?? this.urlDownload,
        urlDetailPeraturan: urlDetailPeraturan ?? this.urlDetailPeraturan,
        idOriginData: idOriginData ?? this.idOriginData,
        slug: slug ?? this.slug,
        countReader: countReader ?? this.countReader,
        fileLampiran: fileLampiran ?? this.fileLampiran,
        fileAbstrak: fileAbstrak ?? this.fileAbstrak,
        tglPenetapan: tglPenetapan ?? this.tglPenetapan,
        perNoBaru: perNoBaru ?? this.perNoBaru,
        perNoObjek: perNoObjek ?? this.perNoObjek,
        urlFileLampiran: urlFileLampiran ?? this.urlFileLampiran,
        urlFileAbstrak: urlFileAbstrak ?? this.urlFileAbstrak,
        seeData: seeData ?? this.seeData,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        detailStatusPeraturan:
            detailStatusPeraturan ?? this.detailStatusPeraturan,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        noPeraturan: json["noPeraturan"],
        id: json["id"],
        tahunPengundangan: json["tahun_pengundangan"],
        tanggalPengundangan: json["tanggal_pengundangan"] == null
            ? null
            : DateTime.parse(json["tanggal_pengundangan"]),
        jenis: json["jenis"],
        judul: json["judul"],
        noPanggil: bidangHukumValues.map[json["noPanggil"]]!,
        singkatanJenis: singkatanJenisValues.map[json["singkatanJenis"]]!,
        tempatTerbit: tempatTerbitValues.map[json["tempatTerbit"]]!,
        penerbit: bidangHukumValues.map[json["penerbit"]]!,
        deskripsiFisik: bidangHukumValues.map[json["deskripsiFisik"]]!,
        isbn: bidangHukumValues.map[json["isbn"]]!,
        status: statusValues.map[json["status"]]!,
        bahasa: bahasaValues.map[json["bahasa"]]!,
        bidangHukum: bidangHukumValues.map[json["bidangHukum"]]!,
        teuBadan: teuBadanValues.map[json["teuBadan"]]!,
        nomorIndukBuku: bidangHukumValues.map[json["nomorIndukBuku"]]!,
        fileDownload: json["fileDownload"],
        urlDownload: json["urlDownload"],
        urlDetailPeraturan: json["urlDetailPeraturan"],
        idOriginData: json["id_origin_data"],
        slug: json["slug"],
        countReader: json["count_reader"],
        fileLampiran: json["file_lampiran"],
        fileAbstrak: json["file_abstrak"],
        tglPenetapan: json["tgl_penetapan"] == null
            ? null
            : DateTime.parse(json["tgl_penetapan"]),
        perNoBaru: json["per_no_baru"],
        perNoObjek: json["per_no_objek"],
        urlFileLampiran: json["urlFileLampiran"],
        urlFileAbstrak: json["urlFileAbstrak"],
        seeData: json["see_data"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        detailStatusPeraturan: json["detailStatusPeraturan"] == null
            ? []
            : List<DetailStatusPeraturan>.from(json["detailStatusPeraturan"]!
                .map((x) => DetailStatusPeraturan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "noPeraturan": noPeraturan,
        "id": id,
        "tahun_pengundangan": tahunPengundangan,
        "tanggal_pengundangan":
            "${tanggalPengundangan!.year.toString().padLeft(4, '0')}-${tanggalPengundangan!.month.toString().padLeft(2, '0')}-${tanggalPengundangan!.day.toString().padLeft(2, '0')}",
        "jenis": jenis,
        "judul": judul,
        "noPanggil": bidangHukumValues.reverse[noPanggil],
        "singkatanJenis": singkatanJenisValues.reverse[singkatanJenis],
        "tempatTerbit": tempatTerbitValues.reverse[tempatTerbit],
        "penerbit": bidangHukumValues.reverse[penerbit],
        "deskripsiFisik": bidangHukumValues.reverse[deskripsiFisik],
        "isbn": bidangHukumValues.reverse[isbn],
        "status": statusValues.reverse[status],
        "bahasa": bahasaValues.reverse[bahasa],
        "bidangHukum": bidangHukumValues.reverse[bidangHukum],
        "teuBadan": teuBadanValues.reverse[teuBadan],
        "nomorIndukBuku": bidangHukumValues.reverse[nomorIndukBuku],
        "fileDownload": fileDownload,
        "urlDownload": urlDownload,
        "urlDetailPeraturan": urlDetailPeraturan,
        "id_origin_data": idOriginData,
        "slug": slug,
        "count_reader": countReader,
        "file_lampiran": fileLampiran,
        "file_abstrak": fileAbstrak,
        "tgl_penetapan":
            "${tglPenetapan!.year.toString().padLeft(4, '0')}-${tglPenetapan!.month.toString().padLeft(2, '0')}-${tglPenetapan!.day.toString().padLeft(2, '0')}",
        "per_no_baru": perNoBaru,
        "per_no_objek": perNoObjek,
        "urlFileLampiran": urlFileLampiran,
        "urlFileAbstrak": urlFileAbstrak,
        "see_data": seeData,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "detailStatusPeraturan": detailStatusPeraturan == null
            ? []
            : List<dynamic>.from(detailStatusPeraturan!.map((x) => x.toJson())),
      };
}

enum Bahasa { EMPTY, INDONESIA, INDONESIA_ENGLISH }

final bahasaValues = EnumValues({
  "": Bahasa.EMPTY,
  "Indonesia": Bahasa.INDONESIA,
  "Indonesia,English": Bahasa.INDONESIA_ENGLISH
});

enum BidangHukum { EMPTY }

final bidangHukumValues = EnumValues({"-": BidangHukum.EMPTY});

class DetailStatusPeraturan {
  final DetailNamaStatus? detailNamaStatus;
  final String? perNoObjek;

  DetailStatusPeraturan({
    this.detailNamaStatus,
    this.perNoObjek,
  });

  DetailStatusPeraturan copyWith({
    DetailNamaStatus? detailNamaStatus,
    String? perNoObjek,
  }) =>
      DetailStatusPeraturan(
        detailNamaStatus: detailNamaStatus ?? this.detailNamaStatus,
        perNoObjek: perNoObjek ?? this.perNoObjek,
      );

  factory DetailStatusPeraturan.fromJson(Map<String, dynamic> json) =>
      DetailStatusPeraturan(
        detailNamaStatus:
            detailNamaStatusValues.map[json["detail_nama_status"]]!,
        perNoObjek: json["per_no_objek"],
      );

  Map<String, dynamic> toJson() => {
        "detail_nama_status": detailNamaStatusValues.reverse[detailNamaStatus],
        "per_no_objek": perNoObjek,
      };
}

enum DetailNamaStatus { DICABUT, DIUBAH, MENCABUT, MENGUBAH }

final detailNamaStatusValues = EnumValues({
  "Dicabut": DetailNamaStatus.DICABUT,
  "Diubah": DetailNamaStatus.DIUBAH,
  "Mencabut": DetailNamaStatus.MENCABUT,
  "Mengubah": DetailNamaStatus.MENGUBAH
});

enum SingkatanJenis {
  KEPMEN,
  KEPMENBUMN,
  KEPPRES,
  PERATURAN_TK_ESELON_I,
  PERGUB,
  PERMEN,
  PERMENBUMN,
  PERPRES,
  PERPU,
  PP,
  SEMENBUMN,
  SE_LAIN,
  UU
}

final singkatanJenisValues = EnumValues({
  "KEPMEN": SingkatanJenis.KEPMEN,
  "KEPMENBUMN": SingkatanJenis.KEPMENBUMN,
  "KEPPRES": SingkatanJenis.KEPPRES,
  "Peraturan Tk Eselon I": SingkatanJenis.PERATURAN_TK_ESELON_I,
  "PERGUB": SingkatanJenis.PERGUB,
  "PERMEN": SingkatanJenis.PERMEN,
  "PERMENBUMN": SingkatanJenis.PERMENBUMN,
  "PERPRES": SingkatanJenis.PERPRES,
  "PERPU": SingkatanJenis.PERPU,
  "PP": SingkatanJenis.PP,
  "SEMENBUMN": SingkatanJenis.SEMENBUMN,
  "SE LAIN": SingkatanJenis.SE_LAIN,
  "UU": SingkatanJenis.UU
});

enum Status { BERLAKU, TIDAK_BERLAKU }

final statusValues = EnumValues(
    {"Berlaku": Status.BERLAKU, "Tidak Berlaku": Status.TIDAK_BERLAKU});

enum TempatTerbit { JAKARTA }

final tempatTerbitValues = EnumValues({"Jakarta": TempatTerbit.JAKARTA});

enum TeuBadan {
  KEMENTERIAN_AGRARIA_DAN_TATA_RUANG_BADAN_PERTANAHAN_NASIONAL,
  KEMENTERIAN_BADAN_USAHA_MILIK_NEGARA,
  KEMENTERIAN_BUMN,
  KEMENTERIAN_DALAM_NEGERI,
  KEMENTERIAN_KETENAGAKERJAAN,
  KEMENTERIAN_KEUANGAN,
  KEMENTERIAN_PEKERJAAN_UMUM_DAN_PERUMAHAN_RAKYAT,
  KEMENTERIAN_PENDIDIKAN_DAN_KEBUDAYAAN,
  KEMENTERIAN_PERDAGANGAN,
  KEMENTERIAN_PERHUBUNGAN,
  KEMENTERIAN_PERTAHANAN,
  KOMISI_PEMBERANTASAN_KORUPSI
}

final teuBadanValues = EnumValues({
  "Kementerian Agraria dan Tata Ruang/Badan Pertanahan Nasional":
      TeuBadan.KEMENTERIAN_AGRARIA_DAN_TATA_RUANG_BADAN_PERTANAHAN_NASIONAL,
  "Kementerian Badan Usaha Milik Negara":
      TeuBadan.KEMENTERIAN_BADAN_USAHA_MILIK_NEGARA,
  "Kementerian BUMN": TeuBadan.KEMENTERIAN_BUMN,
  "Kementerian Dalam Negeri": TeuBadan.KEMENTERIAN_DALAM_NEGERI,
  "Kementerian Ketenagakerjaan": TeuBadan.KEMENTERIAN_KETENAGAKERJAAN,
  "Kementerian Keuangan": TeuBadan.KEMENTERIAN_KEUANGAN,
  "Kementerian Pekerjaan Umum dan Perumahan Rakyat":
      TeuBadan.KEMENTERIAN_PEKERJAAN_UMUM_DAN_PERUMAHAN_RAKYAT,
  "Kementerian Pendidikan dan Kebudayaan":
      TeuBadan.KEMENTERIAN_PENDIDIKAN_DAN_KEBUDAYAAN,
  "Kementerian Perdagangan": TeuBadan.KEMENTERIAN_PERDAGANGAN,
  "Kementerian Perhubungan": TeuBadan.KEMENTERIAN_PERHUBUNGAN,
  "Kementerian Pertahanan": TeuBadan.KEMENTERIAN_PERTAHANAN,
  "Komisi Pemberantasan Korupsi": TeuBadan.KOMISI_PEMBERANTASAN_KORUPSI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
