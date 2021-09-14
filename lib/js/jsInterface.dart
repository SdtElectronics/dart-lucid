@JS()
library lucid.js;

import 'package:js/js.dart';

import 'jsInternal.dart';

@JS('initializeRootNode')
external set _initializeRootNode(int f(int width, int height));

@JS('addChild')
external set _addChild(int f(int parent));

@JS('removeChild')
external set _removeChild(int? f(int id));

@JS('setDisplay')
external set _setDisplay(void f(int id, int disp));

@JS('getDisplay')
external set _getDisplay(int f(int id));


@JS('setPosition')
external set _setPosition(void f(int id, int ps));

@JS('getPosition')
external set _getPosition(int f(int id));



@JS('setWidth')
external set _setWidth(void f(int id, int? w));

@JS('getWidth')
external set _getWidth(int? f(int id));


@JS('setMinWidth')
external set _setMinWidth(void f(int id, int mw));

@JS('getMinWidth')
external set _getMinWidth(int f(int id));


@JS('setMaxWidth')
external set _setMaxWidth(void f(int id, int mw));

@JS('getMaxWidth')
external set _getMaxWidth(int f(int id));


@JS('setHeight')
external set _setHeight(void f(int id, int? h));

@JS('getHeight')
external set _getHeight(int? f(int id));


@JS('setMinHeight')
external set _setMinHeight(void f(int id, int mh));

@JS('getMinHeight')
external set _getMinHeight(int f(int id));


@JS('setMaxHeight')
external set _setMaxHeight(void f(int id, int mh));

@JS('getMaxHeight')
external set _getMaxHeight(int f(int id));


@JS('setLine_height')
external set _setLine_height(void f(int id, int lh));

@JS('getLine_height')
external set _getLine_height(int f(int id));


@JS('setBorder_top')
external set _setBorder_top(void f(int id, int bt));

@JS('getBorder_top')
external set _getBorder_top(int f(int id));


@JS('setBorder_right')
external set _setBorder_right(void f(int id, int br));

@JS('getBorder_right')
external set _getBorder_right(int f(int id));


@JS('setBorder_bottom')
external set _setBorder_bottom(void f(int id, int bb));

@JS('getBorder_bottom')
external set _getBorder_bottom(int f(int id));


@JS('setBorder_left')
external set _setBorder_left(void f(int id, int bl));

@JS('getBorder_left')
external set _getBorder_left(int f(int id));



@JS('setMargin_top')
external set _setMargin_top(void f(int id, int mt));

@JS('getMargin_top')
external set _getMargin_top(int f(int id));


@JS('setMargin_right')
external set _setMargin_right(void f(int id, int mr));

@JS('getMargin_right')
external set _getMargin_right(int f(int id));


@JS('setMargin_bottom')
external set _setMargin_bottom(void f(int id, int mb));

@JS('getMargin_bottom')
external set _getMargin_bottom(int f(int id));


@JS('setMargin_left')
external set _setMargin_left(void f(int id, int ml));

@JS('getMargin_left')
external set _getMargin_left(int f(int id));



@JS('setPadding_top')
external set _setPadding_top(void f(int id, int pt));

@JS('getPadding_top')
external set _getPadding_top(int f(int id));


@JS('setPadding_right')
external set _setPadding_right(void f(int id, int pr));

@JS('getPadding_right')
external set _getPadding_right(int f(int id));


@JS('setPadding_bottom')
external set _setPadding_bottom(void f(int id, int pb));

@JS('getPadding_bottom')
external set _getPadding_bottom(int f(int id));


@JS('setPadding_left')
external set _setPadding_left(void f(int id, int pl));

@JS('getPadding_left')
external set _getPadding_left(int f(int id));


@JS('setLeft')
external set _setLeft(void f(int id, int? l));

@JS('getLeft')
external set _getLeft(int? f(int id));


@JS('setTop')
external set _setTop(void f(int id, int? t));

@JS('getTop')
external set _getTop(int? f(int id));


@JS('setRight')
external set _setRight(void f(int id, int? r));

@JS('getRight')
external set _getRight(int? f(int id));


@JS('setBottom')
external set _setBottom(void f(int id, int? b));

@JS('getBottom')
external set _getBottom(int? f(int id));



@JS('setWrap')
external set _setWrap(void f(int id, bool wp));

@JS('getWrap')
external set _getWrap(bool f(int id));


@JS('setFit_content')
external set _setFit_content(void f(int id, bool fc));

@JS('getFit_content')
external set _getFit_content(bool f(int id));


@JS('setOverflow')
external set _setOverflow(void f(int id, int ov));

@JS('getOverflow')
external set _getOverflow(int f(int id));


@JS('setAlignTracks')
external set _setAlignTracks(void f(int id, int at));

@JS('getAlignTracks')
external set _getAlignTracks(int f(int id));


