import 'package:equatable/equatable.dart';

class FetchAlbumParams extends Equatable {
  final int limit;
  const FetchAlbumParams({required this.limit});

  @override
  List<Object?> get props => [
        limit,
      ];
}
