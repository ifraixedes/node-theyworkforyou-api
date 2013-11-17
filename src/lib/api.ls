require! {
  http.get
  Q: q
  './getUrl'
  './validateParams'
}

exec = (apiKey, apiFuncName, params, requiredParams, optionalParams) -->
  validateParams params, requiredParams, optionalParams
  send getUrl apiFuncName, apiKey, params

send = (url) ->
  deferred = Q.defer()
  buffersList = []

  get url, (response) !->
    response.on 'data', (chunk) !->
      buffersList.push chunk

    response.on 'end', (chunk) !->
      data = JSON.parse Buffer.concat buffersList .toString 'utf8'

      if data.error == void
        deferred.resolve data
      else
        deferred.reject data.error

  .on 'error', (err) !->
    deferred.reject err

  deferred.promise

module.exports = (apiKey) ->
  _exec = exec apiKey

  {
    getMPs: (paramsObj = {}) ->
     _exec 'getMPs', paramsObj, null, {date: 'string', party: 'string', search: 'string'}
  }
