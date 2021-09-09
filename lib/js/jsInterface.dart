@JS()
library lucid.js;

import 'package:js/js.dart';

import 'jsInternal.dart';

@JS('initializeRootNode')
external set _initializeRootNode(int f(int width, int height));

@JS('addChild')
external set _addChild(int f(int parent));

@JS('removeChild')
external set _removeChild(void f(int id));

@JS('setDisplay')
external set _display(void f(int id, int disp));

@JS('setPosition')
external set _position(void f(int id, int ps));


@JS('setWidth')
external set _width(void f(int id, int w));

@JS('setMinWidth')
external set _minWidth(void f(int id, int mw));

@JS('setMaxWidth')
external set _maxWidth(void f(int id, int mw));

@JS('setHeight')
external set _height(void f(int id, int h));

@JS('setMinHeight')
external set _minHeight(void f(int id, int mh));

@JS('setMaxHeight')
external set _maxHeight(void f(int id, int mh));

@JS('setLine_height')
external set _line_height(void f(int id, int lh));

@JS('setBorder_top')
external set _border_top(void f(int id, int bt));

@JS('setBorder_right')
external set _border_right(void f(int id, int br));

@JS('setBorder_bottom')
external set _border_bottom(void f(int id, int bb));

@JS('setBorder_left')
external set _border_left(void f(int id, int bl));


@JS('setMargin_top')
external set _margin_top(void f(int id, int mt));

@JS('setMargin_right')
external set _margin_right(void f(int id, int mr));

@JS('setMargin_bottom')
external set _margin_bottom(void f(int id, int mb));

@JS('setMargin_left')
external set _margin_left(void f(int id, int ml));


@JS('setPadding_top')
external set _padding_top(void f(int id, int pt));

@JS('setPadding_right')
external set _padding_right(void f(int id, int pr));

@JS('setPadding_bottom')
external set _padding_bottom(void f(int id, int pb));

@JS('setPadding_left')
external set _padding_left(void f(int id, int pl));

@JS('setLeft')
external set _left(void f(int id, int l));

@JS('setTop')
external set _top(void f(int id, int t));

@JS('setRight')
external set _right(void f(int id, int r));

@JS('setBottom')
external set _bottom(void f(int id, int b));


@JS('setWrap')
external set _wrap(void f(int id, bool wp));

@JS('setFit_content')
external set _fit_content(void f(int id, bool fc));

@JS('setOverflow')
external set _overflow(void f(int id, int ov));

@JS('setAlignTracks')
external set _alignTracks(void f(int id, int at));

@JS('setAlignItems')
external set _alignItems(void f(int id, int ai));

@JS('setAlignSelf')
external set _alignSelf(void f(int id, int asl));

@JS('initializeLayout')
external set _initializeLayout(void f());

@JS('reflowAt')
external set _reflowAt(void f(int id));

@JS('getCalculatedBoundingRect')
external set _getCalculatedBoundingRect(Object f(int id));

@JS('inspectRecursive')
external set _inspectRecursive(void f(int id));


void main(){
	_initializeRootNode = allowInterop(initializeRootNode);
	_addChild = allowInterop(addChild);
	_removeChild = allowInterop(removeChild);
	_display = allowInterop(display);
	_position = allowInterop(position);
	_width = allowInterop(width);
	_minWidth = allowInterop(minWidth);
	_maxWidth = allowInterop(maxWidth);
	_height = allowInterop(height);
	_minHeight = allowInterop(minHeight);
	_maxHeight = allowInterop(maxHeight);
	_line_height = allowInterop(line_height);
	_border_top = allowInterop(border_top);
	_border_right = allowInterop(border_right);
	_border_bottom = allowInterop(border_bottom);
	_border_left = allowInterop(border_left);
	_margin_top = allowInterop(margin_top);
	_margin_right = allowInterop(margin_right);
	_margin_bottom = allowInterop(margin_bottom);
	_margin_left = allowInterop(margin_left);
	_padding_top = allowInterop(padding_top);
	_padding_right = allowInterop(padding_right);
	_padding_bottom = allowInterop(padding_bottom);
	_padding_left = allowInterop(padding_left);
	_left = allowInterop(left);
	_top = allowInterop(top);
	_right = allowInterop(right);
	_bottom = allowInterop(bottom);
	_wrap = allowInterop(wrap);
	_fit_content = allowInterop(fit_content);
	_overflow = allowInterop(overflow);
	_alignTracks = allowInterop(alignTracks);
	_alignItems = allowInterop(alignItems);
	_alignSelf = allowInterop(alignSelf);
	_initializeLayout = allowInterop(initializeLayout);
	_reflowAt = allowInterop(reflowAt);
	_getCalculatedBoundingRect = allowInterop(getCalculatedBoundingRect);
	_inspectRecursive = allowInterop(inspectRecursive);
}