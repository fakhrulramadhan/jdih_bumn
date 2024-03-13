// To parse this JSON data, do
//
//     final peraturanPopulersResponseModel = peraturanPopulersResponseModelFromJson(jsonString);

import 'dart:convert';

PeraturanPopulersResponseModel peraturanPopulersResponseModelFromJson(
        String str) =>
    PeraturanPopulersResponseModel.fromJson(json.decode(str));

String peraturanPopulersResponseModelToJson(
        PeraturanPopulersResponseModel data) =>
    json.encode(data.toJson());

class PeraturanPopulersResponseModel {
  final List<Item>? items;

  PeraturanPopulersResponseModel({
    this.items,
  });

  PeraturanPopulersResponseModel copyWith({
    List<Item>? items,
  }) =>
      PeraturanPopulersResponseModel(
        items: items ?? this.items,
      );

  factory PeraturanPopulersResponseModel.fromJson(Map<String, dynamic> json) =>
      PeraturanPopulersResponseModel(
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
  final String? tempatTerbit;
  final String? sumber;
  final String? subjek;
  final String? status;
  final String? bahasa;
  final String? bidangHukum;
  final String? teuBadan;
  final String? fileDownload;
  final String? urlDownload;
  final String? urlDetailPeraturan;
  final String? slug;
  final int? countReader;
  final dynamic fileLampiran;
  final dynamic fileAbstrak;
  final dynamic urlFileLampiran;
  final dynamic urlFileAbstrak;
  final String? seeData;
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
    String? tempatTerbit,
    String? sumber,
    String? subjek,
    String? status,
    String? bahasa,
    String? bidangHukum,
    String? teuBadan,
    String? fileDownload,
    String? urlDownload,
    String? urlDetailPeraturan,
    String? slug,
    int? countReader,
    dynamic fileLampiran,
    dynamic fileAbstrak,
    dynamic urlFileLampiran,
    dynamic urlFileAbstrak,
    String? seeData,
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
        tempatTerbit: json["tempatTerbit"],
        sumber: json["sumber"],
        subjek: json["subjek"],
        status: json["status"],
        bahasa: json["bahasa"],
        bidangHukum: json["bidangHukum"],
        teuBadan: json["teuBadan"],
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
        "tempatTerbit": tempatTerbit,
        "sumber": sumber,
        "subjek": subjek,
        "status": status,
        "bahasa": bahasa,
        "bidangHukum": bidangHukum,
        "teuBadan": teuBadan,
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

class DetailStatusPeraturan {
  final String? detailNamaStatus;
  final String? perNoObjek;

  DetailStatusPeraturan({
    this.detailNamaStatus,
    this.perNoObjek,
  });

  DetailStatusPeraturan copyWith({
    String? detailNamaStatus,
    String? perNoObjek,
  }) =>
      DetailStatusPeraturan(
        detailNamaStatus: detailNamaStatus ?? this.detailNamaStatus,
        perNoObjek: perNoObjek ?? this.perNoObjek,
      );

  factory DetailStatusPeraturan.fromJson(Map<String, dynamic> json) =>
      DetailStatusPeraturan(
        detailNamaStatus: json["detail_nama_status"],
        perNoObjek: json["per_no_objek"],
      );

  Map<String, dynamic> toJson() => {
        "detail_nama_status": detailNamaStatus,
        "per_no_objek": perNoObjek,
      };
}
