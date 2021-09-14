class lucid{
    static initializeRootNode(width, height){
        const id =  window.initializeRootNode(width, height);
        return new elementNode(id, null);
    }

    static initializeLayout(){
        window.initializeLayout();
    }

    static reflowAt(node){
        window.reflowAt(node.id);
    }
}

class elementNode{
    constructor(_id, _parentId){
        this.id = _id;
        this.parentId = _parentId;
    }

    parentId = 0;
    id = 0;

    addChild(){
        const childId = window.addChild(this.id);
        return new elementNode(childId, this.id);
    }

    remove(){
        return removeChild(this.id);
    }

    set display(disp){	
		setDisplay(this.id, disp);
	}

    get display(){	
		return getDisplay(this.id);
	}

	set position(ps){
		setPosition(this.id, ps);
	}

    get position(){
		return getPosition(this.id);
	}

	set width(w){
		setWidth(this.id, w);
	}

    get width(){
		return getWidth(this.id);
	}

	set minWidth(mw){
		setMinWidth(this.id, mw);
	}

    get minWidth(){
		return getMinWidth(this.id);
	}

	set maxWidth(mw){
		setMaxWidth(this.id, mw);
	}

    get maxWidth(){
		return getMaxWidth(this.id);
	}

	set height(h){
		setHeight(this.id, h);
	}

    get height(){
		return getHeight(this.id);
	}

	set minHeight(mh){
		setMinHeight(this.id, mh);
	}

    get minHeight(){
		return getMinHeight(this.id);
	}

	set maxHeight(mh){
		setMaxHeight(this.id, mh);
	}

    get maxHeight(){
		return getMaxHeight(this.id);
	}

	set line_height(lh){
		setLine_height(this.id, lh);
	}

    get line_height(){
		return getLine_height(this.id);
	}

	set border_top(bt){
		setBorder_top(this.id, bt);
	}

    get border_top(){
		return getBorder_top(this.id);
	}

	set border_right(br){
		setBorder_right(this.id, br);
	}

    get border_right(){
		return getBorder_right(this.id);
	}

	set border_bottom(bb){
		setBorder_bottom(this.id, bb);
	}

    get border_bottom(){
		return getBorder_bottom(this.id);
	}

	set border_left(bl){
		setBorder_left(this.id, bl);
	}

    get border_left(){
		return getBorder_left(this.id);
	}


	set margin_top(mt){
		setMargin_top(this.id, mt);
	}

    get margin_top(){
		return getMargin_top(this.id);
	}

	set margin_right(mr){
		setMargin_right(this.id, mr);
	}

    get margin_right(){
		return getMargin_right(this.id);
	}

	set margin_bottom(mb){
		setMargin_bottom(this.id, mb);
	}

    get margin_bottom(){
		return getMargin_bottom(this.id);
	}

	set margin_left(ml){
		setMargin_left(this.id, ml);
	}

    get margin_left(){
		return getMargin_left(this.id);
	}


	set padding_top(pt){
		setPadding_top(this.id, pt);
	}

    get padding_top(){
		return getPadding_top(this.id);
	}

	set padding_right(pr){
		setPadding_right(this.id, pr);
	}

    get padding_right(){
		return getPadding_right(this.id);
	}

	set padding_bottom(pb){
		setPadding_bottom(this.id, pb);
	}

    get padding_bottom(){
		return getPadding_bottom(this.id);
	}

	set padding_left(pl){
		setPadding_left(this.id, pl);
	}

    get padding_left(){
		return getPadding_left(this.id);
	}

	set left(l){
		setLeft(this.id, l);
	}

    get left(){
		return getLeft(this.id);
	}

	set top(t){
		setTop(this.id, t);
	}

    get top(){
		return getTop(this.id);
	}

	set right(r){
		setRight(this.id, r);
	}

    get right(){
		return getRight(this.id);
	}

	set bottom(b){
		setBottom(this.id, b);
	}

    get bottom(){
		return getBottom(this.id);
	}


	set wrap(wp){
		setWrap(this.id, wp);
	}

    get wrap(){
		return getWrap(this.id);
	}

	set fit_content(fc){
		setFit_content(this.id, fc);
	}

    get fit_content(){
		return getFit_content(this.id);
	}

	set overflow(ov){
		setOverflow(this.id, ov);
	}

    get overflow(){
		return getOverflow(this.id);
	}

	set alignTracks(at){
		setAlignTracks(this.id, at);
	}

    get alignTracks(){
		return getAlignTracks(this.id);
	}

	set alignItems(ai){
		setAlignItems(this.id, ai);
	}

    get alignItems(){
		return getAlignItems(this.id);
	}

	set alignSelf(asl){
		setAlignSelf(this.id, asl);
	}

    get alignSelf(){
		return getAlignSelf(this.id);
	}

    get calculatedWidth(){
        return getCalculatedWidth(this.id);
    }

    get calculatedHeight(){
        return getCalculatedHeight(this.id);
    }

    get calculatedBoundingRect(){
        return getCalculatedBoundingRect(this.id);
    }
}