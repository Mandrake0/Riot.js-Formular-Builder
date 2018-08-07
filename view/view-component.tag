<view-component>
    <h4>View Component</h4>
    <div each="{ item, index in componentList }">
        <div id="dragComponent" refs={ item.component } draggable={editmode} >
        <button onclick={ addComponent } class="comp-button mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect">
            <i class="material-icons">{ item.icon }</i>
            { item.name }
        </button>
        </div>
    </div>
    <style>
        /* For a better Layout */
        .comp-button {
            margin: 2px;
            margin-left: 10px;
            height: 100px;
            width: 100px;
        }
    </style>
    <script>
        var self = this
        this.mixin(SharedMixin)

        this.componentList = [  {name:"Button1", icon:"android", component:"hello"},
                                {name:"Button2", icon:"add", component:"world"},
                                {name:"Button3", icon:"add_box", component:"moon"},
                                {name:"Button4", icon:"flag", component:"comp-date"},
                                {name:"Button5", icon:"create", component:"bla5"}
                             ]
        addComponent(e){
            this.observable.trigger('addcomp', e.item.item.component)
        }

        // Editmode
        this.editmode = false
        this.observable.on('editmode', function(mode){
            self.editmode = mode
            self.update()
        })
            
    </script>
</view-component>