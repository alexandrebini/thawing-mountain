import { createStyleSheet } from 'material-ui/styles'

const styleSheet = createStyleSheet(theme => ({
  container: theme.mixins.gutters({
    paddingTop: 10,
    paddingBottom: 10,
    marginTop: 8,
    marginBottom: 8
  })
}))

export default styleSheet
