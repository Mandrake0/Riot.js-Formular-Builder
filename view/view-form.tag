<hello style="color: red;">hello</hello>
<world style="color: blue;">world</world>
<moon style="color: green;">moon</moon>

<view-form>
    <h4>View Frame</h4>
    <!-- List Container -->
            <div each="{ item, i in items }" >
                <div class="card-custom demo-card-wide mdl-card mdl-shadow--2dp">
                <!-- Left aligned menu below button -->
                <div show={ editmode }>
                    <button onclick={ moveComponent.bind(this, i, i-1) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">keyboard_arrow_up</i></button>
                    <button onclick={ moveComponent.bind(this, i, i+1) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">keyboard_arrow_down</i></button>
                    <button onclick={ moveComponent.bind(this, i, -2) } class="mdl-button mdl-js-button mdl-button--icon"><i class="material-icons">delete</i></button>
                </div>
                <div data-is="{ item.type }"></div>
                </div>
            </div>
    <div>
        <button class="send-btn mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect">Send</button>
        <button onclick={ clearComponents } class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">Clear Form</button>
    </div>
    <style>  
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

        clearComponents(){
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
            if( to === from ) return array;
            // End blocking
            if (to < 0 || to >= array.length) return array;

            // moveing Element
            var target = array[from];                         
            var increment = to < from ? -1 : 1;

            for(var k = from; k != to; k += increment){
                array[k] = array[k + increment];
            }
            array[to] = target;
            return array;
        }

        // Observable Add Component
        this.observable.on('addcomp', function(value){
           self.items.push({'type': value})

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