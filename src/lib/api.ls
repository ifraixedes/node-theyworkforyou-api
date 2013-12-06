require! {
  http.get
  Q: q
  './getUrl'
  './validateParams'
}

exec = (apiKey, apiFuncName, params, requiredParams, optionalParams) -->
  Q.fcall ->
    validateParams params, requiredParams, optionalParams
  .then ->
    send getUrl apiFuncName, apiKey, params

send = (url) ->
  deferred = Q.defer()
  buffersList = []

  get url, (response) !->
    response.on 'data', (chunk) !->
      buffersList.push chunk

    response.on 'end', (chunk) !->
      data = JSON.parse(Buffer.concat buffersList .toString 'utf8')

      if data.error == void
        deferred.resolve data
      else
        deferred.reject new Error data.error

  .on 'error', (err) !->
    deferred.reject err

  deferred.promise

module.exports = (apiKey) ->
  _exec = exec apiKey

  {
    convertURL: (url) ->
      _exec 'convertURL', {url: url}, {url: 'string'}, null

    getConstituency: (name, postcode) ->
      _exec 'getConstituency', {name: name, postcode: postcode}, {name: 'string', postcode: 'string'}, null

    getConstituencies: (optionalParams = {}) ->
      _exec 'getConstituencies', optionalParams, null, {date: 'string', search: 'string'}

    getPerson: (id) ->
      _exec 'getPerson', {id: id}, {id: 'string'}, null

    getMP: (optionalParams = {}) ->
      _exec 'getMP', optionalParams, null, {postcode: 'string', constituency: 'string', id: 'string', always_return: 'string'}

    getMPInfo: (id, optionalParams = {}) ->
      _exec 'getMPInfo', {id: id} <<< optionalParams, {id: 'string'}, optionalParams

    getMPsInfo: (id, optionalParams = {}) ->
      _exec 'getMPsInfo', {id: id} <<< optionalParams, {id: 'string'}, optionalParams

    getMPs: (optionalParams = {}) ->
      _exec 'getMPs', optionalParams, null, {date: 'string', party: 'string', search: 'string'}

    getLord: (optionalParams = {}) ->
      _exec 'getLord', optionalParams,  null, {id: 'string'}

    getLords: (optionalParams = {}) ->
      _exec 'getLords', optionalParams, null, {date: 'string', party: 'string', search: 'string'}

    getMLA: (optionalParams = {}) ->
      _exec 'getMLA', optionalParams, null, {postcode: 'string', constituency: 'string', id: 'string'}

    getMLAs: (optionalParams = {}) ->
      _exec 'getMLAs', optionalParams, null, {date: 'string', party: 'string', search: 'string'}

    getMSP: (optionalParams = {}) ->
      _exec 'getMSP', optionalParams, null, {postcode: 'string', constituency: 'string', id: 'string'}

    getMSPs: (optionalParams = {}) ->
      _exec 'getMSPs', optionalParams, null, {date: 'string', party: 'string', search: 'string'}

    getGeometry: ->
      _exec 'getGeometry', null, null, null

    getBoundary: ->
      _exec 'getBoundary', null, null, null

    getCommittee: (optionalParams = {}) ->
      _exec 'getCommittee', optionalParams, null, {date: 'string', name: 'string'}

    getDebates: (type, optionalParams = {}) ->
      _exec 'getDebates', {type: type} <<< optionalParams, {type: 'string'}, {
        date: 'string',
        search: 'string',
        person: 'string',
        gid: 'string',
        order: 'string',
        page: 'number',
        num: 'number'
      }

    getWrans: (params = {}) ->
      _exec 'getWrans', params, null, {
        date: 'string',
        search: 'string',
        person: 'string',
        gid: 'string',
        order: 'string',
        page: 'number',
        num: 'number'
      }

    getWMS: (params = {}) ->
      _exec 'getWMS', params, null, {
        date: 'string',
        search: 'string',
        person: 'string',
        gid: 'string',
        order: 'string',
        page: 'number',
        num: 'number'
      }

    getHansard: (params = {}) ->
      _exec 'getHansard', params, null, {
        search: 'string',
        person: 'string',
        order: 'string',
        page: 'number',
        num: 'number'
      }

    getComments: (params = {}) ->
      _exec 'getComments', params, null, {
        start_date: 'string',
        end_date: 'string',
        search: 'string',
        pid: 'string',
        order: 'string',
        page: 'number',
        num: 'number'
      }
  }
