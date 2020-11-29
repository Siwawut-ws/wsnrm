class MyService {
  List<String> createAray(String string) {
    String result = string.substring(1, string.length - 1);
    List<String> list = result.split(',');
    int index = 0;
    for (var item in list) {
      list[index] = item.trim();
      index++;
    }
    return list;
  }

  MyService();
}
