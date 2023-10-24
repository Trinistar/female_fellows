import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [FFUser.empty] represents an unauthenticated user.
/// {@endtemplate}
class FFUser extends Equatable {
  /// {@macro user}
  const FFUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = FFUser(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == FFUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != FFUser.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
