import 'dart:math';

import '../constants.dart';
import '../helper/rect.dart';
import 'attributeEnums.dart';

class LTelementNode{
	LTelementNode(Display disp, [this.id]): _display = disp;

	Display get display{
		return _display;
	}

	set display(Display disp){
		if(_display == Display.inline || disp == Display.inline){

		}
		stageToUpdate = 0;
		_display = disp;
	}

	Position get position{
		return _position;
	}

	set position(Position ps){
		stageToUpdate = 0;
		_position = ps;
	}

	int? get width{
		return _width;
	}

	// All elements can be designated with a width or max-width
	// While inline elements cannot be designated with a height
	set width(int? w){
		stageToUpdate = 0;
		_width = w;
	}

	int get minWidth{
		return _minWidth;
	}

	set minWidth(int mw){
		stageToUpdate = 0;
		_minWidth = mw;
	}

	int get maxWidth{
		return _maxWidth;
	}

	set maxWidth(int mw){
		stageToUpdate = 0;
		_maxWidth = mw;
	}

	int? get height{
		return _height;
	}

	set height(int? h){
		if(_display == Display.inline){

		}
		stageToUpdate = min(stageToUpdate, 2);
		_height = h;
	}

	int get minHeight{
		return _minHeight;
	}

	set minHeight(int mh){
		if(_display == Display.inline){
			
		}
		stageToUpdate = min(stageToUpdate, 2);
		_minHeight = mh;
	}

	int get maxHeight{
		return _maxHeight;
	}

	set maxHeight(int mh){
		if(_display == Display.inline){
			
		}
		stageToUpdate = min(stageToUpdate, 2);
		_maxHeight = mh;
	}

	int get line_height{
		return _line_height;
	}

	set line_height(int lh){
		if(_display != Display.inline){
			
		}
		stageToUpdate = min(stageToUpdate, 2);
		_line_height = lh;
	}

	int get border_top{
		return _border_top;
	}

	set border_top(int bt){
		stageToUpdate = min(stageToUpdate, 2);
		_border_top = bt;
	}

	int get border_right{
		return _border_right;
	}

	set border_right(int br){
		stageToUpdate = 0;
		_border_right = br;
	}

	int get border_bottom{
		return _border_bottom;
	}

	set border_bottom(int bb){
		stageToUpdate = min(stageToUpdate, 2);
		_border_bottom = bb;
	}

	int get border_left{
		return _border_left;
	}

	set border_left(int bl){
		stageToUpdate = 0;
		_border_left = bl;
	}


	int get margin_top{
		return _margin_top;
	}

	set margin_top(int mt){
		stageToUpdate = min(stageToUpdate, 2);
		_margin_top = mt;
	}

	int get margin_right{
		return _margin_right;
	}

	set margin_right(int mr){
		stageToUpdate = 0;
		_margin_right = mr;
	}

	int get margin_bottom{
		return _margin_bottom;
	}

	set margin_bottom(int mb){
		stageToUpdate = min(stageToUpdate, 2);
		_margin_bottom = mb;
	}

	int get margin_left{
		return _margin_left;
	}

	set margin_left(int ml){
		stageToUpdate = 0;
		_margin_left = ml;
	}


	int get padding_top{
		return _padding_top;
	}

	set padding_top(int pt){
		stageToUpdate = min(stageToUpdate, 2);
		_padding_top = pt;
	}

	int get padding_right{
		return _padding_right;
	}

	set padding_right(int pr){
		stageToUpdate = 0;
		_padding_right = pr;
	}

	int get padding_bottom{
		return _padding_bottom;
	}

	set padding_bottom(int pb){
		stageToUpdate = min(stageToUpdate, 2);
		_padding_bottom = pb;
	}

	int get padding_left{
		return _padding_left;
	}

	set padding_left(int pl){
		stageToUpdate = 0;
		_padding_left = pl;
	}


	int? get left{
		return _left;
	}

	set left(int? l){
		// left will affect sizes of non-relatively-positioned elements
		// whose right is designated
		if(_position != Position.relative && _right != null){
			stageToUpdate = min(stageToUpdate, 1);
		}else{
			stageToUpdate = min(stageToUpdate, 3);
		}
			
		_left = l;
	}

