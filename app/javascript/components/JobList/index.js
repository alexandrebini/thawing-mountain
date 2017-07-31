import React from 'react'
import PropTypes from 'prop-types'
import { CircularProgress } from 'material-ui/Progress'
import JobListItem from '../JobListItem'
import styles from './styles.css'

const JobList = ({data}) => {
  if (data.loading) {
    return (
      <div className={styles.loading}>
        <CircularProgress />
      </div>
    )
  }

  const items = data.jobs.slice(0,100).map((job) => <JobListItem job={job} key={job.id} />)
  return <div>{items}</div>
}

JobList.propTypes = {
  data: PropTypes.shape({
    loading: PropTypes.bool,
    jobs: PropTypes.array
  }).isRequired
}

export default JobList
