<hello style="color: red;">hello</hello>
<world style="color: blue;">world</world>
<moon style="color: green;">moon</moon>

<view-form>
    <h4>View Frame</h4>
    <!-- List Container -->
        <div each="{ item, i in items }" >
            <div class="dropzone" show={ editmode } refs={i}></div>
            <div draggable={ editmode } class="card-custom demo-card-wide mdl-card mdl-shadow--2dp" refs={i}>
            <!-- Left aligned menu below button -->
            <div show={ editmode }>
                <button onclick={ moveComponent.bind(this, i, i-1) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">keyboard_arrow_up</i></button>
                <button onclick={ moveComponent.bind(this, i, i+1) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">keyboard_arrow_down</i></button>
                <button onclick={ moveComponent.bind(this, i, -2) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">delete</i></button>
            </div>
            <div data-is="{ item.type }"></div>
            </div>
        </div>
        <div class="dropzone" show={ editmode } refs={ items.length }></div>
    <div>
        <button class="send-btn mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect">Send</button>
        <button onclick={ clearComponents } class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">Clear Form</button>
    </div>
    <style>  
        .dropzone {
            width: 400px;
            height: 20px;
            background:#cfcfcf;
            margin-bottom: 10px;
            padding: 10px;
        }
        .card-custom{
            padding: 10px;
            min-height: 50px;
            margin-bottom: 20px;
            min-width: 400px;
        }
        .send-btn {
            width: 200px;
            margin-right: 20px;
        }
    </style>
    <script>
        var self = this
        this.mixin(SharedMixin)

        this.items = [
                { 'type': 'hello'},
                { 'type': 'world' },
                { 'type': 'hello'},
                { 'type': 'moon'}
              ];
        /* 
         * Drag and Drop Setup
         */    

        this.dragId = ''    

         /* events fired on the draggable target */
         document.addEventListener("drag", function( event ) {
        }, false)

        document.addEventListener("dragstart", function( event ) {
            // store a ref. on the dragged elem
            console.log(event)
            if (event.srcElement.id === 'dragComponent'){
                self.items.push({'type': event.srcElement.attributes.refs.value})
                self.dragId = self.items.length -1
            }
            else {
                self.dragId = event.srcElement.attributes.refs.value    
            }
            // make it half transparent
            event.target.style.opacity = .5
        }, false)

        document.addEventListener("dragend", function( event ) {
            // reset the transparency
            event.target.style.opacity = ""
        }, false)

        /* events fired on the drop targets */
        document.addEventListener("dragover", function( event ) {
            // prevent default to allow drop
            event.preventDefault()
        }, false)

        document.addEventListener("dragenter", function( event ) {
            // highlight potential drop target when the draggable element enters it
            if ( event.target.className == "dropzone" ) {
                event.target.style.background = "red"
                event.target.style.height = "50px"
            }

        }, false)

        document.addEventListener("dragleave", function( event ) {
            // reset background of potential drop target when the draggable element leaves it
            if ( event.target.className == "dropzone" ) {
                event.target.style.background = ""
                event.target.style.height = "20px"
            }

        }, false)

        document.addEventListener("drop", function( event ) {
            // prevent default action (open as link for some elements)
            event.preventDefault()
            var drag_pos = parseInt(self.dragId)
            // move dragged elem to the selected drop target
            if ( event.target.className == "dropzone" ) {
                console.log(event)
                var drop_pos = parseInt(event.srcElement.attributes.refs.value)
                console.log(drag_pos, drop_pos)
                self.moveComponent(drag_pos,drop_pos)
                // clean up
                event.target.style.background = ""
                event.target.style.height = "20px"
            }
            else{
                //self.moveComponent(drag_pos,-2)
            }
            this.dragId = ''
            self.update() 
        }, false)

        /* 
         * Component Setup -> Clear, Move
         */

        clearComponents() {
            this.items = []
        }
        
        moveComponent(from, to) {
            var array = this.items
            
            // Delete item
            if(to === -2) {
                array.splice(from, 1)
                return array
            }
            // exit when no movement
            if( to === from ) return array
            // End blocking
            if (to < 0 || to >= array.length) return array

            // moveing Element
            var target = array[from]                         
            var increment = to < from ? -1 : 1

            for(var k = from; k != to; k += increment){
                array[k] = array[k + increment]
            }
            array[to] = target
            return array
        }

        // Observable Add Component
        this.observable.on('addcomp', function(value){
           self.items.push({'type': value})
           console.log(value)
           self.update()
        })

        // Editmode
        this.editmode = false
        this.observable.on('editmode', function(mode){
            self.editmode = mode
            self.update()
        })
    </script>
</view-form>