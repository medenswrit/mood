// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  const CustomError({this.code = '', this.message = '', this.plugin = ''});

  @override
  String toString() =>
      'CustomError(code: $code, message: $message, plugin: $plugin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomError &&
        other.code == code &&
        other.message == message &&
        other.plugin == plugin;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ plugin.hashCode;

  @override
  List<Object?> get props => [code, message, plugin];
}
