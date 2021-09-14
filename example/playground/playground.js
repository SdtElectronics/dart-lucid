const currentNodeIdBox = document.getElementById("curNodeId");

const eDisplay = document.getElementById("eDisplay");
const eOverflow = document.getElementById("eOverflow");
const bFit = document.getElementById("bFit");
const bWrap = document.getElementById("bWrap");
const nHeight = document.getElementById("nHeight");
const nWidth = document.getElementById("nWidth");
const nMheight = document.getElementById("nMheight");
const nMwidth = document.getElementById("nMwidth");
const nmHeight = document.getElementById("nmHeight");
const nmWidth = document.getElementById("nmWidth");
const nMtop = document.getElementById("nMtop");
const nMright = document.getElementById("nMright");
const nMbottom = document.getElementById("nMbottom");
const nMleft = document.getElementById("nMleft");
const nBtop = document.getElementById("nBtop");
const nBright = document.getElementById("nBright");
const nBbottom = document.getElementById("nBbottom");
const nBleft = document.getElementById("nBleft");
const nPtop = document.getElementById("nPtop");
const nPright = document.getElementById("nPright");
const nPbottom = document.getElementById("nPbottom");
const nPleft = document.getElementById("nPleft");
const ePosition = document.getElementById("ePosition");
const nOtop = document.getElementById("nOtop");
const nOright = document.getElementById("nOright");
const nObottom = document.getElementById("nObottom");
const nOleft = document.getElementById("nOleft");
const eAtracks = document.getElementById("eAtracks");
const eAitems = document.getElementById("eAitems");
const eAself = document.getElementById("eAself");

const rootDOMnode = document.getElementById("rootNode");
let currentNode = rootDOMnode;

const parseNullableInt = str =>{
    const ret = parseInt(str);
    if(isNaN(ret)){
        return null;
    }
    return ret;
}

const reFlow = () => {
    [...document.getElementsByClassName("LTeNode")].forEach(n => {
        const rect = n.LTeNode.calculatedBoundingRect;
        n.style.left = `${rect.startX}px`;
        n.style.top = `${rect.startY}px`;
        n.style.width = `${rect.endX - rect.startX}px`;
        n.style.height = `${rect.endY - rect.startY}px`;
    });
}

const selectNode = DOMnode => {
    currentNode.classList.remove("activeNode");
    DOMnode.classList.add("activeNode");
    currentNode = DOMnode;
    const curLTeNode = DOMnode.LTeNode;
    currentNodeIdBox.value = curLTeNode.id;
    
    eDisplay.selectedIndex  = curLTeNode.display;
    eOverflow.selectedIndex  = curLTeNode.overflow;
    bFit.checked = curLTeNode.fit_content;
    bWrap.checked = curLTeNode.wrap;
    nHeight.value = curLTeNode.height;
    nWidth.value = curLTeNode.width;
    nMheight.value = curLTeNode.maxHeight;
    nMwidth.value = curLTeNode.maxWidth;
    nmHeight.value = curLTeNode.minHeight;
    nmWidth.value = curLTeNode.minWidth;
    nMtop.value = curLTeNode.margin_top;
    nMright.value = curLTeNode.margin_right;
    nMbottom.value = curLTeNode.margin_bottom;
    nMleft.value = curLTeNode.margin_left;
    nBtop.value = curLTeNode.border_top;
    nBright.value = curLTeNode.border_right;
    nBbottom.value = curLTeNode.border_bottom;
    nBleft.value = curLTeNode.border_left;
    nPtop.value = curLTeNode.padding_top;
    nPright.value = curLTeNode.padding_right;
    nPbottom.value = curLTeNode.padding_bottom;
    nPleft.value = curLTeNode.padding_left;
    ePosition.selectedIndex  = curLTeNode.position;
    nOtop.value = curLTeNode.top;
    nOright.value = curLTeNode.right;
    nObottom.value = curLTeNode.bottom;
    nOleft.value = curLTeNode.left;
    eAtracks.selectedIndex  = curLTeNode.alignTracks;
    eAitems.selectedIndex  = curLTeNode.alignItems;
    eAself.selectedIndex  = curLTeNode.alignSelf;
}

currentNodeIdBox.onchange = e => {
    const selectedNode = [...document.getElementsByClassName("LTeNode")].find(n => 
        n.LTeNode.id == parseInt(e.target.value));
    if(selectedNode == undefined){

            e.target.value = currentNode.LTeNode.id;
        return;
    }

    selectNode(selectedNode);
}

