class QuestionFilter
  def self.filter(params, finder = Question)
    scope = finder
        .sort_by_newest
        .includes(:user)
        .paginate(params[:page])

    if params[:filter] == "unanswered"
      scope = scope.where(answers_count: 0)
    end

    scope
  end
end