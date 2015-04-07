class AddIssueRefToReasons < ActiveRecord::Migration
  def change
    add_reference :reasons, :issue, index: true
    add_foreign_key :reasons, :issues
  end
end
