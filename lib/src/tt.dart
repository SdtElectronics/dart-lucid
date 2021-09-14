

import 'layoutTree/LTelementNode.dart';
import 'layoutTree/attributeEnums.dart';
import 'lucid.dart';

void main() {

	final n21 = LTelementNode(Display.inline_block, 21);

	n21.width = 10;
	n21.height = 10;

	final n22 = LTelementNode(Display.inline_block, 22);

	n22.width = 20;
	n22.height = 10;
	n22.margin_left = 0;
	n22.margin_top = 10;

	final n23 = LTelementNode(Display.inline_block, 23);
	n23.height = 4;
	n23.minWidth = 40;
	n23.alignSelf = Alignment.end;
	n23.fit_content = false;

	final n24 = LTelementNode(Display.inline_block, 24);
	n24.width = 30;
	n24.padding_top = 10;
	n24.padding_right = 10;
	final n25 = LTelementNode(Display.inline_block, 25);
	n25.width = 95;
	n25.height = 10;

	final n26 = LTelementNode(Display.inline_block, 26);
	
	n26.addChild(n25);

	final ll = Lucid();
	final root = ll.initializeRootNode(100, 100, 1);

	root.addAll([n21, n22, n23, n24, n26]);
	root.padding_top = 10;
	root.padding_left = 10;
	root.padding_right = 10;
	root.border_bottom = 10;
	root.alignTracks = Alignment.start;
	root.alignItems = Alignment.start;

	ll.initializeLayout();

	root.traverseDown((node) => print(node.toString()));
}