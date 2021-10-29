class BadgeRules::AllTestsOfSpecifiedLevelSpecification < BadgeRules::BadgeRulesSpecification

  def satisfies?
    passing_all_tests?(@rule_value.to_i, @test_passage)
  end

  private

  def passing_all_tests?(level, test_passage)
    tests_of_specified_level(level).count == passed_tests_of_specified_level(level).count
  end

  def tests_of_specified_level(level)
    Test.where(level: level)
  end

  def passed_tests_of_specified_level(level)
    Test.where(level: level)
      .joins(:test_passages)
      .where(test_passages: { user: @test_passage.user, passed: true })
      .distinct
  end

end