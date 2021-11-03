class BadgeRules::AllTestsFromCategorySpecification < BadgeRules::BadgeRulesSpecification

  def satisfies?
    passing_all_tests?(@rule_value, @test_passage)
  end

  private

  def passing_all_tests?(category_name, test_passage)
    Test.find_by_category(category_name).count == passed_test_from_category(category_name).count
  end

  def passed_test_from_category(category_name)
    Test.find_by_category(category_name)
        .joins(:test_passages)
        .where(test_passages: { user: @test_passage.user, passed: true })
        .distinct
  end

end