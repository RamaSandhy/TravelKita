import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/jadwal_repository.dart';
import '../domain/entities/jadwal_travel.dart';

abstract class JadwalEvent {}
class SearchJadwal extends JadwalEvent {
  final String asal;
  final String tujuan;
  final String tanggal;

  SearchJadwal(this.asal, this.tujuan, this.tanggal);
}

abstract class JadwalState {}
class JadwalInitial extends JadwalState {}
class JadwalLoading extends JadwalState {}
class JadwalLoaded extends JadwalState {
  final List<JadwalTravel> results;
  JadwalLoaded(this.results);
}
class JadwalError extends JadwalState {
  final String message;
  JadwalError(this.message);
}

class JadwalBloc extends Bloc<JadwalEvent, JadwalState> {
  final JadwalRepository repository;

  JadwalBloc(this.repository) : super(JadwalInitial()) {
    on<SearchJadwal>((event, emit) async {
      emit(JadwalLoading());
      try {
        final results = await repository.fetchJadwal(event.asal, event.tujuan, event.tanggal);
        emit(JadwalLoaded(results));
      } catch (e) {
        emit(JadwalError(e.toString()));
      }
    });
  }
}