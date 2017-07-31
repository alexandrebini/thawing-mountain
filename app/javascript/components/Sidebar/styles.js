import { createStyleSheet } from 'material-ui/styles'

const container = {
  height: '100vh'
}

const styleSheet = createStyleSheet({
  loading: {
    ...container,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center'
  },

  list: {
    ...container
  }
})

export default styleSheet
