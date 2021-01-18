DateTime fakeTime = null;

DateTime getNow() {
  return fakeTime ?? DateTime.now();
}
