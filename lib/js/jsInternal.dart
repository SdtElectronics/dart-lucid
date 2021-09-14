import 'package:js/js_util.dart';

import 'package:lucid/src/layoutTree/attributeEnums.dart';

import '../src/lucid.dart';
import '../src/layoutTree/LTelementNode.dart';

final lucid = Lucid();
final elements = <LTelementNode?>[];

int initializeRootNode(int width, int height){
	final root = lucid.initializeRootNode(width, height, 0);
	elements.add(root);
	return 0;
}

int addChild(int parent){
	final id = elements.length;
	final child = LTelementNode(Display.inline_block, id);
	elements.add(child);
	elements[parent]!.addChild(child);
	return id;
}

int? removeChild(int id){
	final child = elements[id]!;
	final parent = child.parent!;
	parent.removeChild(child);
	elements[id] = null;
	return parent.id;
}

void setDisplay(int id, int disp){
	elements[id]!.display = Display.values[disp];
}

int getDisplay(int id){
	return elements[id]!.display.index;
}

void setPosition(int id, int ps){
	elements[id]!.position = Position.values[ps];
}

int getPosition(int id){
	return elements[id]!.position.index;
}


void setWidth(int id, int? w){
	elements[id]!.width = w;	
}

int? getWidth(int id){
	return elements[id]!.width;
}

void setMinWidth(int id, int mw){
	elements[id]!.minWidth = mw;
}

int getMinWidth(int id){
	return elements[id]!.minWidth;
}

void setMaxWidth(int id, int mw){
	elements[id]!.maxWidth = mw;	
}

int getMaxWidth(int id){
	return elements[id]!.maxWidth;
}

void setHeight(int id, int? h){
	elements[id]!.height = h;
}

int? getHeight(int id){
	return elements[id]!.height;
}

void setMinHeight(int id, int mh){
	elements[id]!.minHeight = mh;
}

int getMinHeight(int id){
	return elements[id]!.minHeight;
}

void setMaxHeight(int id, int mh){
	elements[id]!.maxHeight = mh;
}

int getMaxHeight(int id){
	return elements[id]!.maxHeight;
}

void setLine_height(int id, int lh){
	elements[id]!.line_height = lh;
}

int getLine_height(int id){
	return elements[id]!.line_height;
}

void setBorder_top(int id, int bt){
	elements[id]!.border_top = bt;
}

int getBorder_top(int id){
	return elements[id]!.border_top;
}

void setBorder_right(int id, int br){
	elements[id]!.border_right = br;
}

int getBorder_right(int id){
	return elements[id]!.border_right;
}

void setBorder_bottom(int id, int bb){
	elements[id]!.border_bottom = bb;
}

int getBorder_bottom(int id){
	return elements[id]!.border_bottom;
}

void setBorder_left(int id, int bl){
	elements[id]!.border_left = bl;
}

int getBorder_left(int id){
	return elements[id]!.border_left;
}


void setMargin_top(int id, int mt){
	elements[id]!.margin_top = mt;
}

int getMargin_top(int id){
	return elements[id]!.margin_top;
}

void setMargin_right(int id, int mr){
	elements[id]!.margin_right = mr;
}

int getMargin_right(int id){
	return elements[id]!.margin_right;
}

void setMargin_bottom(int id, int mb){
	elements[id]!.margin_bottom = mb;
}

int getMargin_bottom(int id){
	return elements[id]!.margin_bottom;
}

void setMargin_left(int id, int ml){
	elements[id]!.margin_left = ml;
}

int getMargin_left(int id){
	return elements[id]!.margin_left;
}


void setPadding_top(int id, int pt){
	elements[id]!.padding_top = pt;
}

int getPadding_top(int id){
	return elements[id]!.padding_top;
}

void setPadding_right(int id, int pr){
	elements[id]!.padding_right = pr;
}

int getPadding_right(int id){
	return elements[id]!.padding_right;
}

void setPadding_bottom(int id, int pb){
	elements[id]!.padding_bottom = pb;
}

int getPadding_bottom(int id){
	return elements[id]!.padding_bottom;
}

void setPadding_left(int id, int pl){
	elements[id]!.padding_left = pl;
}

int getPadding_left(int id){
	return elements[id]!.padding_left;
}

void setLeft(int id, int? l){
	elements[id]!.left = l;
}

int? getLeft(int id){
	return elements[id]!.left;
}

void setTop(int id, int? t){
	elements[id]!.top = t;
}

int? getTop(int id){
	return elements[id]!.top;
}

void setRight(int id, int? r){
	elements[id]!.right = r;
}

int? getRight(int id){
	return elements[id]!.right;
}

void setBottom(int id, int? b){
	elements[id]!.bottom = b;
}

int? getBottom(int id){
	return elements[id]!.bottom;
}


void setWrap(int id, bool wp){
	elements[id]!.wrap = wp;
}

bool getWrap(int id){
	return elements[id]!.wrap;
}

void setFit_content(int id, bool fc){
	elements[id]!.fit_content = fc;
}

bool getFit_content(int id){
	return elements[id]!.fit_content;
}

void setOverflow(int id, int ov){
	elements[id]!.overflow = Overflow.values[ov];
}

int getOverflow(int id){
	return elements[id]!.overflow.index;
}

void setAlignTracks(int id, int at){
	elements[id]!.alignTracks = Alignment.values[at];
}

int getAlignTracks(int id){
	return elements[id]!.alignTracks.index;
}

void setAlignItems(int id, int ai){
	elements[id]!.alignItems = Alignment.values[ai];
}

int getAlignItems(int id){
	return elements[id]!.alignItems.index;
}

void setAlignSelf(int id, int asl){
	elements[id]!.alignSelf = Alignment.values[asl];
}

int getAlignSelf(int id){
	return elements[id]!.alignSelf.index;
}

void initializeLayout(){
	lucid.initializeLayout();
}

void reflowAt(int id){
	lucid.reflowAt(elements[id]!);
}

int getCalculatedWidth(int id){
	return elements[id]!.calculatedWidth;
}

int getCalculatedHeight(int id){
	return elements[id]!.calculatedHeight;
}

Object getCalculatedBoundingRect(int id){
	final object = newObject();
	final rect = elements[id]!.calculatedAbsoluteBoundingRect;
	setProperty(object, "startX", rect.startX);
	setProperty(object, "endX", rect.endX);
	setProperty(object, "startY", rect.startY);
	setProperty(object, "endY", rect.endY);
	return object;
}

void inspectRecursive(int id){
	elements[id]!.traverseDown((node) => print(node.toString()));
}