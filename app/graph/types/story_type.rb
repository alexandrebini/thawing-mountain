StoryType = GraphQL::ObjectType.define do
  name 'StoryType'

  field :id, !types.ID
  field :jobs, types[JobType]
  field :published_at, !types.Int
  field :slug, !types.String
  field :title, !types.String
end
