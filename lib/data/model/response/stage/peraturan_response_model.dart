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
  final String? nomorPeraturanBaru;
  final int? id;
  final String? tahunPengundangan;
  final DateTime? tanggalPengundangan;
  final Jenis? jenis;
  final String? judul;
  final SingkatanJenis? singkatanJenis;
  final TempatTerbit? tempatTerbit;
  final SubjekEnum? sumber;
  final dynamic subjek;
  final dynamic status;
  final Bahasa? bahasa;
  final BidangHukum? bidangHukum;
  final TeuBadan? teuBadan;
  final String? fileDownload;
  final String? urlDownload;
  final String? urlDetailPeraturan;
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
    Jenis? jenis,
    String? judul,
    SingkatanJenis? singkatanJenis,
    TempatTerbit? tempatTerbit,
    SubjekEnum? sumber,
    dynamic subjek,
    dynamic status,
    Bahasa? bahasa,
    BidangHukum? bidangHukum,
    TeuBadan? teuBadan,
    String? fileDownload,
    String? urlDownload,
    String? urlDetailPeraturan,
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
        jenis: jenisValues.map[json["jenis"]]!,
        judul: json["judul"],
        singkatanJenis: singkatanJenisValues.map[json["singkatanJenis"]]!,
        tempatTerbit: tempatTerbitValues.map[json["tempatTerbit"]]!,
        sumber: subjekEnumValues.map[json["sumber"]]!,
        subjek: json["subjek"],
        status: json["status"],
        bahasa: bahasaValues.map[json["bahasa"]]!,
        bidangHukum: bidangHukumValues.map[json["bidangHukum"]]!,
        teuBadan: teuBadanValues.map[json["teuBadan"]]!,
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
        "jenis": jenisValues.reverse[jenis],
        "judul": judul,
        "singkatanJenis": singkatanJenisValues.reverse[singkatanJenis],
        "tempatTerbit": tempatTerbitValues.reverse[tempatTerbit],
        "sumber": subjekEnumValues.reverse[sumber],
        "subjek": subjek,
        "status": status,
        "bahasa": bahasaValues.reverse[bahasa],
        "bidangHukum": bidangHukumValues.reverse[bidangHukum],
        "teuBadan": teuBadanValues.reverse[teuBadan],
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

enum Bahasa { EMPTY, INDONESIA, INDONESIA_ENGLISH }

final bahasaValues = EnumValues({
  "": Bahasa.EMPTY,
  "Indonesia": Bahasa.INDONESIA,
  "Indonesia,English": Bahasa.INDONESIA_ENGLISH
});

enum BidangHukum {
  HUKUM_ADMINISTRASI_NEGARA,
  HUKUM_AGRARIA,
  HUKUM_DAGANG,
  HUKUM_INTERNASIONAL,
  HUKUM_ISLAM,
  HUKUM_LINGKUNGAN,
  HUKUM_PERBURUHAN,
  HUKUM_PERDATA,
  HUKUM_PIDANA,
  HUKUM_TATA_NEGARA,
  HUKUM_UMUM
}

final bidangHukumValues = EnumValues({
  "Hukum Administrasi Negara": BidangHukum.HUKUM_ADMINISTRASI_NEGARA,
  "Hukum Agraria": BidangHukum.HUKUM_AGRARIA,
  "Hukum Dagang": BidangHukum.HUKUM_DAGANG,
  "Hukum Internasional": BidangHukum.HUKUM_INTERNASIONAL,
  "Hukum Islam": BidangHukum.HUKUM_ISLAM,
  "Hukum Lingkungan": BidangHukum.HUKUM_LINGKUNGAN,
  "Hukum Perburuhan": BidangHukum.HUKUM_PERBURUHAN,
  "Hukum Perdata": BidangHukum.HUKUM_PERDATA,
  "Hukum Pidana": BidangHukum.HUKUM_PIDANA,
  "Hukum Tata Negara": BidangHukum.HUKUM_TATA_NEGARA,
  "Hukum Umum": BidangHukum.HUKUM_UMUM
});

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

enum DetailNamaStatus { BARU, DICABUT, DIUBAH, MENCABUT, MENGUBAH }

final detailNamaStatusValues = EnumValues({
  "Baru": DetailNamaStatus.BARU,
  "Dicabut": DetailNamaStatus.DICABUT,
  "Diubah": DetailNamaStatus.DIUBAH,
  "Mencabut": DetailNamaStatus.MENCABUT,
  "Mengubah": DetailNamaStatus.MENGUBAH
});

enum Jenis {
  INSTRUKSI_PRESIDEN,
  KEPUTUSAN_MENTERI_BUMN,
  KEPUTUSAN_MENTERI_LAINNYA,
  KEPUTUSAN_PRESIDEN,
  PERATURAN_DIREKSI,
  PERATURAN_GUBERNUR,
  PERATURAN_MAHKAMAH_AGUNG,
  PERATURAN_MENTERI_BUMN,
  PERATURAN_MENTERI_LAINNYA,
  PERATURAN_PEMERINTAH,
  PERATURAN_PEMERINTAH_PENGGANTI_UNDANG_UNDANG,
  PERATURAN_PRESIDEN,
  PERATURAN_TK_ESELON_I_LAINNYA,
  PUTUSAN_MAHKAMAH_KONSTITUSI,
  SURAT_EDARAN_LAINNYA,
  SURAT_EDARAN_MENTERI_BUMN,
  SURAT_EDARAN_SEKRETARIS_KEMENTERIAN_BUMN,
  UNDANG_UNDANG
}

