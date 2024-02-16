// To parse this JSON data, do
//
//     final produkHukumResponseModel = produkHukumResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProdukHukumResponseModel> produkHukumResponseModelFromJson(String str) =>
    List<ProdukHukumResponseModel>.from(
        json.decode(str).map((x) => ProdukHukumResponseModel.fromJson(x)));

String produkHukumResponseModelToJson(List<ProdukHukumResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdukHukumResponseModel {
  final int? idData;
  final String? tahunPengundangan;
  final DateTime? tanggalPengundangan;
  final String? jenis;
  final String? noPeraturan;
  final String? judul;
  final String? noPanggil;
  final BidangHukum? singkatanJenis;
  final TempatTerbit? tempatTerbit;
  final String? penerbit;
  final String? deskripsiFisik;
  final Sumber? sumber;
  final String? subjek;
  final String? isbn;
  final Status? status;
  final Bahasa? bahasa;
  final BidangHukum? bidangHukum;
  final TeuBadan? teuBadan;
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
    BidangHukum? singkatanJenis,
    TempatTerbit? tempatTerbit,
    String? penerbit,
    String? deskripsiFisik,
    Sumber? sumber,
    String? subjek,
    String? isbn,
    Status? status,
    Bahasa? bahasa,
    BidangHukum? bidangHukum,
    TeuBadan? teuBadan,
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
        singkatanJenis: bidangHukumValues.map[json["singkatanJenis"]]!,
        tempatTerbit: tempatTerbitValues.map[json["tempatTerbit"]]!,
        penerbit: json["penerbit"],
        deskripsiFisik: json["deskripsiFisik"],
        sumber: sumberValues.map[json["sumber"]]!,
        subjek: json["subjek"],
        isbn: json["isbn"],
        status: statusValues.map[json["status"]]!,
        bahasa: bahasaValues.map[json["bahasa"]]!,
        bidangHukum: bidangHukumValues.map[json["bidangHukum"]]!,
        teuBadan: teuBadanValues.map[json["teuBadan"]]!,
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
        "singkatanJenis": bidangHukumValues.reverse[singkatanJenis],
        "tempatTerbit": tempatTerbitValues.reverse[tempatTerbit],
        "penerbit": penerbit,
        "deskripsiFisik": deskripsiFisik,
        "sumber": sumberValues.reverse[sumber],
        "subjek": subjek,
        "isbn": isbn,
        "status": statusValues.reverse[status],
        "bahasa": bahasaValues.reverse[bahasa],
        "bidangHukum": bidangHukumValues.reverse[bidangHukum],
        "teuBadan": teuBadanValues.reverse[teuBadan],
        "nomorIndukBuku": nomorIndukBuku,
        "fileDownload": fileDownload,
        "urlDownload": urlDownload,
        "urlDetailPeraturan": urlDetailPeraturan,
        "operasi": operasi,
        "display": display,
      };
}

enum Bahasa { BAHASA, EMPTY, INDONESIA, INDONESIA_ENGLISH }

final bahasaValues = EnumValues({
  "-": Bahasa.BAHASA,
  "": Bahasa.EMPTY,
  "Indonesia": Bahasa.INDONESIA,
  "Indonesia,English": Bahasa.INDONESIA_ENGLISH
});

enum BidangHukum {
  EMPTY,
  KEPDIR,
  KEPMEN,
  KEPMENBUMN,
  KEPPRES,
  PERATURAN_TK_ESELON_I,
  PERDIR,
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

final bidangHukumValues = EnumValues({
  "-": BidangHukum.EMPTY,
  "KEPDIR": BidangHukum.KEPDIR,
  "KEPMEN": BidangHukum.KEPMEN,
  "KEPMENBUMN": BidangHukum.KEPMENBUMN,
  "KEPPRES": BidangHukum.KEPPRES,
  "Peraturan Tk Eselon I": BidangHukum.PERATURAN_TK_ESELON_I,
  "PERDIR": BidangHukum.PERDIR,
  "PERGUB": BidangHukum.PERGUB,
  "PERMEN": BidangHukum.PERMEN,
  "PERMENBUMN": BidangHukum.PERMENBUMN,
  "PERPRES": BidangHukum.PERPRES,
  "PERPU": BidangHukum.PERPU,
  "PP": BidangHukum.PP,
  "SEMENBUMN": BidangHukum.SEMENBUMN,
  "SE LAIN": BidangHukum.SE_LAIN,
  "UU": BidangHukum.UU
});

enum Status { BERLAKU, TIDAK_BERLAKU }

final statusValues = EnumValues(
    {"Berlaku": Status.BERLAKU, "Tidak Berlaku": Status.TIDAK_BERLAKU});

enum Sumber {
  BN,
  BN_LL_KBUMN,
  EMPTY,
  LL,
  LL_KBUMN,
  LL_KBUMN_BN,
  LN,
  THE_202211,
  THE_202213,
  THE_202214,
  THE_202215,
  THE_20233,
  THE_20234
}

final sumberValues = EnumValues({
  "BN": Sumber.BN,
  "BN, LL KBUMN": Sumber.BN_LL_KBUMN,
  "-": Sumber.EMPTY,
  "LL": Sumber.LL,
  "LL KBUMN": Sumber.LL_KBUMN,
  "LL KBUMN, BN": Sumber.LL_KBUMN_BN,
  "LN": Sumber.LN,
  "2022; 11": Sumber.THE_202211,
  "2022; 13": Sumber.THE_202213,
  "2022; 14": Sumber.THE_202214,
  "2022; 15": Sumber.THE_202215,
  "2023; 3": Sumber.THE_20233,
  "2023; 4": Sumber.THE_20234
});

enum TempatTerbit { EMPTY, JAKARTA }

final tempatTerbitValues =
    EnumValues({"-": TempatTerbit.EMPTY, "Jakarta": TempatTerbit.JAKARTA});

enum TeuBadan {
  AMILIYA_HANDAYANI,
  EMPTY,
  IRFAN_MAULANA_MUHARIKIN,
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
  KOMISI_PEMBERANTASAN_KORUPSI,
  NI_WAYAN_NITYA_VARSHINI_SAHARE,
  NUR_HAFNI,
  RR_HALIMATU_HIRA,
  RUDI_R,
  RUDI_RUSLI,
  SUKENDAR_S_H_M_H,
  YOGI_SAYOGI_PAMUNGKAS_S_E
}

final teuBadanValues = EnumValues({
  "Amiliya Handayani": TeuBadan.AMILIYA_HANDAYANI,
  "-": TeuBadan.EMPTY,
  "Irfan Maulana Muharikin": TeuBadan.IRFAN_MAULANA_MUHARIKIN,
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
  "Komisi Pemberantasan Korupsi": TeuBadan.KOMISI_PEMBERANTASAN_KORUPSI,
  "Ni Wayan Nitya Varshini Sahare": TeuBadan.NI_WAYAN_NITYA_VARSHINI_SAHARE,
  "Nur Hafni": TeuBadan.NUR_HAFNI,
  "Rr. Halimatu Hira": TeuBadan.RR_HALIMATU_HIRA,
  "Rudi R": TeuBadan.RUDI_R,
  "Rudi Rusli": TeuBadan.RUDI_RUSLI,
  "Sukendar S.H.,M.H.": TeuBadan.SUKENDAR_S_H_M_H,
  "Yogi Sayogi Pamungkas, S.E.": TeuBadan.YOGI_SAYOGI_PAMUNGKAS_S_E
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
