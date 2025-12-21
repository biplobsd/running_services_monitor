import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/parsers/meminfo_parser.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'meminfo_event.dart';
part 'meminfo_state.dart';
part 'meminfo_bloc.freezed.dart';

@injectable
class MeminfoBloc extends Bloc<MemInfoEvent, MemInfoState> {
  final ShizukuService _shizukuService;

  MeminfoBloc(this._shizukuService) : super(const MemInfoState.initial()) {
    on<_FetchMemInfo>(_onFetchMemInfo);
    on<_FetchForComparison>(_onFetchForComparison);
    on<_Clear>(_onClear);
  }

  Future<void> _onFetchMemInfo(_FetchMemInfo event, Emitter<MemInfoState> emit) async {
    emit(MemInfoState.loading());
    try {
      final output = await _shizukuService.executeCommand('dumpsys meminfo ${event.packageName}') ?? '';
      final data = MemInfoParser.parse(event.packageName, output);
      emit(MemInfoState.loaded(data: data));
    } catch (e) {
      emit(MemInfoState.error(message: e.toString()));
    }
  }

  Future<void> _onFetchForComparison(_FetchForComparison event, Emitter<MemInfoState> emit) async {
    final currentData = state.mapOrNull(loaded: (s) => s.data);
    if (currentData == null) return;

    emit(MemInfoState.loading(currentData: currentData));
    try {
      final output = await _shizukuService.executeCommand('dumpsys meminfo ${event.packageName}') ?? '';
      final comparisonData = MemInfoParser.parse(event.packageName, output);
      emit(MemInfoState.loaded(data: currentData, comparisonData: comparisonData));
    } catch (e) {
      emit(MemInfoState.error(message: e.toString(), currentData: currentData));
    }
  }

  void _onClear(_Clear event, Emitter<MemInfoState> emit) {
    emit(const MemInfoState.initial());
  }
}
