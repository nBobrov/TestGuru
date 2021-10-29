class BadgeRules::AllTestsFromCategorySpecification < BadgeRules::BadgeRulesSpecification

  def satisfies?
    passing_all_tests?(@rule_value, @test_passage)
  end

  private

  def passing_all_tests?(rule_value, test_passage)
    category = Category.where(title:@rule_value)
    tests_from_category(category).count == passed_test_from_category(category).count
  end

  def tests_from_category(category)
    Test.where(category: category)
  end

  def passed_test_from_category(category)
    Test.where(category: category)
      .joins(:test_passages)
      .where(test_passages: { user: @test_passage.user, passed: true })
      .distinct
  end

end