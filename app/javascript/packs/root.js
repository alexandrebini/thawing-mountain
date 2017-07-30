import React from 'react'
import ReactDOM from 'react-dom'
import { Route } from 'react-router'
import { ConnectedRouter } from 'react-router-redux'
import { ApolloProvider } from 'react-apollo'
import configureStore, { history, apolloClient } from '../config/configureStore'
import StoriesPage from '../pages/StoriesPage'
const store = configureStore()

const Root = props => (
  <ApolloProvider store={store} client={apolloClient}>
    <ConnectedRouter history={history}>
      <Route exact path='/' component={StoriesPage} />
    </ConnectedRouter>
  </ApolloProvider>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Root />,
    document.body.appendChild(document.createElement('div'))
  )
})
