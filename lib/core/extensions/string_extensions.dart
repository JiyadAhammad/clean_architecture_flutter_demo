extension StringExtensions on String {
  bool get isEmptyOrNull => trim().isEmpty;

  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  bool get isPhone {
    return RegExp(r'^[0-9]{10,15}$').hasMatch(this);
  }

  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String get titleCase {
    return split(' ').map((String e) => e.capitalize).join(' ');
  }

  String get maskedEmail {
    if (!isEmail) {
      return this;
    }
    final List<String> parts = split('@');
    return '${parts[0].substring(0, 2)}****@${parts[1]}';
  }
}
