
import 'package:badminton_court_booking/common/common.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this home3 Widget...
      GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(Colors.white as int),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 16, 6),
                          child: Container(
                            width: 53,
                            height: 53,
                            decoration: BoxDecoration(
                              color: ColorPalette.kAssentDarkColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorPalette.kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://picsum.photos/seed/626/600',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Welcome, Jenny',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.notifications_none,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  StickyHeader(
                    overlapHeaders: false,
                    header: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).accent4
                          ],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                    child: Container(
                                      width: 200,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Search listings...',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                        cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                        validator: _model.textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 10,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.tune_rounded,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            'Top Beaches',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Container(
                            width: double.infinity,
                            height: 270,
                            decoration: BoxDecoration(),
                            child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                  child: Container(
                                    width: 220,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                        FlutterFlowTheme.of(context).alternate,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1519046904884-53103b34b206?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhY2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(1, -1),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 8, 8, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      child: BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                          sigmaX: 5,
                                                          sigmaY: 2,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(16,
                                                                  0, 0, 0),
                                                              child: Container(
                                                                width: 36,
                                                                height: 36,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .accent4,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                  border:
                                                                  Border.all(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .alternate,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Beach Name',
                                              style: FlutterFlowTheme.of(context)
                                                  .titleLarge,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 8),
                                            child: RichText(
                                              textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '\$421',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' /night',
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall,
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                  child: Container(
                                    width: 220,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                        FlutterFlowTheme.of(context).alternate,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(1, -1),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 8, 8, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      child: BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                          sigmaX: 5,
                                                          sigmaY: 2,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(16,
                                                                  0, 0, 0),
                                                              child: Container(
                                                                width: 36,
                                                                height: 36,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .accent4,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                  border:
                                                                  Border.all(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .alternate,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Beach Name',
                                              style: FlutterFlowTheme.of(context)
                                                  .titleLarge,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 8),
                                            child: RichText(
                                              textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '\$421',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' /night',
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall,
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                  child: Container(
                                    width: 220,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                        FlutterFlowTheme.of(context).alternate,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGJlYWNofGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(1, -1),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 8, 8, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      child: BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                          sigmaX: 5,
                                                          sigmaY: 2,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(16,
                                                                  0, 0, 0),
                                                              child: Container(
                                                                width: 36,
                                                                height: 36,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .accent4,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                  border:
                                                                  Border.all(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .alternate,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Beach Name',
                                              style: FlutterFlowTheme.of(context)
                                                  .titleLarge,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 8),
                                            child: RichText(
                                              textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '\$421',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' /night',
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall,
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 0, 12),
                                child: Text(
                                  'Recent Properties',
                                  style: FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Container(
                                        width: 220,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1597475681177-809cfdc76cd2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmVhY2hob3VzZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 8, 8, 0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                          child: BackdropFilter(
                                                            filter:
                                                            ImageFilter.blur(
                                                              sigmaX: 5,
                                                              sigmaY: 2,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .accent4,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    border:
                                                                    Border.all(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .alternate,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                                  child: Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                    child: Text(
                                                                      '12 nights available',
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                                child: Text(
                                                  'Property Name',
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\$210',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ' /night',
                                                            style:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .labelSmall,
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Kauai, Hawaii',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Container(
                                        width: 220,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1516371147160-1380f6b0b061?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhY2hob3VzZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 8, 8, 0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                          child: BackdropFilter(
                                                            filter:
                                                            ImageFilter.blur(
                                                              sigmaX: 5,
                                                              sigmaY: 2,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .accent4,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    border:
                                                                    Border.all(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .alternate,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                                  child: Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                    child: Text(
                                                                      '12 nights available',
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                                child: Text(
                                                  'Property Name',
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\$168',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ' /night',
                                                            style:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .labelSmall,
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Kauai, Hawaii',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Container(
                                        width: 220,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1600357169193-19bd51d2a6ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYWNoaG91c2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 8, 8, 0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                          child: BackdropFilter(
                                                            filter:
                                                            ImageFilter.blur(
                                                              sigmaX: 5,
                                                              sigmaY: 2,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .accent4,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        12),
                                                                    border:
                                                                    Border.all(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .alternate,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                                  child: Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                    child: Text(
                                                                      '4 nights available',
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                                child: Text(
                                                  'Property Name',
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '\$421',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ' /night',
                                                            style:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .labelSmall,
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 8),
                                                    child: RichText(
                                                      textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Kauai, Hawaii',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ;
  }
}