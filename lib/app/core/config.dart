enum Flavor {
  development,
  staging,
  production,
}

class Config {
  static Flavor appFlavor = Flavor.development;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.development:
        return 'Developers version';
      case Flavor.staging:
        return 'Test version';
      case Flavor.production:
        return '';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://www.developement_url';
      case Flavor.staging:
        return 'https://www.staging_url';
      case Flavor.production:
        return 'https://www.prodution_url';
    }
  }

  static bool get debugShowCheckedModeBanner {
    switch (appFlavor) {
      case Flavor.development:
        return true;
      case Flavor.staging:
        return false;
      case Flavor.production:
        return false;
    }
  }
}
