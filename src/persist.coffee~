url = require 'url'

redis_url = url.parse process.env.REDISTOGO_URL ? 'redis://localhost:6300'
redis = (require 'redis').createClient redis_url.port, redis_url.hostname

if redis_url.auth 
    [redis_db, redis_password] = redis_url.auth.split ':'
    redis.auth redis_password

set = (key, value, callback) ->
    redis.set key, value, callback

get = (key, callback) ->
    redis.get key, (err, res) ->
        if err?
            callback err
        else
            callback null, res

module.exports = { set, get, redis }