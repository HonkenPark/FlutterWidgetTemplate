// This file defines functions used for general-purpose handling of text, such as text normalizing and text parsing.
// Additionally, functions required to check the validity of input text are also defined.

String? validateEmail(String value) {
  if (value.isEmpty) {
    return '이메일을 입력해주세요.';
  } else if (!value.contains('@') || (!value.endsWith('.com') && !value.endsWith('.co.kr'))) {
    return '유효한 이메일 주소를 입력해주세요.';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return '비밀번호를 입력해주세요.';
  }
  return null;
}

bool isNumberInput(String input) {
  RegExp numbersOnlyRegex = RegExp(r'^[0-9]+$');
  return numbersOnlyRegex.hasMatch(input);
}

String wrappingText(String input) {
  List<String> sentences = input.split('.');
  List<String> wrappedSentences = [];

  for (int i = 0; i < sentences.length; i++) {
    String sentence = sentences[i].trimLeft().trimRight();
    if (sentence.isNotEmpty) {
      String wrappedSentence = '$sentence.';
      wrappedSentences.add(wrappedSentence);
      if (i < sentences.length - 1) {
        wrappedSentences.add('\n');
      }
    }
  }
  return wrappedSentences.join();
}
