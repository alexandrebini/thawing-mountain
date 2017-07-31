import React from 'react'
import PropTypes from 'prop-types'
import Paper from 'material-ui/Paper'
import Typography from 'material-ui/Typography'
import SimpleFormat from 'react-simple-format'
import { withStyles } from 'material-ui/styles'
import styles from './styles'

const JobListItem = ({classes, job}) => (
  <Paper className={classes.container} elevation={0}>
    <Typography type='body1' component='div'>
      <SimpleFormat text={job.text} />
    </Typography>
  </Paper>
)

JobListItem.propTypes = {
  job: PropTypes.shape({
    text: PropTypes.string.isRequired,
    published_at: PropTypes.number.isRequired,
    user: PropTypes.string.isRequired
  }).isRequired
}

export default withStyles(styles)(JobListItem)
