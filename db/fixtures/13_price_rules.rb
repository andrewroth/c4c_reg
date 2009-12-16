PriceRule.seed_many([

  {
    :event_id => 1,
    :type_id => 3,
    :description => "First 20 discount",
    :field_id => 1,
    :value => 21,
    :discount => 40
  },
  {
    :event_id => 1,
    :type_id => 1,
    :description => "Regular frosh discount",
    :field_id => 1,
    :value => 1,
    :discount => -20
  },
  {
    :event_id => 2,
    :type_id => 2,
    :description => "Registered before Dec. 1",
    :field_id => 1,
    :value => "2009-12-01",
    :discount => -30
  },
  {
    :event_id => 2,
    :type_id => 4,
    :description => "UoWaterloo discount",
    :field_id => 1,
    :value => 1,
    :discount => -10
  }

])

