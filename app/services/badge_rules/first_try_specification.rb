class BadgeRules::FirstTrySpecification < BadgeRules::BadgeRulesSpecification

  def satisfies?
    retry_count = @test_passage.user.test_passages.where(test_id: @test_passage.test.id).count
    retry_count == 1 && @test_passage.passed?
  end

end