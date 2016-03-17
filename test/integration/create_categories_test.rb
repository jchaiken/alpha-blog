require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path                                                 # go to new category path
    assert_template 'categories/new'                                      # get the new form
    assert_difference 'Category.count', 1 do                              # create new category sports and post to form
      post_via_redirect categories_path, category: { name: "sports" }
    end
    assert_template 'categories/index'      # check index page to ensure category was added
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end