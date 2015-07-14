require 'rails_helper'

RSpec.describe Presentation, type: :model do
  it { should have_db_column :title }
  it { should have_db_column :who }
  it { should have_db_column :action }
  it { should have_db_column :baggage }
  it { should have_db_column :important }
  it { should have_db_column :plan }
end
