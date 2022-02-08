part of 'generate_code_cubit.dart';

abstract class GenerateCodeState extends Equatable {
  const GenerateCodeState();
  @override
  List<Object> get props => [];
}

class GenerateCodeInitial extends GenerateCodeState {}

class GenerateCodeFinish extends GenerateCodeState {}
class GenerateCodeNumChanged extends GenerateCodeState {}