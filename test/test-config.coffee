define = window?.define or (cb) -> cb ((dep) -> require(dep.replace('octokat', '../index')))
define (require) ->

  Octokat = require 'octokat'

  unless process.env['GH_TOKEN']
    console.error('No GitHub token provided. If you are running against the fixture files you should be ok')

  config =
    USERNAME: 'octokat-test'
    TOKEN: process.env['GH_TOKEN']
    ORG_NAME: 'octokat-test-group'
    REPO_USER: 'octokat-test'
    REPO_NAME: 'octokat-test-repo' # Cannot use '.' because najax does not like it
    REPO_HOMEPAGE: 'https:/github.com/philschatz/octokat.js'
    OTHER_HOMEPAGE: 'http://example.com'
    OTHER_USERNAME: 'octokit-test2'
    DEFAULT_BRANCH: 'master'
    LONG_TIMEOUT: 10 * 1000 # 10 seconds
    SHORT_TIMEOUT: 5 * 1000 # 5 seconds

  config.Octokat = Octokat
  config.client = new Octokat {token:config.TOKEN}
  config.test_repo = "#{config.REPO_USER}/#{config.REPO_NAME}"
  config.test_github_login = config.USERNAME

  if module?
    module.exports = config
  return config