	int? get top{
		return _top;
	}

	set top(int? t){
		stageToUpdate = min(stageToUpdate, 3);
		_top = t;
	}

	int? get right{
		return _right;
	}

	set right(int? r){
		if(_position == Position.relative){

		}
		
		if(_left != null){
			stageToUpdate = min(stageToUpdate, 1);
		}else{
			stageToUpdate = min(stageToUpdate, 3);
		}

		_right = r;
	}

	int? get bottom{
		return _bottom;
	}

	set bottom(int? b){
		if(_position == Position.relative){

		}
		stageToUpdate = min(stageToUpdate, 3);
		_bottom = b;
	}


	bool get wrap{
		return _wrap;
	}

	set wrap(bool wp){
		stageToUpdate = 0;
		_wrap = wp;
	}

	bool get fit_content{
		return _fit_content;
	}

	set fit_content(bool fc){
		stageToUpdate = 0;
		_fit_content = fc;
	}

	Overflow get overflow{
		return _overflow;
	}

	set overflow(Overflow ov){
		if(_display == Display.inline){

		}
		stageToUpdate = min(stageToUpdate, 4);
		_overflow = ov;
	}


	Alignment get alignTracks{
		return _alignTracks;
	}

	set alignTracks(Alignment at){
		stageToUpdate = min(stageToUpdate, 3);
		_alignTracks = at;
	}

	Alignment get alignItems{
		return _alignItems;
	}

	set alignItems(Alignment ai){
		stageToUpdate = min(stageToUpdate, 3);
		_alignItems = ai;
	}

	Alignment get alignSelf{
		return _alignSelf;
	}

	set alignSelf(Alignment asl){
		stageToUpdate = min(stageToUpdate, 3);
		_alignSelf = asl;
	}

	Rect get calculatedAbsoluteBoundingRect{
		return _calculatedAbsoluteBoundingRect;
	}

	// Designated during initialization
	int? id;

	LTelementNode? parent;

	// 
	int stageToUpdate = 0;

	final _children = <LTelementNode>[];

	Display _display;
	Position _position = Position.relative;

	int? _width;
	int _minWidth = 0;
	int _maxWidth = maxInt;

	// used by inline elements, represents total width of content
	int _content_width = 0;

	int? _height;
	int _minHeight = 0;
	int _maxHeight = maxInt;

	// used by inline elements, represents height of a line
	int _line_height = 0;


	int _border_top = 0;
	int _border_right = 0;
	int _border_bottom = 0;
	int _border_left = 0;

	int _margin_top = 0;
	int _margin_right = 0;
	int _margin_bottom = 0;
	int _margin_left = 0;

	int _padding_top = 0;
	int _padding_right = 0;
	int _padding_bottom = 0;
	int _padding_left = 0;

	int? _left;
	int? _top;
	int? _right;
	int? _bottom;

	bool _wrap = true;

	bool _fit_content = true;

	Overflow _overflow = Overflow.hidden;

	Alignment _alignTracks = Alignment.start;
	Alignment _alignItems = Alignment.start;
	Alignment _alignSelf = Alignment.start;


	int _calculatedMaxWidth = 0;
	bool _needcalculateWidthstage1 = true;

	int _calculatednoWrapRowWidth = 0;

	int get calculatedWidth{
		return _calculatedWidth;
	}

	int get calculatedHeight{
		return _calculatedHeight;
	}

	int _calculatedWidth = 0;
	int _calculatedHeight = 0;

	int _calculatedRowHeightSum = 0;

	final _calculatedRelativeBoundingRect = Rect(0, 0, 0, 0);
	final _calculatedAbsoluteBoundingRect = Rect(0, 0, 0, 0);

	final _calculatedAbsoluteClippingRect = Rect(0, 0, 0, 0);

	final _calculatedAbsoluteViewportRect = Rect(0, 0, 0, 0);

	int _calculatedLineStartLeft = 0;
	int _calculatedLines = 0;

