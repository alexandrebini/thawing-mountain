import React from 'react'
import ReactDOM from 'react-dom'
import { Route } from 'react-router'
import { ConnectedRouter } from 'react-router-redux'
import { ApolloProvider } from 'react-apollo'
import configureStore, { history, apolloClient } from '../config/configureStore'

const store = configureStore()

const About = props => (<div>aaa</div>)

const Root = props => (
  <ApolloProvider store={store} client={apolloClient}>
    <ConnectedRouter history={history}>
      <div>
        <Route exact path='/' component={About} />
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
