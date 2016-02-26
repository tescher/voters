json.array!(@voters) do |voter|
  json.extract! voter, :id, :un, :party, :dp, :last_name, :first_name, :middle_name, :suffix_name, :ascension, :reg_date, :condition_date, :org_reg_date, :dist_date, :residence_address, :residence_city, :residence_zip, :mailing_address1, :mailing_address2, :mailing_address3, :mailing_city, :mailing_state, :mailing_zip, :mailing_country, :gender, :cc, :vh1, :vh2, :vh3, :vh4, :vh5, :vh6, :vh7, :vh8, :vh9, :vh10, :vh11, :vh12, :vh13, :vh14, :vh15, :vh16
  json.url voter_url(voter, format: :json)
end