	// Each time _calculatedWidth is changed, _rowWidth must be rechecked
	// to ensure it is greater than _calculatedWidth - border - margin
	int _rowWidth = 0;
	final _rows = <LTblockElementRow>[];

	int _arrivedTraces = 0;

	// calculate 
	int _calculateRowWidthStage0(){
		int ret = 0;
		int noWrapRowWidth = 0;

		// represents the width of the widest row when no wrap is applied
		_calculatednoWrapRowWidth = 0;

		for(final node in _children){
			// Not relatively positioned elements take no space
			// So exclude them from width calculation
			if(node._position != Position.relative){	
				continue;
			}

			int currentWidth = node._rowWidth
							+ node.border_left
							+ node.border_right
							+ node.padding_left
							+ node.padding_right
							+ node._margin_left 
							+ node._margin_right;

			if(node._display == Display.block){
				noWrapRowWidth = max(noWrapRowWidth, currentWidth);
				_calculatednoWrapRowWidth = max(_calculatednoWrapRowWidth, noWrapRowWidth);
				noWrapRowWidth = 0;
			}else{
				noWrapRowWidth += currentWidth;
			}

			ret = max(ret, currentWidth);
		}

		_calculatednoWrapRowWidth = max(noWrapRowWidth, _calculatednoWrapRowWidth);

		if(!_wrap){
			ret = _calculatednoWrapRowWidth;
		}

		if(_width != null){
			int filledRowWidth = _width! - _padding_left - _padding_right
										- _border_left - _border_right;
			ret = max(ret, filledRowWidth);
		}else{
			int filledRowWidth = _minWidth - _padding_left - _padding_right
											- _border_left - _border_right;
			ret = max(ret, filledRowWidth);
		}

		return ret;
	}

	int _calculateWidthStage0(){
		_needcalculateWidthstage1 = true;

		if(_width != null){
			_needcalculateWidthstage1 = false;
			return _width!;
		}
		
		if(_display == Display.inline){
			// do not reserve space for inline element can be wrapped
			if(_wrap){
				return 0;
			}
			return _content_width;
		}

		int extraWidth = padding_left + _padding_right +
						 _border_left + _border_right;

		int ret = _calculatednoWrapRowWidth + extraWidth;

		if(ret > _maxWidth){
			_needcalculateWidthstage1 = false;
			_rowWidth = _maxWidth - extraWidth;
			return _maxWidth;
		}else if(ret < _minWidth){
			if(_fit_content){
				_needcalculateWidthstage1 = false;
			}
			_rowWidth = _minWidth - extraWidth;
			return _minWidth;
		}
		return ret;
	}

	void _calculateWidthAbsoluteStage1(){
			_width = max(0, parent!._calculatedWidth - _left! - _right!);
			int filledRowWidth = _width! - _padding_left - _padding_right
										- _border_left - _border_right;
			_rowWidth = max(_rowWidth, filledRowWidth);
	}

	void _calculateLayoutFixedStage1(){
		LTelementNode? root;
		final rect = _calculatedAbsoluteBoundingRect;
		if(_left != null){
			rect.startX = _left!;
		}

		if(_right !=null){
			// when left and right is both designated, the calculated width is dictated
			// by this constraint, regardless of designated (max/min) width 
			if(_left != null){
				root = traceUpTill((node) => node!.parent != null);
				_calculatedWidth = root!._width! - _left! - _right!;
			}else{
				rect.startX = rect.endX - _calculatedWidth;
			}
			rect.endX = root!._width! - _right!;
		}else{
			rect.endX = rect.startX + _calculatedWidth;
		}

		if(_top != null){
			rect.startY = _top!;

			// when top and bottom is both designated, the calculated height is dictated
			// by this constraint, regardless of designated (max/min) height 
			if(_bottom !=null){
				if(root == null){
					root = traceUpTill((node) => node!.parent != null);
				}
				_calculatedHeight = root!._height! - _top! - _bottom!;
				rect.endY = rect.startY + _calculatedHeight;
			}
		}
	}

	void _calculateRowWidthStage1(){
		_rowWidth = max(
					_calculatedWidth -
					_border_left -
					_border_right -
					_padding_left -
					_padding_right,
					_rowWidth
		);
	}