document.getElementById("addChild").onclick = () => {
    const child = currentNode.LTeNode.addChild();
    const childDOMnode = document.createElement("div");
    child.width = 100;
    child.height = 100;
    childDOMnode.LTeNode = child;
    childDOMnode.setAttribute("nid", `${child.id}`);
    childDOMnode.classList.add("LTeNode");
    childDOMnode.classList.add("activeNode");
    childDOMnode.onclick = e => {
        selectNode(e.target);
    };
    currentNode.appendChild(childDOMnode);
    lucid.reflowAt(child);
    reFlow();
    selectNode(childDOMnode);
}

document.getElementById("remove").onclick = () => {
    if(currentNode.LTeNode.id == 0){

        return;
    }

    currentNode.LTeNode.remove();
    const parent = currentNode.parentNode;
    parent.removeChild(currentNode);
    lucid.reflowAt(parent.LTeNode);
    reFlow();
    selectNode(parent);
}

eDisplay.onchange = e => {    
    currentNode.LTeNode.display = eDisplay.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

eOverflow.onchange = e => {    
    currentNode.LTeNode.overflow = eOverflow.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

bFit.onchange = e => {    
    currentNode.LTeNode.fit_content = bFit.checked;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

bWrap.onchange = e => {    
    currentNode.LTeNode.wrap = bWrap.checked;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nHeight.onchange = e => {    
    currentNode.LTeNode.height = parseNullableInt(nHeight.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nWidth.onchange = e => {    
    currentNode.LTeNode.width = parseNullableInt(nWidth.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMheight.onchange = e => {    
    currentNode.LTeNode.maxHeight = parseInt(nMheight.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMwidth.onchange = e => {    
    currentNode.LTeNode.maxWidth = parseInt(nMwidth.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nmHeight.onchange = e => {    
    currentNode.LTeNode.minHeight = parseInt(nmHeight.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nmWidth.onchange = e => {    
    currentNode.LTeNode.minWidth = parseInt(nmWidth.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMtop.onchange = e => {    
    currentNode.LTeNode.margin_top = parseInt(nMtop.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMright.onchange = e => {    
    currentNode.LTeNode.margin_right = parseInt(nMright.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMbottom.onchange = e => {    
    currentNode.LTeNode.margin_bottom = parseInt(nMbottom.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nMleft.onchange = e => {    
    currentNode.LTeNode.margin_left = parseInt(nMleft.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nBtop.onchange = e => {    
    currentNode.LTeNode.border_top = parseInt(nBtop.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nBright.onchange = e => {    
    currentNode.LTeNode.border_right = parseInt(nBright.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nBbottom.onchange = e => {    
    currentNode.LTeNode.border_bottom = parseInt(nBbottom.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nBleft.onchange = e => {    
    currentNode.LTeNode.border_left = parseInt(nBleft.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nPtop.onchange = e => {    
    currentNode.LTeNode.padding_top = parseInt(nPtop.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nPright.onchange = e => {    
    currentNode.LTeNode.padding_right = parseInt(nPright.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nPbottom.onchange = e => {    
    currentNode.LTeNode.padding_bottom = parseInt(nPbottom.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nPleft.onchange = e => {    
    currentNode.LTeNode.padding_left = parseInt(nPleft.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

ePosition.onchange = e => {    
    currentNode.LTeNode.position = ePosition.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nOtop.onchange = e => {    
    currentNode.LTeNode.top = parseNullableInt(nOtop.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nOright.onchange = e => {    
    currentNode.LTeNode.right = parseNullableInt(nOright.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nObottom.onchange = e => {    
    currentNode.LTeNode.bottom = parseNullableInt(nObottom.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

nOleft.onchange = e => {    
    currentNode.LTeNode.left = parseNullableInt(nOleft.value);
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

eAtracks.onchange = e => {    
    currentNode.LTeNode.alignTracks = eAtracks.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

eAitems.onchange = e => {    
    currentNode.LTeNode.alignItems = eAitems.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

eAself.onchange = e => {    
    currentNode.LTeNode.alignSelf = eAself.selectedIndex;
    lucid.reflowAt(currentNode.LTeNode);
    reFlow();
}

const rootNode = lucid.initializeRootNode(500, 500);
rootDOMnode.LTeNode = rootNode;
rootDOMnode.setAttribute("nid", `0`);

rootDOMnode.onclick = e => {
    selectNode(e.target);
};

lucid.initializeLayout();
selectNode(rootDOMnode);