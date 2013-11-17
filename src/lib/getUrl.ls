require! querystring.stringify

module.exports = (fn, key, args) ->
  "http://www.theyworkforyou.com/api/#fn?#{stringify {key: key, output: 'js'} <<< args}"
