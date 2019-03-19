####################
# 真理値バリデーター
# @author tanakakota
####################
class BooleanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value == true || value == false
      record.errors[attribute] << (options[:message] || "はtrue/falseを入力してください")
    end
  end
end