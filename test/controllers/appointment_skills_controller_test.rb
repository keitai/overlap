require 'test_helper'

class AppointmentSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment_skill = appointment_skills(:one)
  end

  test "should get index" do
    get appointment_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_skill_url
    assert_response :success
  end

  test "should create appointment_skill" do
    assert_difference('AppointmentSkill.count') do
      post appointment_skills_url, params: { appointment_skill: {  } }
    end

    assert_redirected_to appointment_skill_url(AppointmentSkill.last)
  end

  test "should show appointment_skill" do
    get appointment_skill_url(@appointment_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_skill_url(@appointment_skill)
    assert_response :success
  end

  test "should update appointment_skill" do
    patch appointment_skill_url(@appointment_skill), params: { appointment_skill: {  } }
    assert_redirected_to appointment_skill_url(@appointment_skill)
  end

  test "should destroy appointment_skill" do
    assert_difference('AppointmentSkill.count', -1) do
      delete appointment_skill_url(@appointment_skill)
    end

    assert_redirected_to appointment_skills_url
  end
end