@JS('setAlignItems')
external set _setAlignItems(void f(int id, int ai));

@JS('getAlignItems')
external set _getAlignItems(int f(int id));


@JS('setAlignSelf')
external set _setAlignSelf(void f(int id, int asl));

@JS('getAlignSelf')
external set _getAlignSelf(int f(int id));


@JS('initializeLayout')
external set _initializeLayout(void f());

@JS('reflowAt')
external set _reflowAt(void f(int id));


@JS('getCalculatedWidth')
external set _getCalculatedWidth(int f(int id));

@JS('getCalculatedHeight')
external set _getCalculatedHeight(int f(int id));


@JS('getCalculatedBoundingRect')
external set _getCalculatedBoundingRect(Object f(int id));

@JS('inspectRecursive')
external set _inspectRecursive(void f(int id));


void main(){
	_initializeRootNode = allowInterop(initializeRootNode);
	_addChild = allowInterop(addChild);
	_removeChild = allowInterop(removeChild);
	
	_setDisplay = allowInterop(setDisplay);
	_setPosition = allowInterop(setPosition);
	_setWidth = allowInterop(setWidth);
	_setMinWidth = allowInterop(setMinWidth);
	_setMaxWidth = allowInterop(setMaxWidth);
	_setHeight = allowInterop(setHeight);
	_setMinHeight = allowInterop(setMinHeight);
	_setMaxHeight = allowInterop(setMaxHeight);
	_setLine_height = allowInterop(setLine_height);
	_setBorder_top = allowInterop(setBorder_top);
	_setBorder_right = allowInterop(setBorder_right);
	_setBorder_bottom = allowInterop(setBorder_bottom);
	_setBorder_left = allowInterop(setBorder_left);
	_setMargin_top = allowInterop(setMargin_top);
	_setMargin_right = allowInterop(setMargin_right);
	_setMargin_bottom = allowInterop(setMargin_bottom);
	_setMargin_left = allowInterop(setMargin_left);
	_setPadding_top = allowInterop(setPadding_top);
	_setPadding_right = allowInterop(setPadding_right);
	_setPadding_bottom = allowInterop(setPadding_bottom);
	_setPadding_left = allowInterop(setPadding_left);
	_setLeft = allowInterop(setLeft);
	_setTop = allowInterop(setTop);
	_setRight = allowInterop(setRight);
	_setBottom = allowInterop(setBottom);
	_setWrap = allowInterop(setWrap);
	_setFit_content = allowInterop(setFit_content);
	_setOverflow = allowInterop(setOverflow);
	_setAlignTracks = allowInterop(setAlignTracks);
	_setAlignItems = allowInterop(setAlignItems);
	_setAlignSelf = allowInterop(setAlignSelf);

	_getDisplay = allowInterop(getDisplay);
	_getPosition = allowInterop(getPosition);
	_getWidth = allowInterop(getWidth);
	_getMinWidth = allowInterop(getMinWidth);
	_getMaxWidth = allowInterop(getMaxWidth);
	_getHeight = allowInterop(getHeight);
	_getMinHeight = allowInterop(getMinHeight);
	_getMaxHeight = allowInterop(getMaxHeight);
	_getLine_height = allowInterop(getLine_height);
	_getBorder_top = allowInterop(getBorder_top);
	_getBorder_right = allowInterop(getBorder_right);
	_getBorder_bottom = allowInterop(getBorder_bottom);
	_getBorder_left = allowInterop(getBorder_left);
	_getMargin_top = allowInterop(getMargin_top);
	_getMargin_right = allowInterop(getMargin_right);
	_getMargin_bottom = allowInterop(getMargin_bottom);
	_getMargin_left = allowInterop(getMargin_left);
	_getPadding_top = allowInterop(getPadding_top);
	_getPadding_right = allowInterop(getPadding_right);
	_getPadding_bottom = allowInterop(getPadding_bottom);
	_getPadding_left = allowInterop(getPadding_left);
	_getLeft = allowInterop(getLeft);
	_getTop = allowInterop(getTop);
	_getRight = allowInterop(getRight);
	_getBottom = allowInterop(getBottom);
	_getWrap = allowInterop(getWrap);
	_getFit_content = allowInterop(getFit_content);
	_getOverflow = allowInterop(getOverflow);
	_getAlignTracks = allowInterop(getAlignTracks);
	_getAlignItems = allowInterop(getAlignItems);
	_getAlignSelf = allowInterop(getAlignSelf);

	_initializeLayout = allowInterop(initializeLayout);
	_reflowAt = allowInterop(reflowAt);

	_getCalculatedWidth = allowInterop(getCalculatedWidth);
	_getCalculatedHeight = allowInterop(getCalculatedHeight);

	_getCalculatedBoundingRect = allowInterop(getCalculatedBoundingRect);
	_inspectRecursive = allowInterop(inspectRecursive);
}