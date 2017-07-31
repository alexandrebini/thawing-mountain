import React from 'react'
import PropTypes from 'prop-types'
import List from 'material-ui/List'
import { CircularProgress } from 'material-ui/Progress'
import SidebarItem from '../SidebarItem'
import { withStyles } from 'material-ui/styles'
import styles from './styles'

const Sidebar = ({classes, data}) => {
  if (data.loading) {
    return (
      <div className={classes.loading}>
        <CircularProgress />
      </div>
    )
  }

  const items = data.stories.map((story) => <SidebarItem story={story} key={story.slug} />)
  return <List className={classes.list}>{items}</List>
}

Sidebar.propTypes = {
  classes: PropTypes.object.isRequired,
  data: PropTypes.object.isRequired
}

export default withStyles(styles)(Sidebar)
