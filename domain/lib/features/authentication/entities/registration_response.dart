enum RegistrationResponseStatus {
  success("success"),
  emailExists("email"),
  phoneExists("phone"),
  failure("false"),
  unknown("unknown");

  final String value;
  const RegistrationResponseStatus(this.value);

  static RegistrationResponseStatus fromString(String response) {
    return RegistrationResponseStatus.values.firstWhere(
          (e) => e.value == response,
      orElse: () => RegistrationResponseStatus.unknown,
    );
  }
}
