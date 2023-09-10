part of depths;

/// Provides extensions for [bool].
extension BoolScrewdriver on bool {
  /// Returns 1 if [this] is true and 0 if otherwise.
  int toInt() => this ? 1 : 0;
}

/// Generates a random boolean value.
bool randomBool() => Random().nextBool();
