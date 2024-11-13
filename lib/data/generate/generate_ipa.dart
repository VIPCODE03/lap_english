import '../../gen/assets.gen.dart';
import '../model/learn/ipa.dart';

List<IPA> generateIPAVowels() {
  return [
    IPA('/ɪ/', Assets.sounds.ipa.vowels.iNgN),  // Đường dẫn đến âm "i ngắn"
    IPA('/i:/', Assets.sounds.ipa.vowels.iDI),  // Đường dẫn đến âm "i dài"
    IPA('/e/', Assets.sounds.ipa.vowels.e),     // Đường dẫn đến âm "e"
    IPA('/ə/', Assets.sounds.ipa.vowels.aNgNMp3_),  // Đường dẫn đến âm "ơ ngắn"
    IPA('/ɜ:/', Assets.sounds.ipa.vowels.aDIMp3_),  // Đường dẫn đến âm "ơ dài"
    IPA('/ʊ/', Assets.sounds.ipa.vowels.uNgN),  // Đường dẫn đến âm "u ngắn"
    IPA('/u:/', Assets.sounds.ipa.vowels.uDI),  // Đường dẫn đến âm "u dài"
    IPA('/ɒ/', Assets.sounds.ipa.vowels.oNgN),  // Đường dẫn đến âm "o ngắn"
    IPA('/ɔ:/', Assets.sounds.ipa.vowels.oDI),  // Đường dẫn đến âm "o dài"
    IPA('/ʌ/', Assets.sounds.ipa.vowels.aNgNMp3),  // Đường dẫn đến âm "a ngắn"
    IPA('/ɑ:/', Assets.sounds.ipa.vowels.aDIMp3),  // Đường dẫn đến âm "a dài"
    IPA('/æ/', Assets.sounds.ipa.vowels.ae),    // Đường dẫn đến âm "ae"
    IPA('/ɪə/', Assets.sounds.ipa.vowels.ie),   // Đường dẫn đến âm "ie"
    IPA('/eə/', Assets.sounds.ipa.vowels.ea),   // Đường dẫn đến âm "ea"
    IPA('/eɪ/', Assets.sounds.ipa.vowels.ei),   // Đường dẫn đến âm "ei"
    IPA('/ɔɪ/', Assets.sounds.ipa.vowels.oi),   // Đường dẫn đến âm "oi"
    IPA('/aɪ/', Assets.sounds.ipa.vowels.aMp3), // Đường dẫn đến âm "aɪ"
    IPA('/əʊ/', Assets.sounds.ipa.vowels.aMp3__),  // Đường dẫn đến âm "əʊ"
    IPA('/aʊ/', Assets.sounds.ipa.vowels.aMp3_),   // Đường dẫn đến âm "aʊ"
    IPA('/ʊə/', Assets.sounds.ipa.vowels.aMp3___), // Đường dẫn đến âm "ʊə"
  ];
}

List<IPA> generateIPAConsonants() {
  return [
    IPA('/p/', Assets.sounds.ipa.consonants.p),        // Đường dẫn đến âm "p"
    IPA('/b/', Assets.sounds.ipa.consonants.b),        // Đường dẫn đến âm "b"
    IPA('/t/', Assets.sounds.ipa.consonants.tMp3),     // Đường dẫn đến âm "t"
    IPA('/d/', Assets.sounds.ipa.consonants.dMp3),     // Đường dẫn đến âm "d"
    IPA('/t∫/', Assets.sounds.ipa.consonants.tMp3_),   // Đường dẫn đến âm "t∫"
    IPA('/dʒ/', Assets.sounds.ipa.consonants.dMp3_),   // Đường dẫn đến âm "dʒ"
    IPA('/k/', Assets.sounds.ipa.consonants.k),        // Đường dẫn đến âm "k"
    IPA('/g/', Assets.sounds.ipa.consonants.g),        // Đường dẫn đến âm "g"
    IPA('/f/', Assets.sounds.ipa.consonants.f),        // Đường dẫn đến âm "f"
    IPA('/v/', Assets.sounds.ipa.consonants.v),        // Đường dẫn đến âm "v"
    IPA('/ð/', Assets.sounds.ipa.consonants.aMp3),     // Đường dẫn đến âm "ð"
    IPA('/θ/', Assets.sounds.ipa.consonants.aMp3___),  // Đường dẫn đến âm "θ"
    IPA('/s/', Assets.sounds.ipa.consonants.s),        // Đường dẫn đến âm "s"
    IPA('/z/', Assets.sounds.ipa.consonants.z),        // Đường dẫn đến âm "z"
    IPA('/∫/', Assets.sounds.ipa.consonants.aMp3____), // Đường dẫn đến âm "∫"
    IPA('/ʒ/', Assets.sounds.ipa.consonants.aMp3_),    // Đường dẫn đến âm "ʒ"
    IPA('/m/', Assets.sounds.ipa.consonants.m),        // Đường dẫn đến âm "m"
    IPA('/n/', Assets.sounds.ipa.consonants.n),        // Đường dẫn đến âm "n"
    IPA('/ŋ/', Assets.sounds.ipa.consonants.aMp3__),   // Đường dẫn đến âm "ŋ"
    IPA('/h/', Assets.sounds.ipa.consonants.h),        // Đường dẫn đến âm "h"
    IPA('/l/', Assets.sounds.ipa.consonants.l),        // Đường dẫn đến âm "l"
    IPA('/r/', Assets.sounds.ipa.consonants.r),        // Đường dẫn đến âm "r"
    IPA('/w/', Assets.sounds.ipa.consonants.w),        // Đường dẫn đến âm "w"
    IPA('/j/', Assets.sounds.ipa.consonants.j),        // Đường dẫn đến âm "j"
  ];
}
