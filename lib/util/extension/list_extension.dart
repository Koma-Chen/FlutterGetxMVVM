extension ListExtension<T> on List<T> {
  T? maybeElementAt(int index) {
    if (index >= 0 && index < length) {
      return elementAt(index);
    }
  }
}
