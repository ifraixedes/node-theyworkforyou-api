require! chai.expect
require! '../lib/validateParams'

_it = it

describe 'validateParams', !->
  requiredParams =
    type: 'string',
    initDate: 'object'
  optionalParams =
    person: 'string'
    search: 'object'

  describe 'when check required parameters', !->
    _it 'doesnt\'t throw an exception if all required parameters haven been provided', !->
      # We execute the function and if it throws an error then mocha report a failed test
      validateParams {type: 'commons', initDate: new Date()}, requiredParams

    _it 'throws an exception when a required parameter is missing and reports its name', !->
      try
        validateParams {type: 'commons'}, requiredParams
        expect false .to.be.ok
      catch {message}
        expect message .to.match /initDate/

    _it 'throws an exception when a required parameter is from a non-expected type', !->
      try
        validateParams {type: 'commons', initDate: '16/11/2013'}, requiredParams
        expect false .to.be.ok
      catch {message}
        expect message .to.match /initDate/

  describe 'when check optional parameters', !->
    _it 'doesnt\'t throw an exception if optional parameters is missing', !->
      # We execute the function and if it throws an error then mocha report a failed test
      validateParams {person: 'David Cameron'}, null, optionalParams

    _it 'throws an exception when an optional parameter is from a non-expected type', !->
      try
        validateParams {person: 'David Cameron', search: 'address'}, null, optionalParams
        expect false .to.be.ok
      catch {message}
        expect message .to.match /search/

  describe 'when check required parameters and optional parameters at the same time', !->
    _it 'doesnt\'t throw an exception if all required parameters haven been provided', !->
      # We execute the function and if it throws an error then mocha report a failed test
      validateParams {type: 'commons', initDate: new Date()}, requiredParams, optionalParams

    _it 'throws an exception when a required parameter is missing and reports its name', !->
      try
        validateParams {type: 'commons', person: 'David Cameron', search: /test/}, requiredParams, optionalParams
        expect false .to.be.ok
      catch {message}
        expect message .to.match /initDate/

    _it 'throws an exception when a parameter is from a non-expected type', !->
      try
        validateParams {type: 'commons', initDate: new Date(), search: 'address'}, requiredParams, optionalParams
        expect false .to.be.ok
      catch {message}
        expect message .to.match /search/
