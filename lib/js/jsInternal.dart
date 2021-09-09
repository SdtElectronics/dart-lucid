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

void removeChild(int id){
	final child = LTelementNode(Display.inline_block, id);
	final parent = child.parent!;
	parent.removeChild(child);
	elements[id] = null;
}

void display(int id, int disp){
	elements[id]!.display = Display.values[disp];
}

void position(int id, int ps){
	elements[id]!.position = Position.values[ps];
}


void width(int id, int w){
	elements[id]!.width = w;	
}

void minWidth(int id, int mw){
	elements[id]!.minWidth = mw;
}

void maxWidth(int id, int mw){
	elements[id]!.maxWidth = mw;	
}

void height(int id, int h){
	elements[id]!.height = h;
}

void minHeight(int id, int mh){
	elements[id]!.minHeight = mh;
}

void maxHeight(int id, int mh){
	elements[id]!.maxHeight = mh;
}

void line_height(int id, int lh){
	elements[id]!.line_height = lh;
}

void border_top(int id, int bt){
	elements[id]!.border_top = bt;
}

void border_right(int id, int br){
	elements[id]!.border_right = br;
}

void border_bottom(int id, int bb){
	elements[id]!.border_bottom = bb;
}

void border_left(int id, int bl){
	elements[id]!.border_left = bl;
}


void margin_top(int id, int mt){
	elements[id]!.margin_top = mt;
}

void margin_right(int id, int mr){
	elements[id]!.margin_right = mr;
}

void margin_bottom(int id, int mb){
	elements[id]!.margin_bottom = mb;
}

void margin_left(int id, int ml){
	elements[id]!.margin_left = ml;
}


void padding_top(int id, int pt){
	elements[id]!.padding_top = pt;
}

void padding_right(int id, int pr){
	elements[id]!.padding_right = pr;
}

void padding_bottom(int id, int pb){
	elements[id]!.padding_bottom = pb;
}

void padding_left(int id, int pl){
	elements[id]!.padding_left = pl;
}

void left(int id, int l){
	elements[id]!.left = l;
}

void top(int id, int t){
	elements[id]!.top = t;
}

void right(int id, int r){
	elements[id]!.right = r;
}

void bottom(int id, int b){
	elements[id]!.bottom = b;
}


void wrap(int id, bool wp){
	elements[id]!.wrap = wp;
}

void fit_content(int id, bool fc){
	elements[id]!.fit_content = fc;
}

void overflow(int id, int ov){
	elements[id]!.overflow = Overflow.values[ov];
}

void alignTracks(int id, int at){
	elements[id]!.alignTracks = Alignment.values[at];
}

void alignItems(int id, int ai){
	elements[id]!.alignItems = Alignment.values[ai];
}

void alignSelf(int id, int asl){
	elements[id]!.alignSelf = Alignment.values[asl];
}

void initializeLayout(){
	lucid.initializeLayout();
}

void reflowAt(int id){
	lucid.reflowAt(elements[id]!);
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