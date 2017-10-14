class EmailFormatValidator < ActiveModel::EachValidator
	
  def validate_each(object, attribute, value)
    # unless value =~ /^([^@\s]+)/+"#{$current_market.email_address_type}"
	unless value =~ /^([^@\s]+)@#{$current_market.email_address_type}/i
      object.errors.add(attribute, :email_format, options)
	end
  end

end