	void _calculateWidthStage1(){
		_calculateRowWidthStage1();
		_arrangeChildrenInRows();
		int minRestRowWidth = _rowWidth;
		for(final row in _rows){
			minRestRowWidth = min(minRestRowWidth, row.restWidth);
		}
		_calculatedWidth -= minRestRowWidth;
		_calculateRowWidthStage1();
	}

	void _arrangeChildrenInRows(){
		_rows.clear();
		LTblockElementRow currentRow = LTblockElementRow(_rowWidth);
		_rows.add(currentRow);

		for(final node in _children){
			// Not relatively positioned elements are not contained in rows
			if(node._position != Position.relative){	
				continue;
			}

			switch(node._display){
			  	case Display.block: {
					// block elements occupy a row
					if(currentRow.children.isNotEmpty){
						currentRow.calculateWidthStage1();
						currentRow = LTblockElementRow(_rowWidth);
						_rows.add(currentRow);
					}

					int netRestWidth = _rowWidth - node._margin_left 
											 	- node._margin_right;

					// It is guaranteed that _rowWidth can fit in at least an 
					// arbitrary node in Stage0
					if(!node._fit_content){
						node._calculatedWidth = min(netRestWidth, node._maxWidth);
						node._calculateRowWidthStage1();
					}else{
						node._calculateWidthStage1();
					}
					
					currentRow.restWidth = netRestWidth - node._calculatedWidth;

					currentRow.children.add(node);

					currentRow = LTblockElementRow(_rowWidth);
					_rows.add(currentRow);

					break;
				}
				
			  	case Display.inline_block: {
					int rowRestWidth = currentRow.restWidth;
					int margin = node._margin_left + node._margin_right;

					int occupiedWidth = node._calculatedMaxWidth + margin;

					if(node._needcalculateWidthstage1){
						if(rowRestWidth < occupiedWidth){
							if(_rowWidth < occupiedWidth){
								node._calculatedWidth = _rowWidth - margin;
								node._calculateWidthStage1();
								currentRow.calculateWidthStage1();
								if(node._fit_content){
									currentRow = LTblockElementRow(_rowWidth - node._calculatedWidth - margin);
									currentRow.children.add(node);
								}else{
									node._calculatedMaxWidth = node._calculatedWidth;
									currentRow = LTblockElementRow(_rowWidth);
									currentRow.freeWidth -= margin;
									currentRow.addFreeNode(node);
								}	
								
								_rows.add(currentRow);
								continue;
							}else{
								currentRow.calculateWidthStage1();
								currentRow = LTblockElementRow(_rowWidth);
								_rows.add(currentRow);
							}
						}

						node._calculatedWidth = node._calculatedMaxWidth;
						node._calculateRowWidthStage1();

						if(node._fit_content){
							currentRow.restWidth -= occupiedWidth;
							currentRow.freeWidth -= occupiedWidth;
							currentRow.children.add(node);
						}else{
							currentRow.freeWidth -= margin;
							currentRow.addFreeNode(node);
						}
					}else{
						node._calculatedWidth = node._calculatedMaxWidth;
						
						// if width rest in row is not enough, create a new row
						if(rowRestWidth < occupiedWidth){
							rowRestWidth = _rowWidth - occupiedWidth;
							currentRow.calculateWidthStage1();
							currentRow = LTblockElementRow(rowRestWidth);
							currentRow.children.add(node);
							_rows.add(currentRow);
						}else{
							currentRow.restWidth -= occupiedWidth;
							currentRow.freeWidth -= occupiedWidth;
							currentRow.children.add(node);
						}
					}

					break;
				}
				
			  	case Display.inline: {
					int remainedContentWidth = node._content_width;
					if(remainedContentWidth == 0){
						return;
					}

					// if element allows wrap, fill remained width in row
					// if there is content remained, create a new row and repeat
					if(node._wrap){
						while(remainedContentWidth > 0){
							++_calculatedLines;
							int rowRestWidth = currentRow.restWidth - remainedContentWidth;
							currentRow.children.add(node);
							if(rowRestWidth > 0){
								currentRow.restWidth = rowRestWidth;
							}else{
								currentRow.restWidth = 0;
								currentRow = LTblockElementRow(_rowWidth);
								_rows.add(currentRow);
							}
						}
					}else{
						++_calculatedLines;
						if(currentRow.restWidth > remainedContentWidth){
							currentRow.restWidth -= remainedContentWidth;
						}else{
							int rowRestWidth = _rowWidth - remainedContentWidth;
							currentRow = LTblockElementRow(rowRestWidth);
							_rows.add(currentRow);
						}
						currentRow.children.add(node);
					}
					break;
				  }
			}
		}

		if(currentRow.freeNode.isNotEmpty){
			currentRow.calculateWidthStage1();
		}
	}

