class Server {
  static const String serverStaging = 'https://admin.shafayouxi.org/admin';
  static const String serverProduction = 'https://admin.laiwan.io/admin';
  static const String avatarStaging =
      'https://avatar.staging.laiwan.shafayouxi.com';
  static const String avatarProduction =
      'https://avatar.production.laiwan.shafayouxi.com';

  static String apiDomain() {
    return serverStaging;
  }

  static String avatarDomain() {
    return avatarStaging;
  }
}
