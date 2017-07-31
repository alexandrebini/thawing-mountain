import React from 'react'
import ReactDOM from 'react-dom'
import {Route} from 'react-router'
import {ConnectedRouter} from 'react-router-redux'
import {ApolloProvider} from 'react-apollo'
import {InstantSearch} from 'react-instantsearch/dom'
import configureStore, {history, apolloClient} from '../config/configureStore'
import {ALGOLIA_APP_ID, ALGOLIA_APP_KEY, ALGOLIA_INDEX_NAME} from '../constants/algolia'
import HomePage from '../pages/HomePage'
import StoryPage from '../pages/StoryPage'
const store = configureStore()

const Root = props => (
  <ApolloProvider store={store} client={apolloClient}>
    <InstantSearch appId={ALGOLIA_APP_ID} apiKey={ALGOLIA_APP_KEY} indexName={ALGOLIA_INDEX_NAME}>
      <ConnectedRouter history={history}>
        <div>
          <Route exact path='/' component={HomePage} />
          <Route path='/stories/:slug' component={StoryPage} />
        </div>
      </ConnectedRouter>
    </InstantSearch>
  </ApolloProvider>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Root />,
    document.body.appendChild(document.createElement('div'))
  )
})
