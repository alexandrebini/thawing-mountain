import React from 'react'
import PropTypes from 'prop-types'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import StoryContainer from '../StoryContainer'

const HomeContainer = ({data}) => {
  if (data.loading) return null
  return <StoryContainer storySlug={data.story.slug} />
}

const Query = gql`
query {
  story(latest: true) {
    slug
  }
}
`

HomeContainer.propTypes = {
  data: PropTypes.shape({
    story: PropTypes.shape({
      slug: PropTypes.string
    })
  }).isRequired
}

export default graphql(Query, {
  options (props) {
    return {
      variables: { storySlug: props.storySlug }
    }
  }
})(HomeContainer)
