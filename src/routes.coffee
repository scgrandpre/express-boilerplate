module.exports = (app) ->

    app.get '/' , (req, res) ->
         res.render 'index', 
 buttons: [
	{label: 'pass'', good_count: 0, bad_count: 0}
	{label: 'set', good_count: 0, bad_count: 0}
	{label: 'hits'', good_count: 0, bad_count: 0}
	{label: 'block'', good_count: 0, bad_count: 0}
	{label: 'defense'', good_count: 0, bad_count: 0}
	{label: 'serve'', good_count: 0, bad_count: 0}

 ]

    app.get '/action/:action' , (req, res) ->
        res.render 'index', {action: req.params.action}

    app.get '/hello', (req, res) -> 
        res.send 'Hello Node'

    app.get '/hello/:name', (req, res) -> 
        res.send "Hello #{req.params.name}"

    {set, get} = require './persist'
    app.get '/set/:key/:val', (req, res) ->
        set req.params.key, req.params.val
        res.send 'OKAY'

    app.get '/get/:key', (req, res) ->
        get req.params.key, (err, val) ->
            if err?
                res.send 500, err
            else
                res.send val
