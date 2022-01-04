// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {String? key,
      List<Map<String, dynamic>?>? variations,
      String? product_id,
      String? name,
      String? category_name}) {
    return _Product(
      key: key,
      variations: variations,
      product_id: product_id,
      name: name,
      category_name: category_name,
    );
  }

  Product fromJson(Map<String, Object?> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String? get key => throw _privateConstructorUsedError;
  List<Map<String, dynamic>?>? get variations =>
      throw _privateConstructorUsedError;
  String? get product_id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get category_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String? key,
      List<Map<String, dynamic>?>? variations,
      String? product_id,
      String? name,
      String? category_name});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? variations = freezed,
    Object? product_id = freezed,
    Object? name = freezed,
    Object? category_name = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      variations: variations == freezed
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? key,
      List<Map<String, dynamic>?>? variations,
      String? product_id,
      String? name,
      String? category_name});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? key = freezed,
    Object? variations = freezed,
    Object? product_id = freezed,
    Object? name = freezed,
    Object? category_name = freezed,
  }) {
    return _then(_Product(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      variations: variations == freezed
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  _$_Product(
      {this.key,
      this.variations,
      this.product_id,
      this.name,
      this.category_name});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? key;
  @override
  final List<Map<String, dynamic>?>? variations;
  @override
  final String? product_id;
  @override
  final String? name;
  @override
  final String? category_name;

  @override
  String toString() {
    return 'Product(key: $key, variations: $variations, product_id: $product_id, name: $name, category_name: $category_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality()
                .equals(other.variations, variations) &&
            const DeepCollectionEquality()
                .equals(other.product_id, product_id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.category_name, category_name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(variations),
      const DeepCollectionEquality().hash(product_id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(category_name));

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  factory _Product(
      {String? key,
      List<Map<String, dynamic>?>? variations,
      String? product_id,
      String? name,
      String? category_name}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get key;
  @override
  List<Map<String, dynamic>?>? get variations;
  @override
  String? get product_id;
  @override
  String? get name;
  @override
  String? get category_name;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