	// calculate height for relatively positioned elements and non-relatively-positioned 
	// element whose height is not constrained by positioning
	int _calculateHeightStage2(){
		_calculatedRowHeightSum = 0;
		for(final row in _rows){
			_calculatedRowHeightSum += row.calcHeight();
		}

		if(_height != null){
			return _height!;
		}

		int heightSum = _calculatedRowHeightSum +
						_padding_top +
						_padding_bottom +
						_border_top +
						_border_bottom;

		return heightSum.clamp(_minHeight, _maxHeight);
	}

	// calculate height for non-relatively-positioned element 
	// whose height is constrained by positioning
	void _calculateHeightAbsoluteStage3(){
		_height = max(0, parent!._calculatedHeight - _top! - _bottom!);
	}

	// calculate positions of children relative to parent
	void _calculateRelativePosition(){
		// extra space between rows for space_between alignment
		int spacingHeight = 0;
		int currentY = _border_top + _padding_top;
		if(_alignTracks != Alignment.start){
			int remainedHeight = max(0, _calculatedHeight -
										_padding_top -
										_padding_bottom -
										_border_top -
										_border_bottom -
										_calculatedRowHeightSum);
			switch(_alignTracks){
			  case Alignment.end:
				currentY += remainedHeight;
				break;
			  
			  case Alignment.center:
				currentY += (remainedHeight / 2).round();
			  	break;
			
			  case Alignment.space_between:
				spacingHeight = (remainedHeight / max(_rows.length - 1, 1)).round();
			  	break;
			}
		}

		for(final row in _rows){
			// extra space between children for space_between alignment
			int currentX = _border_left + _padding_left;
			int spacingWidth = 0;
			switch(_alignItems){
			  case Alignment.end:
				currentX += row.restWidth;
				break;
			  
			  case Alignment.center:
				currentX += (row.restWidth / 2).round();
			  	break;
			
			  case Alignment.space_between:
				spacingWidth = (row.restWidth / max(row.children.length - 1, 1)).round();
			  	break;
			}

			for(final node in row.children){
				final rect = node._calculatedRelativeBoundingRect;
				if(_top != null){
					rect.startY = _top!;
				}

				switch(node._alignSelf){
				  case Alignment.start:
					rect.startY = currentY + node._margin_top;
					break;
				  
				  case Alignment.end:
					rect.startY = currentY + row.height 
								- node._calculatedHeight - node._margin_bottom;
					break;

				  case Alignment.center:
					rect.startY = currentY + ((row.height 
											- node._calculatedHeight) / 2).round();
					break;
				}

				rect.startX = 0;
				if(_left != null){
					rect.startX = _left!;
				}

				rect.startX += currentX + node._margin_left;
				rect.endX = rect.startX + node._calculatedWidth;
				rect.endY = rect.startY + node._calculatedHeight;

				currentX += (node._margin_left +
							node._margin_right +
							node._calculatedWidth +
							spacingWidth);
			}
			currentY += (row.height + spacingHeight);
		}

		for(final node in _children){
			if(node._position == Position.absolute){
				final rect = node._calculatedRelativeBoundingRect;
				if(_left != null){
					rect.startX = _left!;
				}

				if(_right != null){
					rect.endY = _calculatedWidth - node._right!;
				}
				rect.startX = rect.endY - node._calculatedWidth;

			}
		}
	}

