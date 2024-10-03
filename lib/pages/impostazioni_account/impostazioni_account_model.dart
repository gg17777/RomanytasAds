import '/bottom_nav/bottom_nav_profilo/bottom_nav_profilo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'impostazioni_account_widget.dart' show ImpostazioniAccountWidget;
import 'package:flutter/material.dart';

class ImpostazioniAccountModel
    extends FlutterFlowModel<ImpostazioniAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Model for bottomNavProfilo component.
  late BottomNavProfiloModel bottomNavProfiloModel;

  @override
  void initState(BuildContext context) {
    bottomNavProfiloModel = createModel(context, () => BottomNavProfiloModel());
  }

  @override
  void dispose() {
    bottomNavProfiloModel.dispose();
  }
}
