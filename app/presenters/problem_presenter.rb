class ProblemPresenter < ApplicationPresenter
  presents :problem
  delegate :name, to: :problem

  present_resource_links
  present_owner_link

  def avatar
    h.tag :img, :src => user.avatar_url
  end

  def linked_name
    h.link_to problem.name, problem
  end

  def input
    problem.input || "stdin"
  end

  def output
    problem.output || "stdout"
  end

  def memory_limit
    "#{problem.memory_limit} MB"
  end

  def time_limit
    "#{problem.time_limit} s"
  end

  def progress_bar
    h.progress_bar(problem.score) if problem.score
  end

end
