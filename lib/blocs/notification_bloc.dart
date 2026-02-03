import 'package:flutter_bloc/flutter_bloc.dart';
import 'notification_event.dart';
import 'notification_state.dart';
import '../models/notification.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkAsRead>(_onMarkAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
    on<DeleteNotification>(_onDeleteNotification);
  }

  void _onLoadNotifications(
      LoadNotifications event, Emitter<NotificationState> emit) {
    emit(NotificationLoading());

    final notifications = [
      NotificationModel(
        id: '1',
        title: 'Order Confirmed',
        message: 'Your order of Caffe Mocha has been confirmed!',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        type: 'order',
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        title: 'Special Offer!',
        message: 'Buy one get one free on all Cappuccinos today!',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'promo',
        isRead: false,
      ),
      NotificationModel(
        id: '3',
        title: 'Order Delivered',
        message: 'Your order has been delivered. Enjoy!',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: 'order',
        isRead: true,
      ),
      NotificationModel(
        id: '4',
        title: 'New Coffee Alert',
        message: 'Try our new seasonal blend - Pumpkin Spice Latte!',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: 'general',
        isRead: true,
      ),
    ];

    emit(NotificationLoaded(notifications: notifications));
  }

  void _onMarkAsRead(MarkAsRead event, Emitter<NotificationState> emit) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;
      final notifications = currentState.notifications.map((notif) {
        if (notif.id == event.notificationId) {
          return notif.copyWith(isRead: true);
        }
        return notif;
      }).toList();

      emit(NotificationLoaded(notifications: notifications));
    }
  }

  void _onMarkAllAsRead(MarkAllAsRead event, Emitter<NotificationState> emit) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;
      final notifications = currentState.notifications
          .map((notif) => notif.copyWith(isRead: true))
          .toList();

      emit(NotificationLoaded(notifications: notifications));
    }
  }

  void _onDeleteNotification(
      DeleteNotification event, Emitter<NotificationState> emit) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;
      final notifications = currentState.notifications
          .where((notif) => notif.id != event.notificationId)
          .toList();

      emit(NotificationLoaded(notifications: notifications));
    }
  }
}
