/**
 *
 * @param parentObj  ���ڵ�Ԫ�ؽڵ�
 * @returns {Array}  �����ӽڵ�����鼯��
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
 * @param parentObj ���ڵ�Ԫ�ؽڵ�
 * @returns {*}  ��һ��Ԫ���ӽڵ�
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
 * @param parentObj ���ڵ�Ԫ�ؽڵ�
 * @returns {*}  ���һ��Ԫ���ӽڵ�
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
 * @param obj  Ԫ�ؽڵ�
 * @returns {*}  ��Ԫ�ؽڵ����һ��Ԫ���ֵܽڵ�
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
 * @param obj  Ԫ�ؽڵ�
 * @returns {*}  ��Ԫ�ؽڵ����һ��Ԫ���ֵܽڵ�
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
 * @param idOrName  id��name   �����id�� ǰ���#   �����name��ֱ�Ӵ�
 * @returns {*}   �������id�򷵻�ΨһԪ�أ������name�򷵻ظ�name��ʾ�����顣
 */
function $(idOrName){
    if(idOrName.indexOf("#")==0){
        return document.getElementById(idOrName.substring(1));
    }else{
        return document.getElementsByName(idOrName);
    }
}