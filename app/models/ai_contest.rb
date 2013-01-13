class AiContest < ActiveRecord::Base

  belongs_to :owner, :class_name => :User

  has_many :submissions, :class_name => :AiSubmission

  def rejudge
    spawn(:nice => 10) do
      submissions.each do |sub|
        sub.rejudge
      end
    end
  end
  
  def prod_judge
    #submissions.each_slice(submissions.length/4).to_a.each do |subs|
    spawn(:nice => 12) do
      submissions.each do |sub|
          sub.judge
      end
    end
    #end
  end
  
end