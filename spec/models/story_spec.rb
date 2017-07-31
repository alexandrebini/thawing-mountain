require 'rails_helper'

RSpec.describe Story do
  it { should have_db_column(:created_at).with_options(null: false) }
  it { should have_db_column(:hn_id).with_options(null: false) }
  it { should have_db_column(:published_at).with_options(null: false) }
  it { should have_db_column(:slug).with_options(null: false) }
  it { should have_db_column(:title).with_options(null: false) }
  it { should have_db_column(:updated_at).with_options(null: false) }
  it { should have_db_index(:hn_id).unique(true) }
  it { should have_db_index(:published_at) }
  it { should have_db_index(:slug).unique(true) }

  it { should have_many(:jobs).dependent(:destroy) }

  it { should validate_presence_of(:hn_id) }
  it { should validate_presence_of(:published_at) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:hn_id) }
  it { should allow_value('who is hiring').for(:title) }
  it { should_not allow_value('seeking freelancer').for(:title) }
  it { should_not allow_value('who wants to be hired').for(:title) }
end
