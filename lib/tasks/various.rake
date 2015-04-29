task :reset_public_ids => :environment do
  Issue.all.each do |i|
    i.reasons.first.public_id = '1'
    i.reasons.all.each do |r|
      r.set_public_id
    end
  end
end