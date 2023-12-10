import 'package:equatable/equatable.dart';

abstract class ResourceState<T> extends Equatable {
  final T? data;
  final dynamic error;

  const ResourceState({this.data, this.error});

  @override
  List<Object> get props => [data as Object, error];
}

class ResourceInit<T> extends ResourceState<T> {}

class Success<T> extends ResourceState<T> {
  const Success(T data) : super(data: data);
}

class Loading<T> extends ResourceState<T> {
  const Loading([T? data]) : super(data: data);
}

class Error<T> extends ResourceState<T> {
  const Error(T? data, dynamic error) : super(data: data, error: error);
}