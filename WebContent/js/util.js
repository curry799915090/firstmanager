/**
 *
 * @param parentObj  父节点元素节点
 * @returns {Array}  所有子节点的数组集合
 */
function getChildNodes(parentObj){
    var childNodes=parentObj.childNodes;
    var childs=[];
    for(var i=0;i<childNodes.length;i++){
        if(childNodes[i].nodeType==1){
            childs.push(childNodes[i]);
        }
    }
    return childs;
}

/**
 *
 * @param parentObj 父节点元素节点
 * @returns {*}  第一个元素子节点
 */
function getFirstChild(parentObj){
    var first=parentObj.firstChild;
    if(first.nodeType==1){
        return first;
    }
    return first.nextSibling;
}

/**
 *
 * @param parentObj 父节点元素节点
 * @returns {*}  最后一个元素子节点
 */
function getLastChild(parentObj){
    var last=parentObj.lastChild;
    if(last.nodeType==1){
        return last;
    }
    return last.previousSibling;
}

/**
 *
 * @param obj  元素节点
 * @returns {*}  该元素节点的上一个元素兄弟节点
 */
function getPreviousSibling(obj){
    var preObj=obj.previousSibling;
    if(preObj.nodeType==3){
        return preObj.previousSibling;
    }
    return preObj;
}

/**
 *
 * @param obj  元素节点
 * @returns {*}  该元素节点的下一个元素兄弟节点
 */
function getNextSibling(obj){
    var nextObj=obj.nextSibling;
    if(nextObj.nodeType==1){
        return nextObj;
    }
    return nextObj.nextSibling;
}

/**
 *
 * @param idOrName  id或name   如果是id则 前面加#   如果是name则直接传
 * @returns {*}   如果传入id则返回唯一元素，如果是name则返回该name表示的数组。
 */
function $(idOrName){
    if(idOrName.indexOf("#")==0){
        return document.getElementById(idOrName.substring(1));
    }else{
        return document.getElementsByName(idOrName);
    }
}