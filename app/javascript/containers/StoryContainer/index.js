import React from 'react'
import PropTypes from 'prop-types'
import JobListContainer from '../JobListContainer'
import JobSearchContainer from '../JobSearchContainer'
import {createConnector} from 'react-instantsearch'
import _isEmpty from 'lodash/isEmpty'

const StoryContainer = ({storySlug, query}) => {
  if (_isEmpty(query)) {
    return <JobListContainer storySlug={storySlug} />
  } else {
    return <JobSearchContainer />
  }
}

StoryContainer.propTypes = {
  storySlug: PropTypes.string,
  query: PropTypes.string
}

export default createConnector({
  displayName: 'ConditionalResults',

  getProvidedProps (props, searchState, searchResults) {
    return { query: searchState.query }
  }
})(StoryContainer)
