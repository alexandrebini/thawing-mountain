import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import Sidebar from '../../components/Sidebar'

const SidebarContainer = ({data}) => (
  <Sidebar data={data} />
)

const Query = gql`
query {
  stories(with_jobs: true, recent: true) {
    slug
    title
  }
}
`

export default graphql(Query)(SidebarContainer)
