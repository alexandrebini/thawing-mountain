import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from 'material-ui/styles'
import SidebarContainer from '../../containers/SidebarContainer'
import styles from './styles'

const Layout = ({children, classes}) => (
  <main className={classes.container}>
    <SidebarContainer />
    {children}
  </main>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired,
  classes: PropTypes.object.isRequired
}

export default withStyles(styles)(Layout)
