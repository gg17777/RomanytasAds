import '/flutter_flow/flutter_flow_util.dart';
import 'buy_ticket_widget.dart' show BuyTicketWidget;
import 'package:flutter/material.dart';

class BuyTicketModel extends FlutterFlowModel<BuyTicketWidget> {
  ///  Local state fields for this page.

  int quantity = 1;

  double? amount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
