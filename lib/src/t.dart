

import 'layoutTree/LTelementNode.dart';
import 'layoutTree/attributeEnums.dart';

void main() {

	final n1 = LTelementNode(Display.block, 1);

	final n21 = LTelementNode(Display.block, 21);
	final n22 = LTelementNode(Display.block, 22);

	n1.addAll([n21, n22]);

	final n31 = LTelementNode(Display.block, 31);
	final n32 = LTelementNode(Display.block, 32);
	final n33 = LTelementNode(Display.block, 33);

	n21.addAll([n31, n32, n33]);

	final n34 = LTelementNode(Display.block, 34);
	final n35 = LTelementNode(Display.block, 35);

	n22.addAll([n34, n35]);

	final n41 = LTelementNode(Display.block, 41);

	n34.addChild(n41);

	final leaves = n1.traverseDown((node) => print(""));
	
	final ll = LTelementNode.traverseUpTill(leaves, (node) => print(node?.id), (node) => node != null);

	for(final l in ll){
		print("");
		print((l as LTelementNode).id);
	}
}