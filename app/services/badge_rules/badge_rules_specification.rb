class BadgeRules::BadgeRulesSpecification

  def initialize(rule_value: , test_passage:)
    @rule_value = rule_value
    @test_passage = test_passage
  end

  def satisfies?
    raise "#{method} undefined for #{self.class}"
  end
end