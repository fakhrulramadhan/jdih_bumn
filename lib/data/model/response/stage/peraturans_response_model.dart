// To parse this JSON data, do
//
//     final peraturansResponseModel = peraturansResponseModelFromJson(jsonString);

import 'dart:convert';

PeraturansResponseModel peraturansResponseModelFromJson(String str) =>
    PeraturansResponseModel.fromJson(json.decode(str));

String peraturansResponseModelToJson(PeraturansResponseModel data) =>
    json.encode(data.toJson());

class PeraturansResponseModel {
  final List<Item>? items;

  PeraturansResponseModel({
    this.items,
  });

  PeraturansResponseModel copyWith({
    List<Item>? items,
  }) =>
      PeraturansResponseModel(
        items: items ?? this.items,
      );

  factory PeraturansResponseModel.fromJson(Map<String, dynamic> json) =>
      PeraturansResponseModel(
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
  final String? nomorPeraturanBaru;
  final int? id;
  final DateTime? tglPenetapan;
  final String? tahunPenetapan;
  final dynamic tanggalPengundangan;
  final String? jenis;
  final String? deskripsiTentang;
  final String? singkatanJenis;
  final TempatTerbit? tempatTerbit;
  final Sumber? sumber;
  final String? subjek;
  final Status? status;
  final Bahasa? bahasa;
  final String? bidangHukum;
  final TeuBadan? teuBadan;
  final String? fileDownload;
  final String? urlDownload;
  final String? urlDetailPeraturan;
  final String? slug;
  final int? countReader;
  final dynamic fileLampiran;
  final String? fileAbstrak;
  final dynamic urlFileLampiran;
  final String? urlFileAbstrak;
  final dynamic seeData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<DetailStatusPeraturan>? detailStatusPeraturan;

  Item({
    this.nomorPeraturanBaru,
    this.id,
    this.tglPenetapan,
    this.tahunPenetapan,
    this.tanggalPengundangan,
    this.jenis,
    this.deskripsiTentang,
    this.singkatanJenis,
    this.tempatTerbit,
    this.sumber,
    this.subjek,
    this.status,
    this.bahasa,
    this.bidangHukum,
    this.teuBadan,
    this.fileDownload,
    this.urlDownload,
    this.urlDetailPeraturan,
    this.slug,
    this.countReader,
    this.fileLampiran,
    this.fileAbstrak,
    this.urlFileLampiran,
    this.urlFileAbstrak,
    this.seeData,
    this.createdAt,
    this.updatedAt,
    this.detailStatusPeraturan,
  });

  Item copyWith({
    String? nomorPeraturanBaru,
    int? id,
    DateTime? tglPenetapan,
    String? tahunPenetapan,
    dynamic tanggalPengundangan,
    String? jenis,
    String? deskripsiTentang,
    String? singkatanJenis,
    TempatTerbit? tempatTerbit,
    Sumber? sumber,
    String? subjek,
    Status? status,
    Bahasa? bahasa,
    String? bidangHukum,
    TeuBadan? teuBadan,
    String? fileDownload,
    String? urlDownload,
    String? urlDetailPeraturan,
    String? slug,
    int? countReader,
    dynamic fileLampiran,
    String? fileAbstrak,
    dynamic urlFileLampiran,
    String? urlFileAbstrak,
    dynamic seeData,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<DetailStatusPeraturan>? detailStatusPeraturan,
  }) =>
      Item(
        nomorPeraturanBaru: nomorPeraturanBaru ?? this.nomorPeraturanBaru,
        id: id ?? this.id,
        tglPenetapan: tglPenetapan ?? this.tglPenetapan,
        tahunPenetapan: tahunPenetapan ?? this.tahunPenetapan,
        tanggalPengundangan: tanggalPengundangan ?? this.tanggalPengundangan,
        jenis: jenis ?? this.jenis,
        deskripsiTentang: deskripsiTentang ?? this.deskripsiTentang,
        singkatanJenis: singkatanJenis ?? this.singkatanJenis,
        tempatTerbit: tempatTerbit ?? this.tempatTerbit,
        sumber: sumber ?? this.sumber,
        subjek: subjek ?? this.subjek,
        status: status ?? this.status,
        bahasa: bahasa ?? this.bahasa,
        bidangHukum: bidangHukum ?? this.bidangHukum,
        teuBadan: teuBadan ?? this.teuBadan,
        fileDownload: fileDownload ?? this.fileDownload,
        urlDownload: urlDownload ?? this.urlDownload,
        urlDetailPeraturan: urlDetailPeraturan ?? this.urlDetailPeraturan,
        slug: slug ?? this.slug,
        countReader: countReader ?? this.countReader,
        fileLampiran: fileLampiran ?? this.fileLampiran,
        fileAbstrak: fileAbstrak ?? this.fileAbstrak,
        urlFileLampiran: urlFileLampiran ?? this.urlFileLampiran,
        urlFileAbstrak: urlFileAbstrak ?? this.urlFileAbstrak,
        seeData: seeData ?? this.seeData,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        detailStatusPeraturan:
            detailStatusPeraturan ?? this.detailStatusPeraturan,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        nomorPeraturanBaru: json["nomor_peraturan_baru"],
        id: json["id"],
        tglPenetapan: json["tgl_penetapan"] == null
            ? null
            : DateTime.parse(json["tgl_penetapan"]),
        tahunPenetapan: json["tahun_penetapan"],
        tanggalPengundangan: json["tanggal_pengundangan"],
        jenis: json["jenis"],
        deskripsiTentang: json["deskripsi_tentang"],
        singkatanJenis: json["singkatanJenis"],
        tempatTerbit: tempatTerbitValues.map[json["tempatTerbit"]]!,
        sumber: sumberValues.map[json["sumber"]]!,
        subjek: json["subjek"],
        status: statusValues.map[json["status"]]!,
        bahasa: bahasaValues.map[json["bahasa"]]!,
        bidangHukum: json["bidangHukum"],
        teuBadan: teuBadanValues.map[json["teuBadan"]]!,
        fileDownload: json["fileDownload"],
        urlDownload: json["urlDownload"],
        urlDetailPeraturan: json["urlDetailPeraturan"],
        slug: json["slug"],
        countReader: json["count_reader"],
        fileLampiran: json["file_lampiran"],
        fileAbstrak: json["file_abstrak"],
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
        "nomor_peraturan_baru": nomorPeraturanBaru,
        "id": id,
        "tgl_penetapan":
            "${tglPenetapan!.year.toString().padLeft(4, '0')}-${tglPenetapan!.month.toString().padLeft(2, '0')}-${tglPenetapan!.day.toString().padLeft(2, '0')}",
        "tahun_penetapan": tahunPenetapan,
        "tanggal_pengundangan": tanggalPengundangan,
        "jenis": jenis,
        "deskripsi_tentang": deskripsiTentang,
        "singkatanJenis": singkatanJenis,
        "tempatTerbit": tempatTerbitValues.reverse[tempatTerbit],
        "sumber": sumberValues.reverse[sumber],
        "subjek": subjek,
        "status": statusValues.reverse[status],
        "bahasa": bahasaValues.reverse[bahasa],
        "bidangHukum": bidangHukum,
        "teuBadan": teuBadanValues.reverse[teuBadan],
        "fileDownload": fileDownload,
        "urlDownload": urlDownload,
        "urlDetailPeraturan": urlDetailPeraturan,
        "slug": slug,
        "count_reader": countReader,
        "file_lampiran": fileLampiran,
        "file_abstrak": fileAbstrak,
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

enum Bahasa { INDONESIA }

final bahasaValues = EnumValues({"Indonesia": Bahasa.INDONESIA});

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

enum DetailNamaStatus { BARU, MENCABUT, MENGUBAH }

final detailNamaStatusValues = EnumValues({
  "Baru": DetailNamaStatus.BARU,
  "Mencabut": DetailNamaStatus.MENCABUT,
  "Mengubah": DetailNamaStatus.MENGUBAH
});

enum Status { BERLAKU }

final statusValues = EnumValues({"Berlaku": Status.BERLAKU});

enum Sumber { EMPTY }

final sumberValues = EnumValues({"-": Sumber.EMPTY});

enum TempatTerbit { JAKARTA }

final tempatTerbitValues = EnumValues({"Jakarta": TempatTerbit.JAKARTA});

enum TeuBadan { KEMENTERIAN_BADAN_USAHA_MILIK_NEGARA, KEMENTERIAN_BUMN }

final teuBadanValues = EnumValues({
  "Kementerian Badan Usaha Milik Negara":
      TeuBadan.KEMENTERIAN_BADAN_USAHA_MILIK_NEGARA,
  "Kementerian BUMN": TeuBadan.KEMENTERIAN_BUMN
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
