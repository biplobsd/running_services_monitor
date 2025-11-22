import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/simple_state_model.dart';

part 'simple_event.dart';
part 'simple_state.dart';
part 'simple_bloc.freezed.dart';

@injectable
class SimpleBloc extends Bloc<SimpleEvent, SimpleState> {
  SimpleBloc() : super(const SimpleState.initial(SimpleStateModel(count: 0))) {
    on<_Started>(_onStarted);
    on<_Count>(_onCount);
  }

  Future<void> _onStarted(_Started event, Emitter<SimpleState> emit) async {
    emit(SimpleState.initial(SimpleStateModel(count: 0)));
  }

  Future<void> _onCount(_Count event, Emitter<SimpleState> emit) async {
    emit(SimpleState.loading(state.value));
    try {
      // Simulate some processing delay
      await Future.delayed(const Duration(seconds: 1));
      final newCount = (state.value.count ?? 0) + event.count;
      emit(SimpleState.success(SimpleStateModel(count: newCount)));
    } catch (e) {
      emit(SimpleState.failure(state.value, e.toString()));
    }
  }
}
