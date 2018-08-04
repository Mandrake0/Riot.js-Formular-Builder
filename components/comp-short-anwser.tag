<comp-short-anwser>
    <h4>Component Short Anwser</h4>
    <div>
        <div show={ editmode } class="mdl-textfield mdl-js-textfield">
            <input onchange={ getQuestion } ref='question' class="mdl-textfield__input" type="text" id="question" value={ values.question }>
            <label class="mdl-textfield__label" for="question">Question</label>
        </div>
        <div hide={ editmode }>
            <h6>{ values.question }</h6>
        </div>
        <br>
        <div class="mdl-textfield mdl-js-textfield">
            <input ref='anwser' class="mdl-textfield__input" type="text" id="anwser" disabled={ editmode } >
            <label class="mdl-textfield__label" for="anwser">Anwser</label>
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
</comp-short-anwser>