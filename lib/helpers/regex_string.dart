// void main() {
// // [\s\S]*
// // [\w\W]*
// // [\d\D]*
// // Explanation:
// // \s: whitespace \S: not whitespace
// // \w: word \W: not word
// // \d: digit \D: not digit
// // (You can exchange the * for + if you want 1 or MORE characters
// // [instead of 0 or more]).

/*

Ini contoh awal

splitStringAndNumber(String namaUnit) {
  final regExp1 = RegExp(r'[a-z A-Z]\w*\D');
  final regExp2 = RegExp(r'[0-9]\w*');
  final huruf = regExp1.stringMatch(namaUnit);
  final angka = regExp2.stringMatch(namaUnit);
  final noBody = "$huruf-$angka";
  final noBody2 = "$huruf-samgroup";

  angka != null ? print(noBody.toUpperCase()) : print(noBody2.toUpperCase());
}
*/

splitStringAndNumber(String namaUnit) {
  final regExp1 = RegExp(r'[a-z A-Z]\w*\D');
  final regExp2 = RegExp(r'[0-9]\w*');
  final huruf = regExp1.stringMatch(namaUnit.replaceAll(RegExp('\\s*'), ''));
  final angka = regExp2.stringMatch(namaUnit);
  final noBody = "$huruf-$angka";
  final noBody2 = "$huruf-samgroup";

  final nomorBody =
      angka != null ? noBody.toUpperCase() : noBody2.toUpperCase();

  return nomorBody;
}

//method [main] disini akan digunakan
//hanya untuk test regex di atas
// void main() {
//   print(splitStringAndNumber(('Crane Kator')));
// }
