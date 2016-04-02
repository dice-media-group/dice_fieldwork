FactoryGirl.define do
  factory :consultation do
    name "one time event"
description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
is_all_day false
from_date 'Mon, 17 Jun 2013'
from_time '2000-01-01 09:00:00 UTC'
to_date 'Mon, 17 Jun 2013'
to_time '2000-01-01 17:00:00 UTC'
repeats 'never'
repeats_every_n_days nil
repeats_every_n_weeks nil
repeats_every_n_months nil
repeats_monthly 'each'
repeats_every_n_years nil
repeats_yearly_on false
repeat_ends 'never'
repeat_ends_on 'Mon, 17 Jun 2013'
time_zone 'Eastern Time (US & Canada)'

  end

end
