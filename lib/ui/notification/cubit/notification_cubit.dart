import 'package:doctor_app/data/local/local_database.dart';
import 'package:doctor_app/data/models/notification/notification_model.dart';
import 'package:doctor_app/ui/notification/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitialNotificationState()) {
    _getAllNotifications();
  }

  _getAllNotifications() {
    emit(LoadNotificationProgress());
    LocalDatabase.getAllNotifications()
        .asStream()
        .listen((List<NotificationModel> notifications) {
      emit(LoadNotificationSuccess(notifications: notifications));
    });
  }
}
