<comp-time>
    <h4>Component Time Tag</h4>
    <div>
        <div show={ editmode } class="mdl-textfield mdl-js-textfield">
            <input onchange={ getQuestion } ref='question' class="mdl-textfield__input" type="text" id="question" value={ values.question }>
            <label class="mdl-textfield__label" for="question">Question</label>
        </div>
        <div hide={ editmode }>
            <h6>{ values.question }</h6>
        </div>
        <br>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="day">
                <label class="mdl-textfield__label" for="day">Day</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="month">
                <label class="mdl-textfield__label" for="month">Month</label>
            </div>  
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="year">
                <label class="mdl-textfield__label" for="year">Year</label>
            </div>
    </div>
    <script>
        // Mixin Setup
        var self = this
        this.mixin(SharedMixin)
        
        // values
        this.values =  {question:"", answer:""}

        // Editmode
        this.editmode = false
        this.observable.on('editmode', function(mode){
            self.editmode = mode
            console.log(self)
            self.update()
        })
    </script>
</comp-time>