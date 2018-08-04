<comp-date>
        <div>
            <div show={ editmode } class="mdl-textfield mdl-js-textfield">
                <input onchange={ getQuestion } ref='question' class="mdl-textfield__input" type="text" id="question" value={ values.question }>
                <label class="mdl-textfield__label" for="question">Question</label>
            </div>
            <div hide={ editmode }>
                <h6>{ values.question }</h6>
            </div>
            <br>
            <div>
                <div class="element-width mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" pattern="(?=.*[0-9]).{0,2}" type="text" id="day" disabled={ editmode }>
                    <label class="mdl-textfield__label" for="day">Day</label>
                </div>
                <div class="element-width mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" pattern="(?=.*[0-9]).{0,2}" type="text" id="month" disabled={ editmode }>
                    <label class="mdl-textfield__label" for="month">Month</label>
                </div>  
                <div class="element-width mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" pattern="*[0-9]" type="text" id="year" disabled={ editmode }>
                        <label class="mdl-textfield__label" for="year">Year</label>
                    </div>
            </div>
        </div>
        <style>
            .element-width{
                width: 100px;
                margin-right: 10px;
                margin-top: 10px;
            }
        </style>
        <script>
            // Mixin Setup
            var self = this
            this.mixin(SharedMixin)
            
            // Interface  Variable 
            this.id = opts.id
            
            // values
            this.values =  {question:"", answer:""}
    
            // Editmode
            this.editmode = false
            this.observable.on('editmode', function(mode){
                self.editmode = mode
                self.update()
            })
        </script>
</comp-date>