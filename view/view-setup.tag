<view-setup>
    <h4>Setup</h4>
    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
        <input type="checkbox" id="switch-1" class="mdl-switch__input" onclick={ setEditMode }>
        <span class="mdl-switch__label">Set Edit Mode</span>
    </label>

    <script>
    // Mixin Setup
    var self = this
    this.mixin(SharedMixin)

    setEditMode(e){
        this.observable.trigger('editmode', e.target.checked)
    }
    
    // observable update
    this.editmode = false
    this.observable.on('editmode', function(mode){
        self.editmode = mode
        self.update()
    })

    </script>
</view-setup>