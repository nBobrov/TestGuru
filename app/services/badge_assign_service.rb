class BadgeAssignService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      class_name = "BadgeRules::#{badge.rule_type.camelize}Specification"
      rule = class_name.constantize.new(rule_value: badge.rule_value, test_passage: @test_passage)
      if rule.satisfies? && @test_passage.user.badges.exists?(badge.id) == false
        @test_passage.user.badges << badge
      end
    end
  end
end
