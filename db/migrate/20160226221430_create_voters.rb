class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :un
      t.string :party
      t.string :dp
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffix_name
      t.string :ascension
      t.date :reg_date
      t.date :condition_date
      t.date :org_reg_date
      t.date :dist_date
      t.string :residence_address
      t.string :residence_city
      t.string :residence_zip
      t.string :mailing_address1
      t.string :mailing_address2
      t.string :mailing_address3
      t.string :mailing_city
      t.string :mailing_state
      t.string :mailing_zip
      t.string :mailing_country
      t.string :gender
      t.string :cc
      t.string :vh1
      t.string :vh2
      t.string :vh3
      t.string :vh4
      t.string :vh5
      t.string :vh6
      t.string :vh7
      t.string :vh8
      t.string :vh9
      t.string :vh10
      t.string :vh11
      t.string :vh12
      t.string :vh13
      t.string :vh14
      t.string :vh15
      t.string :vh16

      t.timestamps null: false
    end
  end
end
