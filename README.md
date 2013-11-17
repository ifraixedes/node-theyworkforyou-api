# They Work For You API
This a node module for They Work For You API (http://www.theyworkforyou.com/api); I will use twfy to mention it in the rest of this document.

## How to install

I've supposed that you have installed NodeJS and npm, so

```js
npm install theyworkforyou-api
```

## How to use

To use this module, you must have a  twfy API key, which you can get easy from its website.

Then, let's start

```js
var twfyAPI = require('theyworkforyou-api');

var twfyClient = twfyAPI('YOUR API KEY');

var promise = twfyClient.getMPs();

promise.then(
  function (data) {
    console.info('Awesome, it succeeded');
    console.info('There is ' + data.length + ' MPs');
  },

  function (err) {
    console.error('Sucks, something was wrong');
    console.error('Error message:' + err.message);
  }
);
```


## Launch the test
To launch the tests is as pretty much straightforward as install the module, so
* install the dev-dependencies
* add your API key in the file ```config/api.json```

launch the test:

```js
make test
```

## What does it need?
1. Create a more thorough tests for all the APIs
2. ... Fork an add your thoughts

## LICENSE
Just MIT, in details in LICENSE file
