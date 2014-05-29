Fabrication::Transform.define(:date, lambda { |date_string| Chronic.parse(date_string) })
