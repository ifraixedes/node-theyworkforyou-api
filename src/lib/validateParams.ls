required = (requiredParams, params) !->
  for paramName, paramType of requiredParams
    if not paramName of params or paramType != typeof params[paramName]
      then throw new Error "required #{paramName} parameter is missing or of an invalid type"

optional = (optionalParams, params) !->
  for  paramName, paramType of optionalParams
    if paramName of params and paramType != typeof params[paramName]
      then throw new Error "optional #{paramName} must be #{paramType} type"

module.exports = (params, requiredParams = {}, optionalParams = {}) ->
  required requiredParams, params
  optional optionalParams, params
