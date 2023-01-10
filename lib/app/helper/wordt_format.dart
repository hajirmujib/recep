extension PowerString on String {
  String getFirstWord() {
    List<String> wordList = this.split(" ");
    if (wordList.isNotEmpty) {
      return wordList[0];
    } else {
      return ' ';
    }
  }

  String getLastWord() {
    List<String> wordList = this.split(" ");
    if (wordList.isNotEmpty) {
      final newList = [];
      var newWord;
      for (var i = 1; i < wordList.length; i++) {
        newList.add(wordList[i]);
      }
      newWord = newList.join(" ");
      return newWord;
    } else {
      return ' ';
    }
  }
}
