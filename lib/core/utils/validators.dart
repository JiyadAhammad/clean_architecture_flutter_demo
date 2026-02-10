class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static final RegExp _passwordRegex = RegExp(r'^(?=.*[0-9]).{6,}$');

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'Password must be at least 6 characters and contain a number';
    }
    return null;
  }
}
