helpers do
  def check_question_voted(question)
    # check if question has been voted by user
    return true if !logged_in?
    !question.question_votes.where(user_id: current_user.id).any?
  end

  def check_answer_voted(answer)
    # check if answer has been voted by user
    return true if !logged_in?
    !answer.answer_votes.where(user_id: current_user.id).any?
  end

  def count_question_upvotes(question)
    # count upvotes in question
    question.question_votes.where(updown: true).count
  end

  def count_answer_upvotes(answer)
    # count upvotes in answer
    answer.answer_votes.where(updown: true).count
  end

  def count_question_downvotes(question)
    # count downvotes in question
    question.question_votes.where(updown: false).count
  end

  def count_answer_downvotes(answer)
    # count upvotes in answer
    answer.answer_votes.where(updown: false).count
  end
end