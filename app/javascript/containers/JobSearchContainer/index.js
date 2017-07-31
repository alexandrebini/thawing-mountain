import React from 'react'
import {Hits} from 'react-instantsearch/dom'
import {createConnector} from 'react-instantsearch'
import SearchListItem from '../../components/SearchListItem'

const JobSearchContainer = ({loading, query}) => {
  return <Hits hitComponent={SearchListItem} />
}

export default createConnector({
  displayName: 'ConditionalResults',

  getProvidedProps (props, searchState, searchResults) {
    const noResults = searchResults.results ? searchResults.results.nbHits === 0 : false
    return { loading: searchResults.searching, noResults }
  }
})(JobSearchContainer)
