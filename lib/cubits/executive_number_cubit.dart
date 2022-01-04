import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ExecutiveNumberCubit extends HydratedCubit<String> {
  ExecutiveNumberCubit(String state) : super(state);

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['number'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'number': state};
  }
}
