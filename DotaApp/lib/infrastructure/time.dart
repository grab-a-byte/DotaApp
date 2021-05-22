DateTime? fakeTime;

DateTime getNow() {
  return fakeTime ?? DateTime.now();
}