	// calculate positions of children relative to root element
	void _calculateAbsolutePosition(){
		int absoluteOriginX = _calculatedAbsoluteBoundingRect.startX;
		int absoluteOriginY = _calculatedAbsoluteBoundingRect.startY;

		for(final node in _children){
			final relativeRect = node._calculatedRelativeBoundingRect;
			final absoluteRect = node._calculatedAbsoluteBoundingRect;
			if(node._position != Position.fixed){
				absoluteRect.startX = relativeRect.startX + absoluteOriginX;
				absoluteRect.startY = relativeRect.startY + absoluteOriginY;
				absoluteRect.endX = relativeRect.endX + absoluteOriginX;
				absoluteRect.endY = relativeRect.endY + absoluteOriginY;
			}
		}
	}

	// Element update functions, call by traversing functions
	// Top-down update functions return nothing
	// while bottom-up update functions return a flag indicating whether keep traversing
	bool stage0Update(){
		stageToUpdate = 1;
		_rowWidth = _calculateRowWidthStage0();
		int tempWidth = _calculateWidthStage0();
		if(tempWidth != _calculatedMaxWidth){
			_calculatedMaxWidth = tempWidth;
			return true;
		}
		return false;
	}

	void stage1Update(){
		stageToUpdate = 2;
		// when left and right is both designated, the calculated width is dictated
		// by this constraint, regardless of designated (max/min) width 
		if(_position == Position.absolute && _left != null && _right !=null){
			_calculateWidthAbsoluteStage1();
		}else if(_position == Position.fixed){
			_calculateLayoutFixedStage1();
		}
		
		if(_display != Display.inline){
			_arrangeChildrenInRows();
		}
	}

	bool stage2Update(){
		stageToUpdate = 3;
		// if both _bottom and _top are not null, it is a non-relative-positioned element
		// whose height is dictated by its positioning and should not be calculated here
		if(_bottom == null || _top == null){
			int tempHeight = _calculateHeightStage2();
			if(tempHeight != _calculatedHeight){
				_calculatedHeight = tempHeight;
				return true;
			}
		}
		return false;
	}

	void stage3Update(){
		stageToUpdate = 4;
		if(_position == Position.absolute &&
			_bottom != null && _top != null){
			_calculateHeightAbsoluteStage3();
		}
		_calculateRelativePosition();
		_calculateAbsolutePosition();
	}

	int addChild(LTelementNode node){
		_children.add(node);
		node.parent = this;

		stageToUpdate = 0;
		return _children.length;
	}

	int addAll(List<LTelementNode> nodes){
		for(final node in nodes){
			addChild(node);
		}
		return _children.length;
	}

	/// remove [node] from children
	/// return true if [node] is in children, otherwise return false.
	bool removeChild(LTelementNode node){
		if(_children.remove(node)){
			stageToUpdate = 0;
			return true;
		}
		return false;
	}

	void initializeAsRoot(int width, int height){
		overflow = Overflow.hidden;

		_width = width;
		_height = height;
		
		_calculatedRelativeBoundingRect.endX = width;
		_calculatedRelativeBoundingRect.endY = height;

		_calculatedAbsoluteBoundingRect.endX = width;
		_calculatedAbsoluteBoundingRect.endY = height;

		_calculatedAbsoluteClippingRect.endX = width;
		_calculatedAbsoluteClippingRect.endY = height;

		_calculatedAbsoluteViewportRect.startX = _border_left;
		_calculatedAbsoluteViewportRect.startY = _border_top;
		_calculatedAbsoluteViewportRect.endX = width - _border_right;
		_calculatedAbsoluteViewportRect.endY = height - _border_bottom;
	}

	void forEach(void callBack(node)){
		for(final node in _children){
			callBack(node);
		}
	}

	bool get _hasLastArrived{
		if(++_arrivedTraces == _children.length){
			_arrivedTraces = 0;
			return true;
		}
		return false;
	}

	LTelementNode? traceUpTill(bool callBack(LTelementNode? node)){
		LTelementNode? currentNode = this;
		while(callBack(currentNode)){
			currentNode = currentNode?.parent;
		}
		return currentNode;
	}

