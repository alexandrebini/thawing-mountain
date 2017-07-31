import React from 'react'
import ReactDOM from 'react-dom'
import { Route } from 'react-router'
import { ConnectedRouter } from 'react-router-redux'
import { ApolloProvider } from 'react-apollo'
import configureStore, { history, apolloClient } from '../config/configureStore'
import HomePage from '../pages/HomePage'
import StoryPage from '../pages/StoryPage'
const store = configureStore()

const Root = props => (
  <ApolloProvider store={store} client={apolloClient}>
    <ConnectedRouter history={history}>
      <div>
        <Route exact path='/' component={HomePage} />
        <Route path='/stories/:slug' component={StoryPage} />
      </div>
    </ConnectedRouter>
  </ApolloProvider>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Root />,
    document.body.appendChild(document.createElement('div'))
  )
})
