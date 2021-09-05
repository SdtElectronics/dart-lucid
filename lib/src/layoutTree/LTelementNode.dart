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

	set overflow(Overflow ov){
		if(_display == Display.inline){

		}
		stageToUpdate = 0;
		_overflow = ov;
	}

	// All elements can be designated with a width or max-width
	// While inline elements cannot be designated with a height
	set width(int w){
		stageToUpdate = 0;
		_width = w;
	}

	set minWidth(int mw){
		stageToUpdate = 0;
		_minWidth = mw;
	}

	set maxWidth(int mw){
		stageToUpdate = 0;
		_maxWidth = mw;
	}

	set height(int h){
		if(_display == Display.inline){

		}
		stageToUpdate = 2;
		_height = h;
	}

	set minHeight(int mh){
		if(_display == Display.inline){
			
		}
		stageToUpdate = 2;
		_minHeight = mh;
	}

	set maxHeight(int mh){
		if(_display == Display.inline){
			
		}
		stageToUpdate = 2;
		_maxHeight = mh;
	}

	set line_height(int lh){
		if(_display != Display.inline){
			
		}
		stageToUpdate = 2;
		_line_height = lh;
	}

	set border_top(int bt){
		stageToUpdate = 2;
		_border_top = bt;
	}

	set border_right(int br){
		stageToUpdate = 0;
		_border_right = br;
	}

	set border_bottom(int bb){
		stageToUpdate = 2;
		_border_bottom = bb;
	}

	set border_left(int bl){
		stageToUpdate = 0;
		_border_left = bl;
	}


	set margin_top(int mt){
		stageToUpdate = 2;
		_margin_top = mt;
	}

	set margin_right(int mr){
		stageToUpdate = 0;
		_margin_right = mr;
	}

	set margin_bottom(int mb){
		stageToUpdate = 2;
		_margin_bottom = mb;
	}

	set margin_left(int ml){
		stageToUpdate = 0;
		_margin_left = ml;
	}


	set padding_top(int pt){
		stageToUpdate = 2;
		_padding_top = pt;
	}

	set padding_right(int pr){
		stageToUpdate = 0;
		_padding_right = pr;
	}

	set padding_bottom(int pb){
		stageToUpdate = 2;
		_padding_bottom = pb;
	}

	set padding_left(int pl){
		stageToUpdate = 0;
		_padding_left = pl;
	}


	set wrap(bool wp){
		stageToUpdate = 0;
		_wrap = wp;
	}

	set fit_content(bool fc){
		stageToUpdate = 0;
		_fit_content = fc;
	}

	set alignTracks(Alignment at){
		stageToUpdate = 3;
		_alignTracks = at;
	}

	set alignItems(Alignment ai){
		stageToUpdate = 3;
		_alignItems = ai;
	}

	set alignSelf(Alignment asl){
		stageToUpdate = 3;
		_alignSelf = asl;
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
	int? _line_height;


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

	int _left = 0;
	int _top = 0;
	int? _right;
	int? _bottom;

	bool _wrap = true;

	bool _fit_content = true;

	Overflow _overflow = Overflow.hidden;

	Alignment _alignTracks = Alignment.start;
	Alignment _alignItems = Alignment.start;
	Alignment _alignSelf = Alignment.start;

	bool _fillRowWidth = true;

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

	int _calculateRowWidth(){
		int ret = 0;
		
		for(final node in _children){
			// Not relatively positioned elements take no space
			// So exclude them from width calculation
			if(node._position != Position.relative){	
				continue;
			}

			int currentWidth = node._calculatedWidth 
							+ node._margin_left 
							+ node._margin_right;

			int noWrapWidth = 0;
			if(_wrap){
				ret = max(ret, currentWidth);
			}else{
				if(node._display == Display.block){
					ret = max(ret, noWrapWidth);
					ret = max(ret, currentWidth);
					noWrapWidth = 0;
				}else{
					noWrapWidth += currentWidth;
				}
			}
		}

		if(_width != null){
			int filledRowWidth = _width! - _padding_left - _padding_right
										- _border_left - _border_right;
			ret = max(ret, filledRowWidth);
		}

		return ret;
	}

	int _calculateWidthStage0(){
		if(_width != null){
			_fillRowWidth = false;
			return _width!;
		}

		if(_display == Display.inline){
			// do not reserve space for inline element can be wrapped
			if(_wrap){
				return 0;
			}
			return _content_width;
		}

		int ret = _rowWidth + _padding_left + _padding_right
							+ _border_left + _border_right;


		_fillRowWidth = !_fit_content;


		return ret.clamp(_minWidth, _maxWidth);
	}

	void _arrangeChildrenInRows(){
		LTblockElementRow currentRow = LTblockElementRow(_rowWidth);
		_rows.add(currentRow);

		for(final node in _children){
			// Not relatively positioned elements are not contained in rows
			if(node._position != Position.relative){	
				continue;
			}

			switch(node._display){
			  case Display.block:
				// block elements occupy a row
				if(currentRow.children.isNotEmpty){
					currentRow = LTblockElementRow(_rowWidth);
				}

				int netRestWidth = _rowWidth - node._margin_left 
											 - node._margin_right;

				// It is guaranteed that _rowWidth can fit in at least an 
				// arbitrary node in Stage0
				if(node._fillRowWidth){
					node._calculatedWidth = min(netRestWidth, node._maxWidth);
				}

				currentRow.restWidth = netRestWidth - node._calculatedWidth;

				currentRow.children.add(node);
				_rows.add(currentRow);

				currentRow = LTblockElementRow(_rowWidth);
				_rows.add(currentRow);

				break;
				
			  case Display.inline_block:
				int rowRestWidth = currentRow.restWidth;
				if(node._fillRowWidth){
					int childWidth = node._calculateWidthStage1(rowRestWidth);

					// if width rest in row is not enough, create a new row
					if(childWidth > rowRestWidth){
						currentRow = LTblockElementRow(_rowWidth);
						currentRow.children.add(node);
						_rows.add(currentRow);

						int netRestWidth = _rowWidth - node._margin_left 
													 - node._margin_right;
						// grow child width to _maxWidth, if row can contain
						if(netRestWidth > node._maxWidth){
							node._calculatedWidth = node._maxWidth;
							currentRow.restWidth = netRestWidth - node._maxWidth;
						}else{
							// otherwise fill all rest width in row, create a new row
							node._calculatedWidth = netRestWidth;
							currentRow.restWidth = 0;
							currentRow = LTblockElementRow(_rowWidth);
							_rows.add(currentRow);
						}
					}else{
						// if width rest in row is enough, add it to currentRow
						// no need to check _maxWidth of this child,
						//it is already checked in _calculateWidthStage1 call
						currentRow.children.add(node);
						currentRow.restWidth -= childWidth;
					}
				}else{
					int netRestWidth = rowRestWidth - node._margin_left 
													- node._margin_right;
						// if width rest in row is not enough, create a new row
					if(netRestWidth < node._calculatedWidth){
						rowRestWidth = _rowWidth - node._calculatedWidth
												 - node._margin_left
												 - node._margin_right;
						currentRow = LTblockElementRow(rowRestWidth);
						currentRow.children.add(node);
						_rows.add(currentRow);
					}else{
						currentRow.restWidth = netRestWidth - node._calculatedWidth;
						currentRow.children.add(node);
					}
				}

				break;
				
			  case Display.inline:
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

	// call by parent during arrangement in Stage1 if element should fill rest space in row
	// return occupied width (_calculatedWidth + margin)
	int _calculateWidthStage1(int widthToFill){
		int ret = _calculatedWidth + _margin_left + _margin_right;
		// if width rest in row is not enough, return occupied width
		if(widthToFill < ret){
			return ret;
		}

		_calculatedWidth = min(widthToFill - _margin_left - _margin_right, _maxWidth);
		_rowWidth = _calculatedWidth - _padding_left - _padding_right
				  - _border_left - _border_right;
		
		return _calculatedWidth + _margin_left + _margin_right;
	}

	// calculate height for
	int _calculateHeightStage2(){
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


	void _calculateHeightStage3(){
		for(final node in _children){
			if(node._position == Position.relative){
				continue;
			}

			if(node._bottom != null){
				
			}
		}
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
										_border_bottom);
			switch(_alignTracks){
			  case Alignment.end:
				currentY += (remainedHeight - _calculatedRowHeightSum);
				break;
			  
			  case Alignment.center:
				currentY += (remainedHeight / 2).round();
			  	break;
			
			  case Alignment.space_between:
				spacingHeight = (remainedHeight / (_rows.length - 1)).round();
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
				spacingWidth = (row.restWidth / (row.children.length - 1)).round();
			  	break;
			}

			for(final node in row.children){
				final rect = node._calculatedRelativeBoundingRect;
				rect.startY = _top;
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

				rect.startX = currentX + _left + node._margin_left;
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
			if(node._position == Position.fixed){
				absoluteRect.startX = _left;
				absoluteRect.startY = _top;
				absoluteRect.endX = _left + _calculatedWidth;
				absoluteRect.endY = _top + _calculatedHeight;
			}else{
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
		_rowWidth = _calculateRowWidth();
		int tempWidth = _calculateWidthStage0();
		if(tempWidth != _calculatedWidth){
			_calculatedWidth = tempWidth;
			return true;
		}
		return false;
	}

	void stage1Update(){
		_arrangeChildrenInRows();
	}

	bool stage2Update(){
		int tempHeight = _calculateHeightStage2();
		if(tempHeight != _calculatedHeight){
			_calculatedHeight = tempHeight;
			return true;
		}
		return false;
	}

	void stage3Update(){
		_calculateHeightStage3();
		_calculateRelativePosition();
		_calculateAbsolutePosition();
	}

	int addChild(LTelementNode node){
		if(node._position == Position.relative){
			_children.add(node);
		}
		
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
			if(node._position == Position.relative){
				for(final row in _rows){
					row.children.remove(node);
				}
			}
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

	///top-down traverse all nodes and invoke [callback] with current node as parameter
	List<LTelementNode> traverseDown(void callBack(LTelementNode? node)){
		callBack(this);
		List<LTelementNode> children = _children;
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
	LTblockElementRow(int rowWidth): restWidth = rowWidth;

	int height = 0;
	int restWidth = 0;

	final children = <LTelementNode>[];

	int calcHeight(){
		int ret = 0;
		for(final node in children){
			// Not relatively positioned elements are not placed into rows
			// So no need to exclude them here
			int currentHeight = node._calculatedHeight;
			currentHeight += node._margin_top;
			currentHeight += node._margin_bottom;
			ret = max(currentHeight, ret);
		}
		return height = ret;
	}
}