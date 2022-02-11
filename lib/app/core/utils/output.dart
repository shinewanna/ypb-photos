import 'package:flutter/material.dart';
import 'package:ypb_photos/app/data/enums/msg_state.dart';
import 'package:ypb_photos/app/data/models/resp_model.dart';
import 'package:ypb_photos/app/modules/widgets/error.dart';
import 'package:ypb_photos/app/modules/widgets/loading.dart';
import 'package:ypb_photos/app/modules/widgets/nth.dart';

class Output extends StatelessWidget {
  final Function? onLoading;
  final Function? onData;
  final Function(dynamic)? onError;
  final Resp? resp;
  final bool isNoError;

  Output(this.resp,
      {this.onLoading, this.onData, this.onError, this.isNoError = false});
  @override
  Widget build(BuildContext context) {
    switch (resp!.message) {
      case MsgState.loading:
        if (onLoading == null) {
          return _defaultOnLoading;
        }
        return onLoading!();
      case MsgState.data:
        return onData!(resp?.data);
      case MsgState.error:
        if (isNoError) {
          return onData!(resp?.data);
        }
        if (onError == null) {
          return _defaultOnError;
        }
        return onError!(resp?.data);
      default:
        return Nth();
    }
  }

  get _defaultOnError => Err(resp!.data.toString());

  get _defaultOnLoading => Loading();
}
