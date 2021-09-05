import 'dart:collection';

import 'layoutTree/LTelementNode.dart';
import 'layoutTree/attributeEnums.dart';

class Lucid{
	final rootNode = LTelementNode(Display.block);
	
	/// build the root node
	/// root node must be a block element which has fixed [width] and [height]
	/// and with overflow set to hidden
	LTelementNode initializeRootNode(int width, int height, [int? id]){
		rootNode.initializeAsRoot(width, height);
		rootNode.id = id;
		return rootNode;
	}

	/// reflow children with same parent
	void reflowBatch(List<LTelementNode> nodes){
		// group nodes by their stageToUpdate
		final groupedNodes = List<List<LTelementNode>>.filled(4, []);
		for(final node in nodes){
			groupedNodes[node.stageToUpdate].add(node);
		}
		
		final updateGroup0 = groupedNodes[0];
		LTelementNode stage1Root = updateGroup0.first;
		if(updateGroup0.isNotEmpty){
			// apply stage0 on each node in group0
			for(final node in updateGroup0){
				node.stage0Update();
			}

			// traceUp on their parent, apply stage0 on each traced parent
			// until end condition: calculatedWidth is unchanged
			// or position is not relative
			final temp = stage1Root.traceUpTill((node){
				if(node == null){
					return false;
				}
				return node.stage0Update() && (node.position == Position.relative);
			});

			stage1Root = temp == null ? rootNode : temp;
		}

		// traverseDown on the node where traceUp ended, 
		// and apply stage1 on each child
		stage1Root.traverseDown((node){
			node!.stage1Update();
		});
		// store leaves returned grouped by parents for next stage
		
		// if group0 is not empty, skip applying stage1 on each node in group1
		// since they have finished stage1 update in previous operation

			// store leaves returned grouped by parents for next stage

		// for each group of leaves, traverseUp to apply stage2 on each parent
		// until end condition: calculatedHeight is unchanged

			// store parents returned for next stage

		// add nodes where traceUp ended to a set to remove duplicate

		// for each node in set, traverseDown to apply stage3 on each node

	}

	///reflow each node in [nodes]
	void reflowAll(){
		// group nodes by their parents

		//call reflowBatch
	}

	void initializeLayout(){
		// traverseDown from root to collect leaves
		final leaves = rootNode.traverseDown((node) { });

		// traverseUp to apply stage0 update on all nodes
		LTelementNode.traverseUpTill(leaves, 
			(node) => node!.stage0Update(), 
			(node) => node != null
		);

		// stage1
		rootNode.traverseDown((node){
			node!.stage1Update();
		});

		// stage2
		LTelementNode.traverseUpTill(leaves, 
			(node) => node!.stage2Update(), 
			(node) => node != null
		);

		// stage3
		rootNode.traverseDown((node){
			node!.stage3Update();
		});

	}
}