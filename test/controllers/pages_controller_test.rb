require 'minitest_helper'

describe PagesController do

  it 'has a valid class' do
    assert PagesController
  end

  it 'ACTION: index' do
    get :index
    response.success?.must_equal true
  end
end
