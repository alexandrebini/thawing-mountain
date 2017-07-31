import React from 'react'
import Layout from '../Layout'
import StoryContainer from '../../containers/StoryContainer'

const StoryPage = ({match}) => (
  <Layout>
    <StoryContainer storySlug={match.params.slug} />
  </Layout>
)

export default StoryPage
