class Recipe {
  final String recipeName;
  final List<String> emojiRatings;

  const Recipe({required this.recipeName, required this.emojiRatings});
}

const Map<String, int> emojiToValue = {"😀": 4, "🙂": 3, "😐": 2, "☹️": 1};
