import React from 'react'
import PropTypes from 'prop-types'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import JobList from '../../components/JobList'

const JobListContainer = ({data}) => (
  <JobList data={data} />
)

const Query = gql`
query($storySlug: String) {
  jobs(recent: true, story_slug: $storySlug) {
    id
    published_at
    text
    user
  }
}
`

JobListContainer.propTypes = {
  storySlug: PropTypes.string
}

export default graphql(Query, {
  options (props) {
    return {
      variables: { storySlug: props.storySlug }
    }
  }
})(JobListContainer)
