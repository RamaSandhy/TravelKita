import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/booking_repository.dart';
import '../domain/entities/booking.dart';

abstract class BookingEvent {}
class SubmitBooking extends BookingEvent {
  final Booking booking;
  SubmitBooking(this.booking);
}

abstract class BookingState {}
class BookingInitial extends BookingState {}
class BookingSubmitting extends BookingState {}
class BookingSuccess extends BookingState {}
class BookingFailure extends BookingState {
  final String message;
  BookingFailure(this.message);
}

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository repository;
  BookingBloc(this.repository) : super(BookingInitial()) {
    on<SubmitBooking>((event, emit) async {
      emit(BookingSubmitting());
      try {
        final success = await repository.createBooking(event.booking);
        if (success) {
          emit(BookingSuccess());
        } else {
          emit(BookingFailure('Gagal booking')); 
        }
      } catch (e) {
        emit(BookingFailure(e.toString()));
      }
    });
  }
}