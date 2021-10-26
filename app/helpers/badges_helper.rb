module BadgesHelper
  def badges_types
    Badge::TYPES.map do |type_code|
      [t_type(type_code), type_code]
    end
  end

  def t_type (type_code)
    t("admin.badges.types.#{type_code}")
  end
end
