import React from 'react'
import PropTypes from 'prop-types'
import JobListItem from '../JobListItem'

const SearchListItem = ({hit}) => {
  return <JobListItem job={hit} />
}

SearchListItem.propTypes = {
  hit: PropTypes.shape({
    text: PropTypes.string.isRequired,
    published_at: PropTypes.number.isRequired,
    user: PropTypes.string.isRequired
  }).isRequired
}

export default SearchListItem
