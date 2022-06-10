import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(AnalysisInitial());
}
