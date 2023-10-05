class TextFieldValidator {
  // TextValidator used in TextFormField
  String? password;

  get forEmailOnly => (String? value) {
        if (value!.isEmpty) {
          return "*email is required";
        } else if (!value.contains("@")) {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" && value.split("@")[1] == "") {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" || value.split("@")[1] == "") {
          return "invalid email address";
        } else {
          return null;
        }
      };

  get forPassword => (String? value) {
        password = value;
        if (value!.isEmpty) {
          return 'required';
        } else if (value.length <= 7) {
          return 'password must be at least 8 characters';
        } else {
          return null;
        }
      };

  get forConfirmPassword => (String? value) {
        if (value!.isEmpty) {
          return 'required';
        } else if (value != password) {
          return 'password mismatched';
        } else {
          return null;
        }
      };

  get forPreferName => (String? value) {
        if (value!.isEmpty) {
          return "required";
        } else {
          return null;
        }
      };
}
