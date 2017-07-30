import { graphql } from 'react-apollo'
import gql from 'graphql-tag'

const SidebarContainer = ({data}) => {
  console.log('---------', data)
  if (data.loading) return null
  return null
}

const Query = gql`
query {
  stories(with_jobs: true, recent: true) {
    title
  }
}
`

export default graphql(Query)(SidebarContainer)
