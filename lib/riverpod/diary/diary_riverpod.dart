import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badminton_court_booking/common/helper/pref_helper.dart';
import 'package:badminton_court_booking/di/get_it.dart';
import 'package:badminton_court_booking/model/diary.dart';
import 'package:badminton_court_booking/model/request/diary_request.dart';
import 'package:badminton_court_booking/repository/diary_repository.dart';
import 'package:badminton_court_booking/riverpod/resource_state.dart';

final diaryProvider =
    StateNotifierProvider<DiaryStateNotifier, ResourceState<Diary>>((ref) {
  return DiaryStateNotifier(getItInstance.get<DiaryRepository>());
});

class DiaryStateNotifier extends StateNotifier<ResourceState<Diary>> {
  final DiaryRepository _diaryRepository;
  StreamSubscription<dynamic>? _diarySubscription;

  DiaryStateNotifier(this._diaryRepository) : super(ResourceInit<Diary>());

  Future<void> createDiary(String? date, int? status, String? content) async {
    try {
      var pref = getItInstance.get<PrefHelper>();
      var user = await pref.getUser();

      if (user.id == 0) {
        state = Error(null, "User data is missing or invalid");
        return;
      }
      DiaryRequest request = DiaryRequest.createDiaryRequest(
          user_iduser: user.id,
          date: date,
          status: status,
          content: content);
      state = const Loading();
      _diaryRepository.createDiary(request).listen((diary) {
        state = Success(diary);
      }, onError: (e) {
        state =
            Error(null, "${e.code.toString()}: ${e.errorMessage.toString()}");
      });
    } catch (e) {
      state = Error(null, e.toString());
    }
  }

  Future<Stream<List<Diary>>> getDiary(String? start, String? end) async {
    try {
      var pref = getItInstance.get<PrefHelper>();
      var user = await pref.getUser();

      if (user.id == 0) {
        state = Error(null, "User data is missing or invalid");
        return const Stream
            .empty();
      }
      DiaryRequest request = DiaryRequest.getDiaryRequest(
          user_iduser: user.id, start: start, end: end);
      state = const Loading();
      Stream<List<Diary>> eventsStream = _diaryRepository.getDiary(request);
      return eventsStream;
    } catch (e) {
      state = Error(null, e.toString());
      return const Stream
          .empty(); // Return an empty stream or handle the error appropriately
    }
  }

  void resetState() {
    state = ResourceInit<Diary>();
  }

  @override
  void dispose() {
    _diarySubscription?.cancel();
    super.dispose();
  }
}
