import '../../gen/assets.gen.dart';
import '../model/learn/ipa.dart';

class IPAProvider {
  static List<IPA> ipaVowels() {
    return [
      IPA(1, 'ɪ', 'bit', Assets.sounds.ipa.vowels.iNgN), // Âm "ɪ" trong "bit"
      IPA(2, 'i:', 'beat', Assets.sounds.ipa.vowels.iDI), // Âm "i:" trong "beat"
      IPA(3, 'e', 'bed', Assets.sounds.ipa.vowels.e), // Âm "e" trong "bed"
      IPA(4, 'ə', 'about', Assets.sounds.ipa.vowels.aNgNMp3_), // Âm "ə" trong "about"
      IPA(5, 'ɜ:', 'bird', Assets.sounds.ipa.vowels.aDIMp3_), // Âm "ɜ:" trong "bird"
      IPA(6, 'ʊ', 'foot', Assets.sounds.ipa.vowels.uNgN), // Âm "ʊ" trong "foot"
      IPA(7, 'u:', 'food', Assets.sounds.ipa.vowels.uDI), // Âm "u:" trong "food"
      IPA(8, 'ɒ', 'hot', Assets.sounds.ipa.vowels.oNgN), // Âm "ɒ" trong "hot"
      IPA(9, 'ɔ:', 'thought', Assets.sounds.ipa.vowels.oDI), // Âm "ɔ:" trong "thought"
      IPA(10, 'ʌ', 'cup', Assets.sounds.ipa.vowels.aNgNMp3), // Âm "ʌ" trong "cup"
      IPA(11, 'ɑ:', 'car', Assets.sounds.ipa.vowels.aDIMp3), // Âm "ɑ:" trong "car"
      IPA(12, 'æ', 'cat', Assets.sounds.ipa.vowels.ae), // Âm "æ" trong "cat"
      IPA(13, 'ɪə', 'near', Assets.sounds.ipa.vowels.ie), // Âm "ɪə" trong "near"
      IPA(14, 'eə', 'hair', Assets.sounds.ipa.vowels.ea), // Âm "eə" trong "hair"
      IPA(15, 'eɪ', 'say', Assets.sounds.ipa.vowels.ei), // Âm "eɪ" trong "say"
      IPA(16, 'ɔɪ', 'boy', Assets.sounds.ipa.vowels.oi), // Âm "ɔɪ" trong "boy"
      IPA(17, 'aɪ', 'buy', Assets.sounds.ipa.vowels.aMp3), // Âm "aɪ" trong "buy"
      IPA(18, 'əʊ', 'go', Assets.sounds.ipa.vowels.aMp3__), // Âm "əʊ" trong "go"
      IPA(19, 'aʊ', 'now', Assets.sounds.ipa.vowels.aMp3_), // Âm "aʊ" trong "now"
      IPA(20, 'ʊə', 'tour', Assets.sounds.ipa.vowels.aMp3___), // Âm "ʊə" trong "tour"
    ];
  }

  static List<IPA> ipaConsonants() {
    return [
      IPA(21, 'p', 'pen', Assets.sounds.ipa.consonants.p), // Âm "p" trong "pen"
      IPA(22, 'b', 'bat', Assets.sounds.ipa.consonants.b), // Âm "b" trong "bat"
      IPA(23, 't', 'top', Assets.sounds.ipa.consonants.tMp3), // Âm "t" trong "top"
      IPA(24, 'd', 'dog', Assets.sounds.ipa.consonants.dMp3), // Âm "d" trong "dog"
      IPA(25, 'tʃ', 'chip', Assets.sounds.ipa.consonants.tMp3_), // Âm "tʃ" trong "chip"
      IPA(26, 'dʒ', 'judge', Assets.sounds.ipa.consonants.dMp3_), // Âm "dʒ" trong "judge"
      IPA(27, 'k', 'cat', Assets.sounds.ipa.consonants.k), // Âm "k" trong "cat"
      IPA(28, 'g', 'go', Assets.sounds.ipa.consonants.g), // Âm "g" trong "go"
      IPA(29, 'f', 'fish', Assets.sounds.ipa.consonants.f), // Âm "f" trong "fish"
      IPA(30, 'v', 'van', Assets.sounds.ipa.consonants.v), // Âm "v" trong "van"
      IPA(31, 'ð', 'this', Assets.sounds.ipa.consonants.aMp3), // Âm "ð" trong "this"
      IPA(32, 'θ', 'thin', Assets.sounds.ipa.consonants.aMp3___), // Âm "θ" trong "thin"
      IPA(33, 's', 'see', Assets.sounds.ipa.consonants.s), // Âm "s" trong "see"
      IPA(34, 'z', 'zoo', Assets.sounds.ipa.consonants.z), // Âm "z" trong "zoo"
      IPA(35, 'ʃ', 'she', Assets.sounds.ipa.consonants.aMp3____), // Âm "ʃ" trong "she"
      IPA(36, 'ʒ', 'measure', Assets.sounds.ipa.consonants.aMp3_), // Âm "ʒ" trong "measure"
      IPA(37, 'm', 'man', Assets.sounds.ipa.consonants.m), // Âm "m" trong "man"
      IPA(38, 'n', 'no', Assets.sounds.ipa.consonants.n), // Âm "n" trong "no"
      IPA(39, 'ŋ', 'sing', Assets.sounds.ipa.consonants.aMp3__), // Âm "ŋ" trong "sing"
      IPA(40, 'h', 'hat', Assets.sounds.ipa.consonants.h), // Âm "h" trong "hat"
      IPA(41, 'l', 'leg', Assets.sounds.ipa.consonants.l), // Âm "l" trong "leg"
      IPA(42, 'r', 'red', Assets.sounds.ipa.consonants.r), // Âm "r" trong "red"
      IPA(43, 'w', 'wet', Assets.sounds.ipa.consonants.w), // Âm "w" trong "wet"
      IPA(44, 'j', 'yes', Assets.sounds.ipa.consonants.j), // Âm "j" trong "yes"
    ];
  }
}


