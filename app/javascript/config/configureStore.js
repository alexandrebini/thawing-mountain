import {createStore, compose, applyMiddleware, combineReducers} from 'redux'
import reduxImmutableStateInvariant from 'redux-immutable-state-invariant'
import thunk from 'redux-thunk'
import {routerMiddleware, routerReducer} from 'react-router-redux'
import createHistory from 'history/createBrowserHistory'
import apolloClient from './apolloClient'
import rootReducer from '../reducers'

const history = createHistory()

const middlewares = [
  thunk,
  routerMiddleware(history),
  apolloClient.middleware()
]

const reducers = combineReducers({
  ...rootReducer,
  router: routerReducer,
  apollo: apolloClient.reducer()
})

function configureStoreProd (initialState) {
  return createStore(
    reducers,
    initialState,
    compose(applyMiddleware(...middlewares))
  )
}

function configureStoreDev (initialState) {
  const devMiddlewares = [
    reduxImmutableStateInvariant(),
    ...middlewares
  ]

  const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose
  const store = createStore(
    reducers,
    initialState,
    composeEnhancers(applyMiddleware(...devMiddlewares))
  )

  if (module.hot) {
    module.hot.accept('../reducers', () => {
      const nextReducer = require('../reducers').default // eslint-disable-line global-require
      store.replaceReducer(nextReducer)
    })
  }

  return store
}

const configureStore = process.env.NODE_ENV === 'production' ? configureStoreProd : configureStoreDev

export default configureStore
export { apolloClient, history }
