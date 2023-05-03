// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yolo_images.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$yOLOImagesStreamHash() => r'105764a13829ce751d51dab95daec4e35004b133';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef YOLOImagesStreamRef = AutoDisposeStreamProviderRef<YOLOImage>;

/// See also [yOLOImagesStream].
@ProviderFor(yOLOImagesStream)
const yOLOImagesStreamProvider = YOLOImagesStreamFamily();

/// See also [yOLOImagesStream].
class YOLOImagesStreamFamily extends Family<AsyncValue<YOLOImage>> {
  /// See also [yOLOImagesStream].
  const YOLOImagesStreamFamily();

  /// See also [yOLOImagesStream].
  YOLOImagesStreamProvider call({
    YOLOStreamSettings settings = const YOLOStreamSettings(),
  }) {
    return YOLOImagesStreamProvider(
      settings: settings,
    );
  }

  @override
  YOLOImagesStreamProvider getProviderOverride(
    covariant YOLOImagesStreamProvider provider,
  ) {
    return call(
      settings: provider.settings,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'yOLOImagesStreamProvider';
}

/// See also [yOLOImagesStream].
class YOLOImagesStreamProvider extends AutoDisposeStreamProvider<YOLOImage> {
  /// See also [yOLOImagesStream].
  YOLOImagesStreamProvider({
    this.settings = const YOLOStreamSettings(),
  }) : super.internal(
          (ref) => yOLOImagesStream(
            ref,
            settings: settings,
          ),
          from: yOLOImagesStreamProvider,
          name: r'yOLOImagesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$yOLOImagesStreamHash,
          dependencies: YOLOImagesStreamFamily._dependencies,
          allTransitiveDependencies:
              YOLOImagesStreamFamily._allTransitiveDependencies,
        );

  final YOLOStreamSettings settings;

  @override
  bool operator ==(Object other) {
    return other is YOLOImagesStreamProvider && other.settings == settings;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, settings.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$damagedYOLOImagesHash() => r'91614b43d07b186ab10a5e0eb752d83392e0b57d';

/// See also [damagedYOLOImages].
@ProviderFor(damagedYOLOImages)
final damagedYOLOImagesProvider = AutoDisposeProvider<List<YOLOImage>>.internal(
  damagedYOLOImages,
  name: r'damagedYOLOImagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$damagedYOLOImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DamagedYOLOImagesRef = AutoDisposeProviderRef<List<YOLOImage>>;
String _$yOLOImagesHash() => r'6bc6833c10e463c2368d835c53d909381ae8efbc';

/// See also [YOLOImages].
@ProviderFor(YOLOImages)
final yOLOImagesProvider =
    AutoDisposeNotifierProvider<YOLOImages, List<YOLOImage>>.internal(
  YOLOImages.new,
  name: r'yOLOImagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$yOLOImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YOLOImages = AutoDisposeNotifier<List<YOLOImage>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
