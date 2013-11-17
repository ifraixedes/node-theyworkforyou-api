require! {
  chai
  chaiAsPromised: 'chai-as-promised'
  twfyApi: '../lib/api'
  apiConfig: '../../config/api'
}

_it = it

describe 'The Work For You API allow to make the request to', (done) !->
  chai.use chaiAsPromised
  expect = chai.expect
  myTwfyApi = twfyApi apiConfig.key

  @timeout 5000

  _it 'convertURL', (done) !->
    expect myTwfyApi.convertURL 'http://www.publications.parliament.uk/pa/cm200708/cmhansrd/cm080122/debtext/80122-0012.htm#08012286000131' .to.eventually.be.fulfilled.and.notify done

  _it 'getConstituency', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getConstituency() .to.eventually.be.rejected.and.notify done

  _it 'getConstituencies', (done) !->
    expect myTwfyApi.getConstituencies() .to.eventually.be.fulfilled.and.notify done

  _it 'getPerson', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getPerson() .to.eventually.be.rejected.and.notify done

  _it 'getMP', (done) !->
    expect myTwfyApi.getMP() .to.eventually.be.rejected.and.notify done

  _it 'getMPInfo', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getMPInfo() .to.eventually.be.rejected.and.notify done

  _it 'getMPsInfo', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getMPsInfo() .to.eventually.be.rejected.and.notify done

  _it 'getMPs', (done) !->
    expect myTwfyApi.getMPs() .to.eventually.be.fulfilled.and.notify done

  _it 'getLord', (done) !->
    expect myTwfyApi.getLord() .to.eventually.be.rejected.and.notify done

  _it 'getLords', (done) !->
    expect myTwfyApi.getLords() .to.eventually.be.fulfilled.and.notify done

  _it 'getMLA', (done) !->
    expect myTwfyApi.getMLA() .to.eventually.be.rejected.and.notify done

  _it 'getMLAs', (done) !->
    expect myTwfyApi.getMLAs() .to.eventually.be.fulfilled.and.notify done

  _it 'getMSP', (done) !->
    expect myTwfyApi.getMSP() .to.eventually.be.rejected.and.notify done

  _it 'getMSPs', (done) !->
    expect myTwfyApi.getMSPs() .to.eventually.be.fulfilled.and.notify done

  _it 'getGeometry', (done) !->
    expect myTwfyApi.getGeometry() .to.eventually.be.rejected.and.notify done

  _it 'getBoundary', (done) !->
    expect myTwfyApi.getBoundary() .to.eventually.be.rejected.and.notify done

  _it 'getCommittee', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getCommittee() .to.eventually.be.rejected.and.notify done

  _it 'getDebates', (done) !->
    # No required parameters are provided so an exception should thrown
    expect myTwfyApi.getDebates() .to.eventually.be.rejected.and.notify done

  _it 'getWrans', (done) !->
    expect myTwfyApi.getWrans() .to.eventually.be.rejected.and.notify done

  _it 'getWMS', (done) !->
    expect myTwfyApi.getWMS() .to.eventually.be.rejected.and.notify done

  _it 'getHansard', (done) !->
    expect myTwfyApi.getHansard() .to.eventually.be.rejected.and.notify done

  _it 'getComments', (done) !->
    expect myTwfyApi.getComments() .to.eventually.be.fulfilled.and.notify done
