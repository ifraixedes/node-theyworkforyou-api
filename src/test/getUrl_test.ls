require! chai.expect
require! '../lib/getUrl'
_it = it

describe 'getUrl compose the api urls', !->
  key = 'theAPIKeyThatYouHave'
  baseUrl = "http://www.theyworkforyou.com/api/getMPs?key=#{key}&output=js"


  describe 'from the specified function', !->
    _it 'with only a key parameter when it doesn\'t require any parameter', ->
      expect getUrl 'getMPs', key .to.be.equal baseUrl

    _it 'with some parameters it includes the key parameter and the provided parameters', ->
      expect getUrl 'getMPs', key, {name: 'Bridget Phillipson', party: 'Labour'}
        .to.be.equal baseUrl + '&name=Bridget%20Phillipson&party=Labour'
