import 'package:ypb_photos/app/data/enums/msg_state.dart';

class Resp {
  dynamic data;
  MsgState message;

  Resp({
    this.data,
    this.message = MsgState.loading,
  });

  get result => null;
}

extension MsgStateExt on MsgState {
  bool get isError => this == MsgState.error;
  bool get isData => this == MsgState.data;
}
