task :reset_public_ids => :environment do
  # Rails.application.eager_load!
  Dir[Rails.root.join('app', 'models', '**/*')].each { |file| File.basename(file, '.rb').camelize.constantize }
  Issue.all.each do |i|
    puts 'issue.all loaded'
    puts 'first reason: '+i.reasons.first.to_s
    # i.reasons.first.update_attributes(:public_id => '1') if i.reasons.first.present?
    pid = 1
    i.reasons.all.order(:created_at).each do |r|
      r.update_attribute(:public_id, pid)
      puts 'public_id: '+r.public_id.to_s
      puts pid +=1
    end
  end
end

# task :notify_user => :environment do
  # page_updates = ProductPageUpdate.where(status: 'pending')
  # PageUpdate.user_notification(page_updates).deliver!
  # page_updates.each do |page_update|
    # page_update.update_attribute(:status, 'notified')
  # end
# end