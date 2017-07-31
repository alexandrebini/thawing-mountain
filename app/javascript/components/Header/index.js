import React from 'react'
import PropTypes from 'prop-types'
import AppBar from 'material-ui/AppBar'
import Toolbar from 'material-ui/Toolbar'
import Typography from 'material-ui/Typography'
import {SearchBox} from 'react-instantsearch/dom'
import styles from './styles.css'

const Header = ({classes, data}) => (
  <AppBar position='static'>
    <Toolbar>
      <Typography type='title' color='inherit'>
        Title
      </Typography>
      <div className={styles.search}>
        <SearchBox />
      </div>
    </Toolbar>
  </AppBar>
)

Header.propTypes = {

}

export default Header
