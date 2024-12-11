import '../../gen/assets.gen.dart';
import '../model/learn/ipa.dart';

class IPAProvider {
  static List<IPA> ipaVowels() {
    return [
      IPA('ɪ', 'bit', Assets.sounds.ipa.vowels.iNgN),
      // Âm "ɪ" trong "bit"
      IPA('i:', 'beat', Assets.sounds.ipa.vowels.iDI),
      // Âm "i:" trong "beat"
      IPA('e', 'bed', Assets.sounds.ipa.vowels.e),
      // Âm "e" trong "bed"
      IPA('ə', 'about', Assets.sounds.ipa.vowels.aNgNMp3_),
      // Âm "ə" trong "about"
      IPA('ɜ:', 'bird', Assets.sounds.ipa.vowels.aDIMp3_),
      // Âm "ɜ:" trong "bird"
      IPA('ʊ', 'foot', Assets.sounds.ipa.vowels.uNgN),
      // Âm "ʊ" trong "foot"
      IPA('u:', 'food', Assets.sounds.ipa.vowels.uDI),
      // Âm "u:" trong "food"
      IPA('ɒ', 'hot', Assets.sounds.ipa.vowels.oNgN),
      // Âm "ɒ" trong "hot"
      IPA('ɔ:', 'thought', Assets.sounds.ipa.vowels.oDI),
      // Âm "ɔ:" trong "thought"
      IPA('ʌ', 'cup', Assets.sounds.ipa.vowels.aNgNMp3),
      // Âm "ʌ" trong "cup"
      IPA('ɑ:', 'car', Assets.sounds.ipa.vowels.aDIMp3),
      // Âm "ɑ:" trong "car"
      IPA('æ', 'cat', Assets.sounds.ipa.vowels.ae),
      // Âm "æ" trong "cat"
      IPA('ɪə', 'near', Assets.sounds.ipa.vowels.ie),
      // Âm "ɪə" trong "near"
      IPA('eə', 'hair', Assets.sounds.ipa.vowels.ea),
      // Âm "eə" trong "hair"
      IPA('eɪ', 'say', Assets.sounds.ipa.vowels.ei),
      // Âm "eɪ" trong "say"
      IPA('ɔɪ', 'boy', Assets.sounds.ipa.vowels.oi),
      // Âm "ɔɪ" trong "boy"
      IPA('aɪ', 'buy', Assets.sounds.ipa.vowels.aMp3),
      // Âm "aɪ" trong "buy"
      IPA('əʊ', 'go', Assets.sounds.ipa.vowels.aMp3__),
      // Âm "əʊ" trong "go"
      IPA('aʊ', 'now', Assets.sounds.ipa.vowels.aMp3_),
      // Âm "aʊ" trong "now"
      IPA('ʊə', 'tour', Assets.sounds.ipa.vowels.aMp3___),
      // Âm "ʊə" trong "tour"
    ];
  }

  static List<IPA> ipaConsonants() {
    return [
      IPA('p', 'pen', Assets.sounds.ipa.consonants.p),
      // Âm "p" trong "pen"
      IPA('b', 'bat', Assets.sounds.ipa.consonants.b),
      // Âm "b" trong "bat"
      IPA('t', 'top', Assets.sounds.ipa.consonants.tMp3),
      // Âm "t" trong "top"
      IPA('d', 'dog', Assets.sounds.ipa.consonants.dMp3),
      // Âm "d" trong "dog"
      IPA('tʃ', 'chip', Assets.sounds.ipa.consonants.tMp3_),
      // Âm "tʃ" trong "chip"
      IPA('dʒ', 'judge', Assets.sounds.ipa.consonants.dMp3_),
      // Âm "dʒ" trong "judge"
      IPA('k', 'cat', Assets.sounds.ipa.consonants.k),
      // Âm "k" trong "cat"
      IPA('g', 'go', Assets.sounds.ipa.consonants.g),
      // Âm "g" trong "go"
      IPA('f', 'fish', Assets.sounds.ipa.consonants.f),
      // Âm "f" trong "fish"
      IPA('v', 'van', Assets.sounds.ipa.consonants.v),
      // Âm "v" trong "van"
      IPA('ð', 'this', Assets.sounds.ipa.consonants.aMp3),
      // Âm "ð" trong "this"
      IPA('θ', 'thin', Assets.sounds.ipa.consonants.aMp3___),
      // Âm "θ" trong "thin"
      IPA('s', 'see', Assets.sounds.ipa.consonants.s),
      // Âm "s" trong "see"
      IPA('z', 'zoo', Assets.sounds.ipa.consonants.z),
      // Âm "z" trong "zoo"
      IPA('ʃ', 'she', Assets.sounds.ipa.consonants.aMp3____),
      // Âm "ʃ" trong "she"
      IPA('ʒ', 'measure', Assets.sounds.ipa.consonants.aMp3_),
      // Âm "ʒ" trong "measure"
      IPA('m', 'man', Assets.sounds.ipa.consonants.m),
      // Âm "m" trong "man"
      IPA('n', 'no', Assets.sounds.ipa.consonants.n),
      // Âm "n" trong "no"
      IPA('ŋ', 'sing', Assets.sounds.ipa.consonants.aMp3__),
      // Âm "ŋ" trong "sing"
      IPA('h', 'hat', Assets.sounds.ipa.consonants.h),
      // Âm "h" trong "hat"
      IPA('l', 'leg', Assets.sounds.ipa.consonants.l),
      // Âm "l" trong "leg"
      IPA('r', 'red', Assets.sounds.ipa.consonants.r),
      // Âm "r" trong "red"
      IPA('w', 'wet', Assets.sounds.ipa.consonants.w),
      // Âm "w" trong "wet"
      IPA('j', 'yes', Assets.sounds.ipa.consonants.j),
      // Âm "j" trong "yes"
    ];
  }
}


