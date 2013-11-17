require! {
  chai
  chaiAsPromised: 'chai-as-promised'
  twfyApi: '../lib/api'
  apiConfig: '../../config/api'
}

_it = it

describe 'The Work For You API allow to make the request to', !->
  chai.use chaiAsPromised
  expect = chai.expect
  myTwfyApi = twfyApi apiConfig.key

  _it 'getMPs', !->
    expect myTwfyApi.getMPs() .to.eventually.be.fulfilled
