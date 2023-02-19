import 'dart:convert';

class AlatBerat {
  late String nomorBody;
  late String kategoriAlat;
  late String make;
  late String model;
  late String hmAkhir;
  late String kondisiSaatIni;
  late String lokasiSaatIni;
  late String statusKepemilikan;
  late String imageUrl;

  AlatBerat(
      {required this.nomorBody,
      required this.kategoriAlat,
      required this.make,
      required this.model,
      required this.hmAkhir,
      required this.kondisiSaatIni,
      required this.lokasiSaatIni,
      required this.imageUrl});

  AlatBerat.fromJson(Map<String, dynamic> value) {
    nomorBody = value['nomorBody'];
    kategoriAlat = value['kategoriAlat'];
    make = value['make'];
    model = value['model'];
    hmAkhir = value['hmAkhir'];
    kondisiSaatIni = value['kondisiSaatIni'];
    lokasiSaatIni = value['lokasiSaatIni'];
    imageUrl = value['imageUrl'];
  }

  static where(Function(dynamic element) param) {}
}

List<AlatBerat> parseAlatBerat(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => AlatBerat.fromJson(json)).toList();
}
