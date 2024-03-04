// To parse this JSON data, do
//
//     final searchPeraturanResponseModel = searchPeraturanResponseModelFromJson(jsonString);

import 'dart:convert';

SearchPeraturanResponseModel searchPeraturanResponseModelFromJson(String str) =>
    SearchPeraturanResponseModel.fromJson(json.decode(str));

String searchPeraturanResponseModelToJson(SearchPeraturanResponseModel data) =>
    json.encode(data.toJson());

class SearchPeraturanResponseModel {
  final List<PeraturanSearch>? items;

  SearchPeraturanResponseModel({
    this.items,
  });

  SearchPeraturanResponseModel copyWith({
    List<PeraturanSearch>? items,
  }) =>
      SearchPeraturanResponseModel(
        items: items ?? this.items,
      );

  factory SearchPeraturanResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchPeraturanResponseModel(
        items: json["items"] == null
            ? []
            : List<PeraturanSearch>.from(
                json["items"]!.map((x) => PeraturanSearch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class PeraturanSearch {
  final int? id;
  final int? idProdukHukum;
  final int? idJenisPeraturan;
  final dynamic idLembaga;
  final String? nomorPeraturanBaru;
  final String? filePeraturan;
  final dynamic filePeraturanEng;
  final dynamic idSubjek;
  final dynamic idKlaster;
  final String? deskripsiTentang;
  final dynamic deskripsiTentangEng;
  final dynamic idSumber;
  final String? abstrakPeraturan;
  final String? abstrakPeraturanEng;
  final bool? isActive;
  final bool? isReview;
  final bool? isPublish;
  final int? createdById;
  final dynamic reviewById;
  final dynamic publishById;
  final String? createdDate;
  final dynamic reviewDate;
  final dynamic publishDate;
  final String? slug;
  final String? slugEng;
  final bool? isMigrasi;
  final String? jenisPeraturanShort;
  final dynamic idPeraturanMigrasi;
  final DateTime? tglPenetapanMigrasi;
  final dynamic fileIdMigrasi;
  final dynamic fileIdEnMigrasi;
  final dynamic catatan;
  final int? countReader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic catatanEng;
  final dynamic sumberPeraturan;
  final dynamic sumberPeraturanEng;
  final dynamic subjekPeraturan;
  final dynamic subjekPeraturanEng;
  final dynamic statusPeraturan;
  final dynamic statusPeraturanEng;
  final dynamic catatanVerifikator;
  final bool? approvedVerifikator;
  final bool? ditolakVerifikator;
  final dynamic fileLampiran;
  final dynamic deskripsiLampiran;
  final dynamic fileAbstrak;
  final dynamic fileAbstrakEng;
  final dynamic tahunPeraturan;
  final dynamic lokasi;
  final dynamic tanggalPengundangan;
  final dynamic subjek;
  final String? namaPeraturan;
  final String? namaPeraturanEng;

  PeraturanSearch({
    this.id,
    this.idProdukHukum,
    this.idJenisPeraturan,
    this.idLembaga,
    this.nomorPeraturanBaru,
    this.filePeraturan,
    this.filePeraturanEng,
    this.idSubjek,
    this.idKlaster,
    this.deskripsiTentang,
    this.deskripsiTentangEng,
    this.idSumber,
    this.abstrakPeraturan,
    this.abstrakPeraturanEng,
    this.isActive,
    this.isReview,
    this.isPublish,
    this.createdById,
    this.reviewById,
    this.publishById,
    this.createdDate,
    this.reviewDate,
    this.publishDate,
    this.slug,
    this.slugEng,
    this.isMigrasi,
    this.jenisPeraturanShort,
    this.idPeraturanMigrasi,
    this.tglPenetapanMigrasi,
    this.fileIdMigrasi,
    this.fileIdEnMigrasi,
    this.catatan,
    this.countReader,
    this.createdAt,
    this.updatedAt,
    this.catatanEng,
    this.sumberPeraturan,
    this.sumberPeraturanEng,
    this.subjekPeraturan,
    this.subjekPeraturanEng,
    this.statusPeraturan,
    this.statusPeraturanEng,
    this.catatanVerifikator,
    this.approvedVerifikator,
    this.ditolakVerifikator,
    this.fileLampiran,
    this.deskripsiLampiran,
    this.fileAbstrak,
    this.fileAbstrakEng,
    this.tahunPeraturan,
    this.lokasi,
    this.tanggalPengundangan,
    this.subjek,
    this.namaPeraturan,
    this.namaPeraturanEng,
  });

  PeraturanSearch copyWith({
    int? id,
    int? idProdukHukum,
    int? idJenisPeraturan,
    dynamic idLembaga,
    String? nomorPeraturanBaru,
    String? filePeraturan,
    dynamic filePeraturanEng,
    dynamic idSubjek,
    dynamic idKlaster,
    String? deskripsiTentang,
    dynamic deskripsiTentangEng,
    dynamic idSumber,
    String? abstrakPeraturan,
    String? abstrakPeraturanEng,
    bool? isActive,
    bool? isReview,
    bool? isPublish,
    int? createdById,
    dynamic reviewById,
    dynamic publishById,
    String? createdDate,
    dynamic reviewDate,
    dynamic publishDate,
    String? slug,
    String? slugEng,
    bool? isMigrasi,
    String? jenisPeraturanShort,
    dynamic idPeraturanMigrasi,
    DateTime? tglPenetapanMigrasi,
    dynamic fileIdMigrasi,
    dynamic fileIdEnMigrasi,
    dynamic catatan,
    int? countReader,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic catatanEng,
    dynamic sumberPeraturan,
    dynamic sumberPeraturanEng,
    dynamic subjekPeraturan,
    dynamic subjekPeraturanEng,
    dynamic statusPeraturan,
    dynamic statusPeraturanEng,
    dynamic catatanVerifikator,
    bool? approvedVerifikator,
    bool? ditolakVerifikator,
    dynamic fileLampiran,
    dynamic deskripsiLampiran,
    dynamic fileAbstrak,
    dynamic fileAbstrakEng,
    dynamic tahunPeraturan,
    dynamic lokasi,
    dynamic tanggalPengundangan,
    dynamic subjek,
    String? namaPeraturan,
    String? namaPeraturanEng,
  }) =>
      PeraturanSearch(
        id: id ?? this.id,
        idProdukHukum: idProdukHukum ?? this.idProdukHukum,
        idJenisPeraturan: idJenisPeraturan ?? this.idJenisPeraturan,
        idLembaga: idLembaga ?? this.idLembaga,
        nomorPeraturanBaru: nomorPeraturanBaru ?? this.nomorPeraturanBaru,
        filePeraturan: filePeraturan ?? this.filePeraturan,
        filePeraturanEng: filePeraturanEng ?? this.filePeraturanEng,
        idSubjek: idSubjek ?? this.idSubjek,
        idKlaster: idKlaster ?? this.idKlaster,
        deskripsiTentang: deskripsiTentang ?? this.deskripsiTentang,
        deskripsiTentangEng: deskripsiTentangEng ?? this.deskripsiTentangEng,
        idSumber: idSumber ?? this.idSumber,
        abstrakPeraturan: abstrakPeraturan ?? this.abstrakPeraturan,
        abstrakPeraturanEng: abstrakPeraturanEng ?? this.abstrakPeraturanEng,
        isActive: isActive ?? this.isActive,
        isReview: isReview ?? this.isReview,
        isPublish: isPublish ?? this.isPublish,
        createdById: createdById ?? this.createdById,
        reviewById: reviewById ?? this.reviewById,
        publishById: publishById ?? this.publishById,
        createdDate: createdDate ?? this.createdDate,
        reviewDate: reviewDate ?? this.reviewDate,
        publishDate: publishDate ?? this.publishDate,
        slug: slug ?? this.slug,
        slugEng: slugEng ?? this.slugEng,
        isMigrasi: isMigrasi ?? this.isMigrasi,
        jenisPeraturanShort: jenisPeraturanShort ?? this.jenisPeraturanShort,
        idPeraturanMigrasi: idPeraturanMigrasi ?? this.idPeraturanMigrasi,
        tglPenetapanMigrasi: tglPenetapanMigrasi ?? this.tglPenetapanMigrasi,
        fileIdMigrasi: fileIdMigrasi ?? this.fileIdMigrasi,
        fileIdEnMigrasi: fileIdEnMigrasi ?? this.fileIdEnMigrasi,
        catatan: catatan ?? this.catatan,
        countReader: countReader ?? this.countReader,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        catatanEng: catatanEng ?? this.catatanEng,
        sumberPeraturan: sumberPeraturan ?? this.sumberPeraturan,
        sumberPeraturanEng: sumberPeraturanEng ?? this.sumberPeraturanEng,
        subjekPeraturan: subjekPeraturan ?? this.subjekPeraturan,
        subjekPeraturanEng: subjekPeraturanEng ?? this.subjekPeraturanEng,
        statusPeraturan: statusPeraturan ?? this.statusPeraturan,
        statusPeraturanEng: statusPeraturanEng ?? this.statusPeraturanEng,
        catatanVerifikator: catatanVerifikator ?? this.catatanVerifikator,
        approvedVerifikator: approvedVerifikator ?? this.approvedVerifikator,
        ditolakVerifikator: ditolakVerifikator ?? this.ditolakVerifikator,
        fileLampiran: fileLampiran ?? this.fileLampiran,
        deskripsiLampiran: deskripsiLampiran ?? this.deskripsiLampiran,
        fileAbstrak: fileAbstrak ?? this.fileAbstrak,
        fileAbstrakEng: fileAbstrakEng ?? this.fileAbstrakEng,
        tahunPeraturan: tahunPeraturan ?? this.tahunPeraturan,
        lokasi: lokasi ?? this.lokasi,
        tanggalPengundangan: tanggalPengundangan ?? this.tanggalPengundangan,
        subjek: subjek ?? this.subjek,
        namaPeraturan: namaPeraturan ?? this.namaPeraturan,
        namaPeraturanEng: namaPeraturanEng ?? this.namaPeraturanEng,
      );

  factory PeraturanSearch.fromJson(Map<String, dynamic> json) =>
      PeraturanSearch(
        id: json["id"],
        idProdukHukum: json["id_produk_hukum"],
        idJenisPeraturan: json["id_jenis_peraturan"],
        idLembaga: json["id_lembaga"],
        nomorPeraturanBaru: json["nomor_peraturan_baru"],
        filePeraturan: json["file_peraturan"],
        filePeraturanEng: json["file_peraturan_eng"],
        idSubjek: json["id_subjek"],
        idKlaster: json["id_klaster"],
        deskripsiTentang: json["deskripsi_tentang"],
        deskripsiTentangEng: json["deskripsi_tentang_eng"],
        idSumber: json["id_sumber"],
        abstrakPeraturan: json["abstrak_peraturan"],
        abstrakPeraturanEng: json["abstrak_peraturan_eng"],
        isActive: json["is_active"],
        isReview: json["is_review"],
        isPublish: json["is_publish"],
        createdById: json["created_by_id"],
        reviewById: json["review_by_id"],
        publishById: json["publish_by_id"],
        createdDate: json["created_date"],
        reviewDate: json["review_date"],
        publishDate: json["publish_date"],
        slug: json["slug"],
        slugEng: json["slug_eng"],
        isMigrasi: json["is_migrasi"],
        jenisPeraturanShort: json["jenis_peraturan_short"],
        idPeraturanMigrasi: json["id_peraturan_migrasi"],
        tglPenetapanMigrasi: json["tgl_penetapan_migrasi"] == null
            ? null
            : DateTime.parse(json["tgl_penetapan_migrasi"]),
        fileIdMigrasi: json["file_id_migrasi"],
        fileIdEnMigrasi: json["file_id_en_migrasi"],
        catatan: json["catatan"],
        countReader: json["count_reader"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        catatanEng: json["catatan_eng"],
        sumberPeraturan: json["sumber_peraturan"],
        sumberPeraturanEng: json["sumber_peraturan_eng"],
        subjekPeraturan: json["subjek_peraturan"],
        subjekPeraturanEng: json["subjek_peraturan_eng"],
        statusPeraturan: json["status_peraturan"],
        statusPeraturanEng: json["status_peraturan_eng"],
        catatanVerifikator: json["catatan_verifikator"],
        approvedVerifikator: json["approved_verifikator"],
        ditolakVerifikator: json["ditolak_verifikator"],
        fileLampiran: json["file_lampiran"],
        deskripsiLampiran: json["deskripsi_lampiran"],
        fileAbstrak: json["file_abstrak"],
        fileAbstrakEng: json["file_abstrak_eng"],
        tahunPeraturan: json["tahun_peraturan"],
        lokasi: json["lokasi"],
        tanggalPengundangan: json["tanggal_pengundangan"],
        subjek: json["subjek"],
        namaPeraturan: json["nama_peraturan"],
        namaPeraturanEng: json["nama_peraturan_eng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_produk_hukum": idProdukHukum,
        "id_jenis_peraturan": idJenisPeraturan,
        "id_lembaga": idLembaga,
        "nomor_peraturan_baru": nomorPeraturanBaru,
        "file_peraturan": filePeraturan,
        "file_peraturan_eng": filePeraturanEng,
        "id_subjek": idSubjek,
        "id_klaster": idKlaster,
        "deskripsi_tentang": deskripsiTentang,
        "deskripsi_tentang_eng": deskripsiTentangEng,
        "id_sumber": idSumber,
        "abstrak_peraturan": abstrakPeraturan,
        "abstrak_peraturan_eng": abstrakPeraturanEng,
        "is_active": isActive,
        "is_review": isReview,
        "is_publish": isPublish,
        "created_by_id": createdById,
        "review_by_id": reviewById,
        "publish_by_id": publishById,
        "created_date": createdDate,
        "review_date": reviewDate,
        "publish_date": publishDate,
        "slug": slug,
        "slug_eng": slugEng,
        "is_migrasi": isMigrasi,
        "jenis_peraturan_short": jenisPeraturanShort,
        "id_peraturan_migrasi": idPeraturanMigrasi,
        "tgl_penetapan_migrasi":
            "${tglPenetapanMigrasi!.year.toString().padLeft(4, '0')}-${tglPenetapanMigrasi!.month.toString().padLeft(2, '0')}-${tglPenetapanMigrasi!.day.toString().padLeft(2, '0')}",
        "file_id_migrasi": fileIdMigrasi,
        "file_id_en_migrasi": fileIdEnMigrasi,
        "catatan": catatan,
        "count_reader": countReader,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "catatan_eng": catatanEng,
        "sumber_peraturan": sumberPeraturan,
        "sumber_peraturan_eng": sumberPeraturanEng,
        "subjek_peraturan": subjekPeraturan,
        "subjek_peraturan_eng": subjekPeraturanEng,
        "status_peraturan": statusPeraturan,
        "status_peraturan_eng": statusPeraturanEng,
        "catatan_verifikator": catatanVerifikator,
        "approved_verifikator": approvedVerifikator,
        "ditolak_verifikator": ditolakVerifikator,
        "file_lampiran": fileLampiran,
        "deskripsi_lampiran": deskripsiLampiran,
        "file_abstrak": fileAbstrak,
        "file_abstrak_eng": fileAbstrakEng,
        "tahun_peraturan": tahunPeraturan,
        "lokasi": lokasi,
        "tanggal_pengundangan": tanggalPengundangan,
        "subjek": subjek,
        "nama_peraturan": namaPeraturan,
        "nama_peraturan_eng": namaPeraturanEng,
      };
}
