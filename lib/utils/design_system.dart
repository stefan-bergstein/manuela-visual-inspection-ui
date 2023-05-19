class _Spacing {
  const _Spacing();

  double get x4 => 4;
  double get x6 => 6;
  double get x8 => 8;
  double get x12 => 12;
  double get x18 => 18;
  double get x24 => 24;
  double get x32 => 32;
  double get x42 => 42;
  double get x48 => 48;
  double get x64 => 64;
}

class _Border {
  const _Border();

  double get radius12 => 12;

  double get width05 => 0.5;
  double get width3 => 3;
}

enum Breakpoint {
  xsm,
  sm,
  md,
  lg,
  xl,
  xxl;

  bool operator >(Breakpoint other) => index > other.index;
  bool operator >=(Breakpoint other) => index >= other.index;

  bool operator <(Breakpoint other) => index < other.index;
  bool operator <=(Breakpoint other) => index <= other.index;
}

sealed class DesignSystem {
  static const spacing = _Spacing();
  static const border = _Border();

  static Breakpoint breakpoint(double width) {
    return switch (width) {
      _ when width < 576 => Breakpoint.xsm,
      _ when width < 768 => Breakpoint.sm,
      _ when width < 992 => Breakpoint.md,
      _ when width < 1200 => Breakpoint.lg,
      _ when width < 1400 => Breakpoint.xl,
      _ => Breakpoint.xxl
    };
  }
}
