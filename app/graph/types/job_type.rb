JobType = GraphQL::ObjectType.define do
  name 'JobType'

  field :id, !types.ID
  field :published_at, !types.Int
  field :story, !StoryType
  field :text, !types.String
  field :user, !types.String
end
