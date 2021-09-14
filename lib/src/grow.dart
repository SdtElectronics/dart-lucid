

import 'layoutTree/LTelementNode.dart';
import 'layoutTree/attributeEnums.dart';
import 'lucid.dart';

void main() {

	final n21 = LTelementNode(Display.inline_block, 21);

	n21.height = 10;
	n21.fit_content = false;

	final n22 = LTelementNode(Display.inline_block, 22);
	n22.minWidth = 40;
	n22.height = 10;
	n22.fit_content = false;

	final n23 = LTelementNode(Display.inline_block, 23);
	n23.height = 10;
	n23.fit_content = false;

	final n24 = LTelementNode(Display.inline_block, 23);
	n24.margin_left = 20;
	n24.minWidth = 50;
	n24.height = 10;
	n24.fit_content = false;


	final ll = Lucid();
	final root = ll.initializeRootNode(100, 100, 1);

	ll.initializeLayout();

	root.addChild(n21);
	ll.reflowAt(n21);


	root.addChild(n22);
	ll.reflowAt(n22);


	root.addChild(n23);
	ll.reflowAt(n23);

	root.addChild(n24);
	ll.reflowAt(n24);

	ll.reflowAt(root);

	root.traverseDown((node) => print(node.toString()));
}