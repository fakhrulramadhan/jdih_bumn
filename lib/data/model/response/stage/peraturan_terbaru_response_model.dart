// To parse this JSON data, do
//
//     final peraturanTerbaruResponseModel = peraturanTerbaruResponseModelFromJson(jsonString);

import 'dart:convert';

PeraturanTerbaruResponseModel peraturanTerbaruResponseModelFromJson(
        String str) =>
    PeraturanTerbaruResponseModel.fromJson(json.decode(str));

String peraturanTerbaruResponseModelToJson(
        PeraturanTerbaruResponseModel data) =>
    json.encode(data.toJson());

class PeraturanTerbaruResponseModel {
  final List<Item>? items;

  PeraturanTerbaruResponseModel({
    this.items,
  });

  PeraturanTerbaruResponseModel copyWith({
    List<Item>? items,
  }) =>
      PeraturanTerbaruResponseModel(
        items: items ?? this.items,
      );

  factory PeraturanTerbaruResponseModel.fromJson(Map<String, dynamic> json) =>
      PeraturanTerbaruResponseModel(
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
  final String? tahunPengundangan;
  final DateTime? tanggalPengundangan;
  final String? jenis;
  final String? judul;
  final String? singkatanJenis;
  final String? tempatTerbit;
  final String? sumber;
  final String? subjek;
  final dynamic status;
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
  final DateTime? tglPenetapan;
  final String? perNoBaru;
  final String? perNoObjek;
  final dynamic urlFileLampiran;
  final dynamic urlFileAbstrak;
  final String? seeData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<DetailStatusPeraturan>? detailStatusPeraturan;

  Item({
    this.nomorPeraturanBaru,
    this.id,
    this.tahunPengundangan,
    this.tanggalPengundangan,
    this.jenis,
    this.judul,
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
    String? nomorPeraturanBaru,
    int? id,
    String? tahunPengundangan,
    DateTime? tanggalPengundangan,
    String? jenis,
    String? judul,
    String? singkatanJenis,
    String? tempatTerbit,
    String? sumber,
    String? subjek,
    dynamic status,
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
    DateTime? tglPenetapan,
    String? perNoBaru,
    String? perNoObjek,
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
        tahunPengundangan: tahunPengundangan ?? this.tahunPengundangan,
        tanggalPengundangan: tanggalPengundangan ?? this.tanggalPengundangan,
        jenis: jenis ?? this.jenis,
        judul: judul ?? this.judul,
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
        nomorPeraturanBaru: json["nomor_peraturan_baru"],
        id: json["id"],
        tahunPengundangan: json["tahun_pengundangan"],
        tanggalPengundangan: json["tanggal_pengundangan"] == null
            ? null
            : DateTime.parse(json["tanggal_pengundangan"]),
        jenis: json["jenis"],
        judul: json["judul"],
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
        "nomor_peraturan_baru": nomorPeraturanBaru,
        "id": id,
        "tahun_pengundangan": tahunPengundangan,
        "tanggal_pengundangan":
            "${tanggalPengundangan!.year.toString().padLeft(4, '0')}-${tanggalPengundangan!.month.toString().padLeft(2, '0')}-${tanggalPengundangan!.day.toString().padLeft(2, '0')}",
        "jenis": jenis,
        "judul": judul,
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
