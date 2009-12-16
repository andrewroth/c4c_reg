class PriceRule < ActiveRecord::Base

  load_mappings

  belongs_to :price_rule_type, :foreign_key => _(:type_id)
  belongs_to :field, :foreign_key => _(:field_id)
  belongs_to :event, :foreign_key => _(:event_id)

end
