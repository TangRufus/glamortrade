class RootDomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless root_domain_valid?(value)
      record.errors.add(attribute, error_message)
    end
  end

  private
  def root_domain_valid? value
    (public_suffix_valid? value) && (addressable_valid? value)
  end

  def public_suffix_valid? value
    PublicSuffix.valid?(value)
  end

  def addressable_valid? value
    Addressable::URI.parse("http://#{value}").host == value
  end

  def error_message
    options[:message] || "is not a valid root domain"
  end
end
