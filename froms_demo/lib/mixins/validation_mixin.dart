class ValidationMixin {
  String? validateFirstName(String? value) {
    if (value!.length < 2) {
      return "isim en az 2 harften oluşmalıdır";
    } else {
      return null;
    }
  }

  String? validateLastName(String? value) {
    if (value!.length < 2) {
      return "soyisim en az 2 harften oluşmalıdır";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (!value!.contains("@")) {
      return "email geçerli değildir bu isim daha önce alınmış";
    } else {
      return null;
    }
  }
}
