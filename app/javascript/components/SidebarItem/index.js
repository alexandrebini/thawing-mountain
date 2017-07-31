import React from 'react'
import PropTypes from 'prop-types'
import {Link} from 'react-router-dom'
import {ListItem, ListItemIcon, ListItemText} from 'material-ui/List'
import FiberSmartRecord from 'material-ui-icons/FiberSmartRecord'

const SidebarItem = ({story}) => (
  <Link to={`/stories/${story.slug}`}>
    <ListItem button>
      <ListItemIcon>
        <FiberSmartRecord />
      </ListItemIcon>
      <ListItemText primary={story.title} />
    </ListItem>
  </Link>
)

SidebarItem.propTypes = {
  story: PropTypes.shape({
    title: PropTypes.string.isRequired,
    slug: PropTypes.string.isRequired
  }).isRequired
}

export default SidebarItem
