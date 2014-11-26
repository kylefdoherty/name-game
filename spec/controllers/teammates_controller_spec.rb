require 'rails_helper'

describe TeammatesController do
  let(:existing_user_payload) {
    { user:
      { pistachio_id:   "id",
        name:           "Bruce Wayne",
        initials:       "initials",
        email:          "batman@gmail.com",
        phone:          "desktop_number",
        mobile:         "mobile_number",
        role:           "role",
        job_title:      "Batman",
        avatar_url:     "https://dzaqm99ko40cm.cloudfront.net/avatars/6565441/extra_large.jpg?1412000436",
        thumb_url:      "avatar",
        linkedin_url:   "linkedin_url",
        team_id:        "team_id",
        team_name:      "Good Guys",
        office_id:      "New York",
        office_name:    "office.try",
        social_profile: "social_profile_params",
        enabled:        "enabled"
      }
    }
  }

  let(:new_user_payload) {
    { user:
      { pistachio_id:   "id",
        name:           "Bruce Wayne",
        initials:       "initials",
        email:          "batman@gmail.com",
        phone:          "desktop_number",
        mobile:         "mobile_number",
        role:           "role",
        job_title:      "Batman",
        avatar_url:     "https://dzaqm99ko40cm.cloudfront.net/avatars/6565441/extra_large.jpg?1412000436",
        thumb_url:      "avatar_url",
        linkedin_url:   "linkedin_url",
        team_id:        "team_id",
        team_name:      "Good Guys",
        office_id:      "office_id",
        office_name:    "London",
        social_profile: "social_profile_params",
        enabled:        "enabled"
      }
    }
  }



  describe 'Patch #update' do
    before :each do
      create(:teammate,
             name: "Bruce Wayne",
             title: "Batman",
             office: "NYC",
             team: "Merica",
             image: "images/batman.jpg")
    end

  end
end
