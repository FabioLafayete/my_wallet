class ConvertCents {
  static String convert(int data){
    String result;

    double money = data / 100;

    result = money.toString();

    String cents = result.substring(result.indexOf('.') + 1);
    if(cents.length == 1) cents = cents + '0';

    String real = result.substring(0, result.indexOf('.'));


    String newStr = '';
    int step = 3;

    for (int i = real.length; i >= 0; i -= step) {
      String subString = '';
      if (i > 3) {
        subString += '.';
      }
      subString += real.substring( i < step ? 0 : i - step, i);
      newStr = subString + newStr;
    }

    return '$newStr,$cents';
  }
}