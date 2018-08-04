// Mixin Setup with the values
var SharedMixin = {
    observable: riot.observable(),
    getQuestion(){
        this.values.question = this.refs.question.value
    }
}

riot.mount("*")