import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ExecutiveNameCubit extends HydratedCubit<String> {
  ExecutiveNameCubit(String state) : super(state);

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['name'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'name': state};
  }
}
