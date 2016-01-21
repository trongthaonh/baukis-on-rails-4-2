class CustomerInterestPresenter < ModelPresenter
  def interest_id
    object.interest_id
  end

  def title
    object.interest.title
  end

  def deletable
    object.interest.deletable
  end
end