	/// top-down traverse all nodes and invoke [callback] with current node as parameter
	List<LTelementNode> traverseDown(void callBack(LTelementNode? node)){
		callBack(this);
		List<LTelementNode> children = _children;
		if(children.isEmpty){
			return [this];
		}
		final ret = <LTelementNode>[];
		while(true){
			final temp = <LTelementNode>[];
			for(final node in children){
				callBack(node);
				if(node._children.isNotEmpty){
					temp.addAll(node._children);
				}else{
					ret.add(node);
				}
			}
			if(temp.isEmpty){
				return ret;
			}else{
				children = temp;
			}
		}
	}

	///bottom-up traverse all nodes and invoke [callback] with current node as parameter
	///[nodes] should be a List containing all the leaf nodes returned by [traverseDown] 
	static List<LTelementNode?> traverseUpTill(List<LTelementNode> nodes, 
												void callBack(LTelementNode? node), 
												bool endPred(LTelementNode? node)){
		final ret = <LTelementNode?>[];
		for(final node in nodes){
			callBack(node);
			LTelementNode? parent = node.parent;
			if(parent != null){
				if(parent._hasLastArrived){
					while(true){
						bool notBreak = true;
						if(notBreak && endPred(parent)){
							callBack(parent);
						}else{
							notBreak = false;				
							ret.add(parent);
						}

						LTelementNode? grandparent = parent!.parent;
						if(grandparent != null){
							if(grandparent._hasLastArrived){
								parent = grandparent;
							}else{
								break;
							}
						}else{				
							ret.add(parent);
							break;
						}
					}
				}
			}else{	
				ret.add(parent);
			}
		}

		return ret;
	}

	@override
  	String toString(){
    	return "id: $id, left: ${_calculatedAbsoluteBoundingRect.toString()}";
  	}
}

class LTblockElementRow{
	LTblockElementRow(int rowWidth): restWidth = rowWidth,
									 freeWidth = rowWidth;

	int height = 0;
	int restWidth;
	int freeWidth;

	final children = <LTelementNode>[];
	// inline-blocks with fit-content set to false
	final freeNode = <LTelementNode>[];

	// add an inline-block with fit-content set to false
	// return true if rest width can fit, otherwise return false
	void addFreeNode(LTelementNode node){
		/*
		int margin = node._margin_right + node._margin_left;
		int occupiedWidth = node._calculatedWidth + margin;
		if(restWidth < occupiedWidth){
			return false;
		}
		restWidth -= occupiedWidth;
		freeWidth -= margin;
		*/
		children.add(node);
		freeNode.add(node);
	}

	int calcHeight(){
		int ret = 0;
		for(final node in children){
			// Not relatively positioned elements are not placed into rows
			// So no need to exclude them here
			if(node._display == Display.inline){
				ret = max(node._line_height, ret);
				continue;
			}

			int currentHeight = node._calculatedHeight;
			currentHeight += node._margin_top;
			currentHeight += node._margin_bottom;
			ret = max(currentHeight, ret);
		}
		return height = ret;
	}

	// calculate width for inline-blocks with fit-content set to false
	void calculateWidthStage1(){
		double avgWidth = freeWidth / freeNode.length;
		while(true){
			int widthSum = 0;
			bool finished = true;
			for(final node in freeNode){
				if(node._maxWidth < avgWidth){
					node._calculatedWidth = node._maxWidth;
					node._calculateRowWidthStage1();
					freeWidth -= node._maxWidth;
					restWidth -= node._maxWidth;
					freeNode.remove(node);
					finished = false;
					break;
				}

				if(node._calculatedMaxWidth > avgWidth){
					node._calculatedWidth = node._calculatedMaxWidth;
					node._calculateRowWidthStage1();
					freeWidth -= node._calculatedWidth;
					restWidth -= node._calculatedWidth;
					freeNode.remove(node);
					finished = false;
					break;
				}

				node._calculatedWidth = avgWidth.floor();
				node._calculateRowWidthStage1();
				widthSum += avgWidth.floor();;
			}

			if(finished){
				restWidth -= widthSum;
				break;
			}else{
				avgWidth = freeWidth / freeNode.length;
			}
		}
	}
}