final jenisValues = EnumValues({
  "Instruksi Presiden": Jenis.INSTRUKSI_PRESIDEN,
  "Keputusan Menteri BUMN": Jenis.KEPUTUSAN_MENTERI_BUMN,
  "Keputusan Menteri Lainnya": Jenis.KEPUTUSAN_MENTERI_LAINNYA,
  "Keputusan Presiden": Jenis.KEPUTUSAN_PRESIDEN,
  "Peraturan Direksi": Jenis.PERATURAN_DIREKSI,
  "Peraturan Gubernur": Jenis.PERATURAN_GUBERNUR,
  "Peraturan Mahkamah Agung": Jenis.PERATURAN_MAHKAMAH_AGUNG,
  "Peraturan Menteri BUMN": Jenis.PERATURAN_MENTERI_BUMN,
  "Peraturan Menteri Lainnya": Jenis.PERATURAN_MENTERI_LAINNYA,
  "Peraturan Pemerintah": Jenis.PERATURAN_PEMERINTAH,
  "Peraturan Pemerintah Pengganti Undang-Undang":
      Jenis.PERATURAN_PEMERINTAH_PENGGANTI_UNDANG_UNDANG,
  "Peraturan Presiden": Jenis.PERATURAN_PRESIDEN,
  "Peraturan Tk Eselon I Lainnya": Jenis.PERATURAN_TK_ESELON_I_LAINNYA,
  "Putusan Mahkamah Konstitusi": Jenis.PUTUSAN_MAHKAMAH_KONSTITUSI,
  "Surat Edaran Lainnya": Jenis.SURAT_EDARAN_LAINNYA,
  "Surat Edaran Menteri BUMN": Jenis.SURAT_EDARAN_MENTERI_BUMN,
  "Surat Edaran Sekretaris Kementerian BUMN":
      Jenis.SURAT_EDARAN_SEKRETARIS_KEMENTERIAN_BUMN,
  "Undang-Undang": Jenis.UNDANG_UNDANG
});

enum SingkatanJenis {
  INPRES,
  KEPDIR,
  KEPMEN,
  KEPMENBUMN,
  KEPPRES,
  PERATURAN_TK_ESELON_I,
  PERDIR,
  PERGUB,
  PERMA,
  PERMEN,
  PERMENBUMN,
  PERPRES,
  PERPU,
  PP,
  PUTUSAN_MK,
  SEMENBUMN,
  SESMEN,
  SE_LAIN,
  UU
}

final singkatanJenisValues = EnumValues({
  "INPRES": SingkatanJenis.INPRES,
  "KEPDIR": SingkatanJenis.KEPDIR,
  "KEPMEN": SingkatanJenis.KEPMEN,
  "KEPMENBUMN": SingkatanJenis.KEPMENBUMN,
  "KEPPRES": SingkatanJenis.KEPPRES,
  "Peraturan Tk Eselon I": SingkatanJenis.PERATURAN_TK_ESELON_I,
  "PERDIR": SingkatanJenis.PERDIR,
  "PERGUB": SingkatanJenis.PERGUB,
  "PERMA": SingkatanJenis.PERMA,
  "PERMEN": SingkatanJenis.PERMEN,
  "PERMENBUMN": SingkatanJenis.PERMENBUMN,
  "PERPRES": SingkatanJenis.PERPRES,
  "PERPU": SingkatanJenis.PERPU,
  "PP": SingkatanJenis.PP,
  "Putusan MK": SingkatanJenis.PUTUSAN_MK,
  "SEMENBUMN": SingkatanJenis.SEMENBUMN,
  "SESMEN": SingkatanJenis.SESMEN,
  "SE LAIN": SingkatanJenis.SE_LAIN,
  "UU": SingkatanJenis.UU
});

enum SubjekEnum {
  BN,
  BN_LL_KBUMN,
  EMPTY,
  LL,
  LL_BN,
  LL_KBUMN,
  LL_KBUMN_BN,
  LN,
  LN_LL,
  TLN_LN
}

final subjekEnumValues = EnumValues({
  "BN": SubjekEnum.BN,
  "BN, LL KBUMN": SubjekEnum.BN_LL_KBUMN,
  "-": SubjekEnum.EMPTY,
  "LL": SubjekEnum.LL,
  "LL, BN": SubjekEnum.LL_BN,
  "LL KBUMN": SubjekEnum.LL_KBUMN,
  "LL KBUMN, BN": SubjekEnum.LL_KBUMN_BN,
  "LN": SubjekEnum.LN,
  "LN, LL": SubjekEnum.LN_LL,
  "TLN, LN": SubjekEnum.TLN_LN
});

enum TempatTerbit { JAKARTA }

final tempatTerbitValues = EnumValues({"Jakarta": TempatTerbit.JAKARTA});

enum TeuBadan {
  KEMENTERIAN_AGRARIA_DAN_TATA_RUANG_BADAN_PERTANAHAN_NASIONAL,
  KEMENTERIAN_BADAN_USAHA_MILIK_NEGARA,
  KEMENTERIAN_BUMN,
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
