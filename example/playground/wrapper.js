class lucid{
    static initializeRootNode(width, height){
        const id =  window.initializeRootNode(width, height);
        return new elementNode(id, null);
    }

    static initializeLayout(){
        window.initializeLayout();
    }

    static reflowAt(elementNode){
        window.reflowAt(elementNode.id);
    }
}

class elementNode{
    constructor(_id, _parentId){
        this.id = _id;
        this._parentId = parentId;
    }

    parentId = 0;
    id = 0;

    addChild(){
        const childId = window.addChild(this.id);
        return new elementNode(childId, this.id);
    }

    set display(disp){	
		setDisplay(this.id, disp);
	}

	set position(ps){
		setPosition(this.id, ps);
	}

	set width(w){
		setWidth(this.id, w);
	}

	set minWidth(mw){
		setMinWidth(this.id, mw);
	}

	set maxWidth(mw){
		setMaxWidth(this.id, mw);
	}

	set height(h){
		setHeight(this.id, h);
	}

	set minHeight(mh){
		setMinHeight(this.id, mh);
	}

	set maxHeight(mh){
		setMaxHeight(this.id, mh);
	}

	set line_height(lh){
		setLine_height(this.id, lh);
	}

	set border_top(bt){
		setBorder_top(this.id, bt);
	}

	set border_right(br){
		setBorder_right(this.id, br);
	}

	set border_bottom(bb){
		setBorder_bottom(this.id, bb);
	}

	set border_left(bl){
		setBorder_left(this.id, bl);
	}


	set margin_top(mt){
		setMargin_top(this.id, mt);
	}

	set margin_right(mr){
		setMargin_right(this.id, mr);
	}

	set margin_bottom(mb){
		setMargin_bottom(this.id, mb);
	}

	set margin_left(ml){
		setMargin_left(this.id, ml);
	}


	set padding_top(pt){
		setPadding_top(this.id, pt);
	}

	set padding_right(pr){
		setPadding_right(this.id, pr);
	}

	set padding_bottom(pb){
		setPadding_bottom(this.id, pb);
	}

	set padding_left(pl){
		setPadding_left(this.id, pl);
	}

	set left(l){
		setLeft(this.id, l);
	}

	set top(t){
		setTop(this.id, t);
	}

	set right(r){

		setRi(this.id, r);
	}

	set bottom(b){
		setBottom(this.id, b);
	}


	set wrap(wp){
		setWrap(this.id, wp);
	}

	set fit_content(fc){
		setFit_content(this.id, fc);
	}

	set overflow(ov){
		setOverflow(this.id, ov);
	}

	set alignTracks(at){
		setAlignTracks(this.id, at);
	}

	set alignItems(ai){
		setAlignItems(this.id, ai);
	}

	set alignSelf(asl){
		setAlignSelf(this.id, asl);
	}

    get calculatedBoundingRect(){
        return getCalculatedBoundingRect(this.id);
    }
}