# app/modesl/task.rb

class Task < ActiveRecord::Base
  validates_length_of :name, :minimum => 3,
    :message => 
      "must be at least 3 characters long"
      
  # This is our list of available priorities
  def self.priorities
    %w(1 2 3 4 5)
  end
  
  # Helper method to get open tasks sorted by priority
  def self.open_tasks
    Task.find(:all, :order => [:priority], :conditions => ["comleted = ?", false])
    
  end
end
