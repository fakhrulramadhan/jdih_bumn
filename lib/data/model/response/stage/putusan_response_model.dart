// To parse this JSON data, do
//
//     final putusanResponseModel = putusanResponseModelFromJson(jsonString);

import 'dart:convert';

PutusanResponseModel putusanResponseModelFromJson(String str) =>
    PutusanResponseModel.fromJson(json.decode(str));

String putusanResponseModelToJson(PutusanResponseModel data) =>
    json.encode(data.toJson());

class PutusanResponseModel {
  final List<Item>? items;

  PutusanResponseModel({
    this.items,
  });

  PutusanResponseModel copyWith({
    List<Item>? items,
  }) =>
      PutusanResponseModel(
        items: items ?? this.items,
      );

  factory PutusanResponseModel.fromRawJson(String str) =>
      PutusanResponseModel.fromJson(json.decode(str));

  factory PutusanResponseModel.fromJson(Map<String, dynamic> json) =>
      PutusanResponseModel(
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
  final int? id;
  final int? idProdukHukum;
  final dynamic idJenisPutusan;
  final String? nomorPutusan;
  final String? nomorPerkara;
  final String? penggugat;
  final String? tergugat;
  final String? objekGugatan;
  final dynamic objekPerkara;
  final dynamic petitum;
  final dynamic idBumn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isPublish;
  final dynamic publishDate;
  final dynamic publishedById;
  final String? filePutusan;
  final String? filePutusanEng;
  final String? slug;
  final String? slugEng;
  final dynamic catatanVerifikator;
  final dynamic createdById;
  final bool? approvedVerifikator;
  final bool? ditolakVerifikator;
  final dynamic idSumber;
  final int? idSubjek;
  final dynamic bahasa;
  final dynamic lokasi;
  final dynamic idKotaLokasi;
  final dynamic fileLampiran;
  final String? deskripsiLampiran;
  final dynamic statusPutusan;
  final String? judul;
  final String? judulEng;
  final dynamic teuBadan;
  final DateTime? tglPenetapan;
  final dynamic kotaLokasi;
  final dynamic jenisPeradilan;
  final dynamic singkatanPeradilan;
  final dynamic namaSumber;
  final dynamic singkatanSumber;
  final dynamic namaSubjek;
  final String? bidangHukum;
  final dynamic putusanStatus;
  final String? urlDetailPutusan;
  final String? urlDetailFilePutusan;

  Item({
    this.id,
    this.idProdukHukum,
    this.idJenisPutusan,
    this.nomorPutusan,
    this.nomorPerkara,
    this.penggugat,
    this.tergugat,
    this.objekGugatan,
    this.objekPerkara,
    this.petitum,
    this.idBumn,
    this.createdAt,
    this.updatedAt,
    this.isPublish,
    this.publishDate,
    this.publishedById,
    this.filePutusan,
    this.filePutusanEng,
    this.slug,
    this.slugEng,
    this.catatanVerifikator,
    this.createdById,
    this.approvedVerifikator,
    this.ditolakVerifikator,
    this.idSumber,
    this.idSubjek,
    this.bahasa,
    this.lokasi,
    this.idKotaLokasi,
    this.fileLampiran,
    this.deskripsiLampiran,
    this.statusPutusan,
    this.judul,
    this.judulEng,
    this.teuBadan,
    this.tglPenetapan,
    this.kotaLokasi,
    this.jenisPeradilan,
    this.singkatanPeradilan,
    this.namaSumber,
    this.singkatanSumber,
    this.namaSubjek,
    this.bidangHukum,
    this.putusanStatus,
    this.urlDetailPutusan,
    this.urlDetailFilePutusan,
  });

  Item copyWith({
    int? id,
    int? idProdukHukum,
    dynamic idJenisPutusan,
    String? nomorPutusan,
    String? nomorPerkara,
    String? penggugat,
    String? tergugat,
    String? objekGugatan,
    dynamic objekPerkara,
    dynamic petitum,
    dynamic idBumn,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPublish,
    dynamic publishDate,
    dynamic publishedById,
    String? filePutusan,
    String? filePutusanEng,
    String? slug,
    String? slugEng,
    dynamic catatanVerifikator,
    dynamic createdById,
    bool? approvedVerifikator,
    bool? ditolakVerifikator,
    dynamic idSumber,
    int? idSubjek,
    dynamic bahasa,
    dynamic lokasi,
    dynamic idKotaLokasi,
    dynamic fileLampiran,
    String? deskripsiLampiran,
    dynamic statusPutusan,
    String? judul,
    String? judulEng,
    dynamic teuBadan,
    DateTime? tglPenetapan,
    dynamic kotaLokasi,
    dynamic jenisPeradilan,
    dynamic singkatanPeradilan,
    dynamic namaSumber,
    dynamic singkatanSumber,
    dynamic namaSubjek,
    String? bidangHukum,
    dynamic putusanStatus,
    String? urlDetailPutusan,
    String? urlDetailFilePutusan,
  }) =>
      Item(
        id: id ?? this.id,
        idProdukHukum: idProdukHukum ?? this.idProdukHukum,
        idJenisPutusan: idJenisPutusan ?? this.idJenisPutusan,
        nomorPutusan: nomorPutusan ?? this.nomorPutusan,
        nomorPerkara: nomorPerkara ?? this.nomorPerkara,
        penggugat: penggugat ?? this.penggugat,
        tergugat: tergugat ?? this.tergugat,
        objekGugatan: objekGugatan ?? this.objekGugatan,
        objekPerkara: objekPerkara ?? this.objekPerkara,
        petitum: petitum ?? this.petitum,
        idBumn: idBumn ?? this.idBumn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isPublish: isPublish ?? this.isPublish,
        publishDate: publishDate ?? this.publishDate,
        publishedById: publishedById ?? this.publishedById,
        filePutusan: filePutusan ?? this.filePutusan,
        filePutusanEng: filePutusanEng ?? this.filePutusanEng,
        slug: slug ?? this.slug,
        slugEng: slugEng ?? this.slugEng,
        catatanVerifikator: catatanVerifikator ?? this.catatanVerifikator,
        createdById: createdById ?? this.createdById,
        approvedVerifikator: approvedVerifikator ?? this.approvedVerifikator,
        ditolakVerifikator: ditolakVerifikator ?? this.ditolakVerifikator,
        idSumber: idSumber ?? this.idSumber,
        idSubjek: idSubjek ?? this.idSubjek,
        bahasa: bahasa ?? this.bahasa,
        lokasi: lokasi ?? this.lokasi,
        idKotaLokasi: idKotaLokasi ?? this.idKotaLokasi,
        fileLampiran: fileLampiran ?? this.fileLampiran,
        deskripsiLampiran: deskripsiLampiran ?? this.deskripsiLampiran,
        statusPutusan: statusPutusan ?? this.statusPutusan,
        judul: judul ?? this.judul,
        judulEng: judulEng ?? this.judulEng,
        teuBadan: teuBadan ?? this.teuBadan,
        tglPenetapan: tglPenetapan ?? this.tglPenetapan,
        kotaLokasi: kotaLokasi ?? this.kotaLokasi,
        jenisPeradilan: jenisPeradilan ?? this.jenisPeradilan,
        singkatanPeradilan: singkatanPeradilan ?? this.singkatanPeradilan,
        namaSumber: namaSumber ?? this.namaSumber,
        singkatanSumber: singkatanSumber ?? this.singkatanSumber,
        namaSubjek: namaSubjek ?? this.namaSubjek,
        bidangHukum: bidangHukum ?? this.bidangHukum,
        putusanStatus: putusanStatus ?? this.putusanStatus,
        urlDetailPutusan: urlDetailPutusan ?? this.urlDetailPutusan,
        urlDetailFilePutusan: urlDetailFilePutusan ?? this.urlDetailFilePutusan,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        idProdukHukum: json["id_produk_hukum"],
        idJenisPutusan: json["id_jenis_putusan"],
        nomorPutusan: json["nomor_putusan"],
        nomorPerkara: json["nomor_perkara"],
        penggugat: json["penggugat"],
        tergugat: json["tergugat"],
        objekGugatan: json["objek_gugatan"],
        objekPerkara: json["objek_perkara"],
        petitum: json["petitum"],
        idBumn: json["id_bumn"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isPublish: json["is_publish"],
        publishDate: json["publish_date"],
        publishedById: json["published_by_id"],
        filePutusan: json["file_putusan"],
        filePutusanEng: json["file_putusan_eng"],
        slug: json["slug"],
        slugEng: json["slug_eng"],
        catatanVerifikator: json["catatan_verifikator"],
        createdById: json["created_by_id"],
        approvedVerifikator: json["approved_verifikator"],
        ditolakVerifikator: json["ditolak_verifikator"],
        idSumber: json["id_sumber"],
        idSubjek: json["id_subjek"],
        bahasa: json["bahasa"],
        lokasi: json["lokasi"],
        idKotaLokasi: json["id_kota_lokasi"],
        fileLampiran: json["file_lampiran"],
        deskripsiLampiran: json["deskripsi_lampiran"],
        statusPutusan: json["status_putusan"],
        judul: json["judul"],
        judulEng: json["judul_eng"],
        teuBadan: json["teu_badan"],
        tglPenetapan: json["tgl_penetapan"] == null
            ? null
            : DateTime.parse(json["tgl_penetapan"]),
        kotaLokasi: json["kota_lokasi"],
        jenisPeradilan: json["jenis_peradilan"],
        singkatanPeradilan: json["singkatan_peradilan"],
        namaSumber: json["nama_sumber"],
        singkatanSumber: json["singkatan_sumber"],
        namaSubjek: json["nama_subjek"],
        bidangHukum: json["bidang_hukum"],
        putusanStatus: json["putusan_status"],
        urlDetailPutusan: json["urlDetailPutusan"],
        urlDetailFilePutusan: json["urlDetailFilePutusan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_produk_hukum": idProdukHukum,
        "id_jenis_putusan": idJenisPutusan,
        "nomor_putusan": nomorPutusan,
        "nomor_perkara": nomorPerkara,
        "penggugat": penggugat,
        "tergugat": tergugat,
        "objek_gugatan": objekGugatan,
        "objek_perkara": objekPerkara,
        "petitum": petitum,
        "id_bumn": idBumn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_publish": isPublish,
        "publish_date": publishDate,
        "published_by_id": publishedById,
        "file_putusan": filePutusan,
        "file_putusan_eng": filePutusanEng,
        "slug": slug,
        "slug_eng": slugEng,
        "catatan_verifikator": catatanVerifikator,
        "created_by_id": createdById,
        "approved_verifikator": approvedVerifikator,
        "ditolak_verifikator": ditolakVerifikator,
        "id_sumber": idSumber,
        "id_subjek": idSubjek,
        "bahasa": bahasa,
        "lokasi": lokasi,
        "id_kota_lokasi": idKotaLokasi,
        "file_lampiran": fileLampiran,
        "deskripsi_lampiran": deskripsiLampiran,
        "status_putusan": statusPutusan,
        "judul": judul,
        "judul_eng": judulEng,
        "teu_badan": teuBadan,
        "tgl_penetapan":
            "${tglPenetapan!.year.toString().padLeft(4, '0')}-${tglPenetapan!.month.toString().padLeft(2, '0')}-${tglPenetapan!.day.toString().padLeft(2, '0')}",
        "kota_lokasi": kotaLokasi,
        "jenis_peradilan": jenisPeradilan,
        "singkatan_peradilan": singkatanPeradilan,
        "nama_sumber": namaSumber,
        "singkatan_sumber": singkatanSumber,
        "nama_subjek": namaSubjek,
        "bidang_hukum": bidangHukum,
        "putusan_status": putusanStatus,
        "urlDetailPutusan": urlDetailPutusan,
        "urlDetailFilePutusan": urlDetailFilePutusan,
      };
}
