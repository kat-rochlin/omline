class CreateTeacherCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_certifications do |t|
      t.references :user, foreign_key: true
      t.references :certification, foreign_key: true

      t.timestamps
    end
  end
end
