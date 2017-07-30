QueryType = GraphQL::ObjectType.define do
  name 'QueryType'

  field :stories, types[StoryType] do
    argument :recent, types.Boolean
    argument :with_jobs, types.Boolean
    resolve ->(_obj, args, _ctx) { ::Story.filter(args) }
  end

  field :story, StoryType do
    argument :slug, !types.String
    resolve ->(_obj, args, _ctx) { Job.find_by(slug: args['slug']) }
  end

  field :jobs, types[JobType] do
    argument :recent, types.Boolean
    resolve ->(_obj, args, _ctx) { Job.filter(args) }
  end

  field :job, JobType do
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Job.find_by(id: args['id']) }
  end
end
