part of depths;

/// Hides keyboard on tap outside tap-able widgets.
/// This should be used as the parent of your [MaterialApp]. This way, it will
/// detect any touches outside text fields and other touchable areas and will
/// close the soft keyboard if open.
/// Flag [hide] can be used to toggle this behavior.
/// e.g.
///
/// HideKeyboard(
///   child: MaterialApp(
///     ...
///   ),
/// );
///
class HideKeyboard extends StatelessWidget {
  /// flag to toggle hiding of keyboard
  final bool hide;

  /// child widget, in most cases, [MaterialApp]
  final Widget child;

  /// Refers to the [GestureDetector.behavior] property.
  final HitTestBehavior? behavior;

  /// Default Constructor
  const HideKeyboard({
    super.key,
    required this.child,
    this.hide = true,
    this.behavior,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: behavior,
      onTap: hide ? context.hideKeyboard : null,
      child: child,
    );
  }
}
