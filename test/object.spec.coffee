define = window?.define or (deps, cb) -> cb((require(dep.replace('cs!./', './')) for dep in deps)...)
define ['chai', 'cs!./test-config'], ({assert, expect}, {client, USERNAME, TOKEN, ORG_NAME, REPO_USER, REPO_NAME, REPO_HOMEPAGE, OTHER_HOMEPAGE, OTHER_USERNAME, DEFAULT_BRANCH, LONG_TIMEOUT, SHORT_TIMEOUT}) ->

  describe 'Returned Objects', ->
    it 'has the same methods on octo.repos(REPO_ID).fetch().then(repo) as octo.me.repos.fetch().then(repos[0])', ->
      client.me.repos.fetch()
      .then ({items}) ->
        expect(items).to.not.be.empty
        items[0].forks.fetch()

    it 'has the same methods on octo.gists(ID).fetch().then(gist) as octo.gists.public.fetch().then(gists[0])', ->
      client.gists.public.fetch()
      .then ({items}) ->
        expect(items).to.not.be.empty
        expect(items[0].star.contains).to.be.a.function

    it 'has the same methods on octo.users(ID).fetch().then(user) as octo.users.fetch().then(users[0])', ->
      client.users.fetch()
      .then ({items}) ->
        expect(items).to.not.be.empty
        expect(items[0].gists.fetch).to.be.a.function

    it 'has does not add the root context to returned objects', ->
      client.repos(REPO_USER, REPO_NAME).issues(1).fetch().then (issue) ->
        expect(issue.user.avatar.url).to.not.be.null
        expect(issue.user.avatar.url).to.be.a.string
