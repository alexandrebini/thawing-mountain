import React from 'react'
import PropTypes from 'prop-types'
import SidebarContainer from '../../containers/SidebarContainer'
import styles from './styles.css'

const Layout = ({children}) => (
  <main className={styles.container}>
    <nav className={styles.sidebar}>
      <SidebarContainer />
    </nav>
    <article className={styles.article}>
      {children}
    </article>
  </main>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired
}

export default Layout
