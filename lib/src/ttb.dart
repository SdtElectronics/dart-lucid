

import 'layoutTree/LTelementNode.dart';
import 'layoutTree/attributeEnums.dart';
import 'lucid.dart';

void main() {
	final n21 = LTelementNode(Display.inline_block, 21);
	n21.fit_content = false;

	final n22 = LTelementNode(Display.inline_block, 22);
	n22.minWidth = 50;
	n22.height = 10;
	n22.fit_content = false;

	final n24 = LTelementNode(Display.inline_block, 24);
	n24.minWidth = 60;
	n24.height = 10;
	n24.fit_content = false;

	final ll = Lucid();
	final root = ll.initializeRootNode(100, 100, 1);

	root.addAll([n21]);


	n21.addAll([n22, n24]);


	ll.initializeLayout();

	root.traverseDown((node) => print(node.toString()));
}