require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  setup do
    @voter = voters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voter" do
    assert_difference('Voter.count') do
      post :create, voter: { ascension: @voter.ascension, cc: @voter.cc, condition_date: @voter.condition_date, dist_date: @voter.dist_date, dp: @voter.dp, first_name: @voter.first_name, gender: @voter.gender, last_name: @voter.last_name, mailing_address1: @voter.mailing_address1, mailing_address2: @voter.mailing_address2, mailing_address3: @voter.mailing_address3, mailing_city: @voter.mailing_city, mailing_country: @voter.mailing_country, mailing_state: @voter.mailing_state, mailing_zip: @voter.mailing_zip, middle_name: @voter.middle_name, org_reg_date: @voter.org_reg_date, party: @voter.party, reg_date: @voter.reg_date, residence_address: @voter.residence_address, residence_city: @voter.residence_city, residence_zip: @voter.residence_zip, suffix_name: @voter.suffix_name, un: @voter.un, vh10: @voter.vh10, vh11: @voter.vh11, vh12: @voter.vh12, vh13: @voter.vh13, vh14: @voter.vh14, vh15: @voter.vh15, vh16: @voter.vh16, vh1: @voter.vh1, vh2: @voter.vh2, vh3: @voter.vh3, vh4: @voter.vh4, vh5: @voter.vh5, vh6: @voter.vh6, vh7: @voter.vh7, vh8: @voter.vh8, vh9: @voter.vh9 }
    end

    assert_redirected_to voter_path(assigns(:voter))
  end

  test "should show voter" do
    get :show, id: @voter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voter
    assert_response :success
  end

  test "should update voter" do
    patch :update, id: @voter, voter: { ascension: @voter.ascension, cc: @voter.cc, condition_date: @voter.condition_date, dist_date: @voter.dist_date, dp: @voter.dp, first_name: @voter.first_name, gender: @voter.gender, last_name: @voter.last_name, mailing_address1: @voter.mailing_address1, mailing_address2: @voter.mailing_address2, mailing_address3: @voter.mailing_address3, mailing_city: @voter.mailing_city, mailing_country: @voter.mailing_country, mailing_state: @voter.mailing_state, mailing_zip: @voter.mailing_zip, middle_name: @voter.middle_name, org_reg_date: @voter.org_reg_date, party: @voter.party, reg_date: @voter.reg_date, residence_address: @voter.residence_address, residence_city: @voter.residence_city, residence_zip: @voter.residence_zip, suffix_name: @voter.suffix_name, un: @voter.un, vh10: @voter.vh10, vh11: @voter.vh11, vh12: @voter.vh12, vh13: @voter.vh13, vh14: @voter.vh14, vh15: @voter.vh15, vh16: @voter.vh16, vh1: @voter.vh1, vh2: @voter.vh2, vh3: @voter.vh3, vh4: @voter.vh4, vh5: @voter.vh5, vh6: @voter.vh6, vh7: @voter.vh7, vh8: @voter.vh8, vh9: @voter.vh9 }
    assert_redirected_to voter_path(assigns(:voter))
  end

  test "should destroy voter" do
    assert_difference('Voter.count', -1) do
      delete :destroy, id: @voter
    end

    assert_redirected_to voters_path
  end
end
