class BadgeAssignService

  RULES = {
    success_passing_all_tests_from_category: BadgeRules::AllTestsFromCategorySpecification,
    success_passing_test_from_the_first_try: BadgeRules::FirstTrySpecification,
    success_passing_all_tests_of_specified_level: BadgeRules::AllTestsOfSpecifiedLevelSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(rule_value: badge.rule_value, test_passage: @test_passage)
      assign_badge(badge) if rule.satisfies?
    end
  end

  private

  def assign_badge(badge)
    UserBadge.create(user_id: @test_passage.user.id, badge_id: badge.id)
  end

end
