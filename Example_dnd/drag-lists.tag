<drag-lists>
    <div class='list' each={ list, i in this.lists } ondrop={parent.on_drop}
        ondragover={parent.on_drag_over}>
        <p>{ list.name }</p>
        <div class="page" draggable="true" each={ page in list.pages}
            ondragend={parent.drag_end}
            ondragstart={parent.drag_start}>
            {page.name}
        </div>
    </div>

    this.lists= {lists:[{name:'list1', pages:[{name:'page1'}, {name:'page2'},{name:'page3'}]}]};
    console.log(this.lists)
    this.pageId=null;
    console.log("init")
    
    this.on('mount', function() {
    this.placeholder=document.createElement("div");
    this.placeholder.className = "placeholder";
    })
    
    on_drop(event){ 
        var pos = 0;
    var children=this.placeholder.parentNode.children;
        for(var i=0;i<children.length;i++){
        if(children[i]==this.placeholder) break;	
        if(children[i]!=this.dragged && children[i].classList.contains("page"))
            pos++;
    }
        this.movePage(this.lists,event.item.list.name,this.pageId,pos);
    this.update();
    }
    
    on_drag_over(e){
    // return true; para no aceptar
        if(this.dragged.style.display != "none"){
        this.dragged.style.display = "none";
        this.dragged.parentNode.insertBefore(this.placeholder, this.dragged);
    }
    
    if(e.target.className != "page" && e.target.className!="list")
        return;
        
    /// PAGE ///
    if(e.target.className=="page"){
        this.over = e.target;
        // Inside the dragOver method
        var relY = e.clientY - this.over.offsetTop;
        var height = this.over.offsetHeight / 2;
        var parent = e.target.parentNode;

        if(relY > height) {
        this.nodePlacement = "after";
        parent.insertBefore(this.placeholder, e.target.nextElementSibling);
        }
        else if(relY < height) {
        this.nodePlacement = "before"
        parent.insertBefore(this.placeholder, e.target);
        }
    }
    
    /// LIST ///
    if(e.target.className=="list"){
        var pages=e.target.getElementsByClassName("page");
        if(pages.length==0 || pages.length==1 && pages[0]==this.dragged){
            e.target.appendChild(this.placeholder);
        }
    }
    }
    
    drag_end(event){ 
        event.preventUpdate=true;
    this.dragged.style.display = "block";
    this.dragged.classList.remove("rotated");
    if(this.placeholder.parentNode){
        this.placeholder.parentNode.removeChild(this.placeholder);
    }
    }
    
    drag_start(event){
        this.dragged=event.target;
        event.dataTransfer.setData('text', 'foo');
        event.target.classList.add("rotated");
        this.pageId=event.item.page.name;
        return true;
    }
    
    removePage(lists,idPage){
            for(var i=0;i<lists.length;i++){
            var list=lists[i];
                for(var j=0;list.pages && j<list.pages.length;j++){
                var page=list.pages[j];
            if(page.name==idPage){
                list.pages.splice(j,1);
                    return page;
            }
            }       
        }   
    }
    
    movePage(lists,idList,idPage,pos){
            var pageObj=this.removePage(lists,idPage);
        if(pageObj){
            for(var i=0;i<lists.length;i++){
                var list=lists[i];
            if(list.name==idList){
                if(!list.pages)
                list.pages=[];
            list.pages.splice(pos, 0, pageObj);
            break;
            }
        }
        }
    }

</drag-lists>