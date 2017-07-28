require 'rails_helper'

RSpec.describe Job do
  it { should have_db_column(:created_at).with_options(null: false) }
  it { should have_db_column(:hn_id).with_options(null: false) }
  it { should have_db_column(:published_at).with_options(null: false) }
  it { should have_db_column(:text).with_options(null: false) }
  it { should have_db_column(:user).with_options(null: false) }
  it { should have_db_column(:updated_at).with_options(null: false) }
  it { should have_db_index(:hn_id).unique(true) }
  it { should have_db_index(:published_at) }

  it { should belong_to(:story) }

  it { should validate_presence_of(:hn_id) }
  it { should validate_presence_of(:published_at) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:user) }
  it { should validate_uniqueness_of(:hn_id) }
end
