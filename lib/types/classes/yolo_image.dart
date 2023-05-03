enum DamageType {
  scratch,
  hole,
  missing;

  String get text {
    switch (this) {
      case DamageType.scratch:
        return 'Scratch(es)';
      case DamageType.hole:
        return 'Hole(s)';

      case DamageType.missing:
        return 'Missing Part(s)';
    }
  }
}

class YOLOImage {
  String base64;
  List<DamageType> damageTypes;

  DateTime? timestamp;

  YOLOImage(this.base64, this.damageTypes);
}
