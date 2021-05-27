class UriHelper {
  static String baseUri = "https://api.quotable.io/random";

  static List<String> categories = <String>[];

  static void updateCategories(List<String> _categories) {
    categories = _categories;
  }

  static String getUri() {
    String finalUri = baseUri;
    if (categories.isNotEmpty) {
      finalUri = finalUri + "?tags=";

      for (String category in categories) {
        if (category.contains(' ')) {
          category = category.replaceAll(' ', '-');
        }
        finalUri = finalUri + category.toLowerCase() + ',';
      }
      finalUri = finalUri.substring(0, finalUri.length - 1);
    }

    return finalUri;
  }
}
