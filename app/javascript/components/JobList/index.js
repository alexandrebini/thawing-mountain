import React from 'react'
import PropTypes from 'prop-types'
import { CircularProgress } from 'material-ui/Progress'
import JobListItem from '../JobListItem'
import styles from './styles.css'

const JobList = ({loading, jobs}) => {
  if (loading) {
    return (
      <div className={styles.loading}>
        <CircularProgress />
      </div>
    )
  }

  const items = jobs.map((job) => <JobListItem job={job} key={job.id} />)
  return <div>{items}</div>
}

JobList.propTypes = {
  loading: PropTypes.bool,
  jobs: PropTypes.array
}

export default JobList
