import React from 'react'
import Layout from '../Layout'
import JobListContainer from '../../containers/JobListContainer'

const StoryPage = ({match}) => (
  <Layout>
    <JobListContainer storySlug={match.params.slug} />
  </Layout>
)

export default StoryPage
