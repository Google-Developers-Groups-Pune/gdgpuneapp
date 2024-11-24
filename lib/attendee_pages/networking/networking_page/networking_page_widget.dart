import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'networking_page_model.dart';
export 'networking_page_model.dart';

class NetworkingPageWidget extends StatefulWidget {
  const NetworkingPageWidget({super.key});

  @override
  State<NetworkingPageWidget> createState() => _NetworkingPageWidgetState();
}

class _NetworkingPageWidgetState extends State<NetworkingPageWidget> {
  late NetworkingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NetworkingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tagsList = await queryTagsCollectionRecordOnce(
        queryBuilder: (tagsCollectionRecord) => tagsCollectionRecord.where(
          'event',
          isEqualTo: FFAppState().eventName,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.searchFieldTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Networking',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Autocomplete<String>(
                          initialValue: const TextEditingValue(),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return ['Option 1'].where((option) {
                              final lowercaseOption = option.toLowerCase();
                              return lowercaseOption.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return AutocompleteOptionsList(
                              textFieldKey: _model.searchFieldKey,
                              textController: _model.searchFieldTextController!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textHighlightStyle: const TextStyle(),
                              elevation: 4.0,
                              optionBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              optionHighlightColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              maxHeight: 200.0,
                            );
                          },
                          onSelected: (String selection) {
                            safeSetState(() =>
                                _model.searchFieldSelectedOption = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            _model.searchFieldFocusNode = focusNode;

                            _model.searchFieldTextController =
                                textEditingController;
                            return TextFormField(
                              key: _model.searchFieldKey,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchFieldTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                            _model.tagsList!.tags
                                                .map((str) =>
                                                    TextSearchItem.fromTerms(
                                                        str, [str]))
                                                .toList())
                                        .search(_model
                                            .searchFieldTextController.text)
                                        .map((r) => r.object)
                                        .take(5)
                                        .toList();
                                  });
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Search with tags',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: const Color(0x3C000000),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x34000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(89.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(89.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(89.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(89.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: const Icon(
                                  Icons.search_sharp,
                                  color: Color(0x9A000000),
                                  size: 25.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .searchFieldTextControllerValidator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.tagsList?.tags != null &&
                            (_model.tagsList?.tags)!.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 18.0),
                            child: FlutterFlowChoiceChips(
                              options:
                                  ((_model.simpleSearchResults.isNotEmpty) ==
                                              true
                                          ? _model.simpleSearchResults
                                          : _model.tagsList!.tags)
                                      .map((label) => ChipData(label))
                                      .toList(),
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                safeSetState(() {
                                  _model.searchFieldTextController?.text =
                                      _model.choiceChipsValue!;
                                  _model.searchFieldFocusNode?.requestFocus();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    _model.searchFieldTextController
                                        ?.selection = TextSelection.collapsed(
                                      offset: _model.searchFieldTextController!
                                          .text.length,
                                    );
                                  });
                                });
                                _model.usersWithTag =
                                    await queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'tags',
                                    arrayContains: _model.choiceChipsValue,
                                  ),
                                  limit: 100,
                                );

                                safeSetState(() {});
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          );
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  if (!FFAppState().searchActive)
                    Builder(
                      builder: (context) {
                        final usersList = _model.usersWithTag?.toList() ?? [];

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: usersList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                          itemBuilder: (context, usersListIndex) {
                            final usersListItem = usersList[usersListIndex];
                            return Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'UserProfilePage',
                                    queryParameters: {
                                      'userReference': serializeParam(
                                        usersListItem.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/812/600',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              usersListItem.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              usersListItem.bio
                                                  .maybeHandleOverflow(
                                                maxChars: 50,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
              wrapWithModel(
                model: _model.mainNavBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const MainNavBarWidget(
                  pageIndex: 3,
                  loginType: FFAppConstants.loginTypeAttendee,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
