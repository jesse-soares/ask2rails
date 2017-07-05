class QuestionFilter
  def self.filter(params, finder = Question)
    scope = finder
        .sort_by_newest
        .includes(:user)
        .paginate(params[:page])

    scope = scope.where(answers_count: 0) if params[:filter] == "unanswered"
    scope = scope.where(category_id: params[:category_id]) if params[:category_id]

    scope
  end
end