####################
# 評価値バリデーター
# @author tanakakota
####################
class EvaluationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.between?(1, 5) then
      record.errors[attribute] << (options[:message] || "は1〜5の五段階です")
    end
  end
end