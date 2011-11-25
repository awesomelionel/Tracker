module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title ="Tracker Hero App "
    if @ticket.nil?
      if @title.nil?
        base_title
      else
        "#{base_title} | #{@title}"
      end
    else
      "#{base_title} | #{@ticket.title}"
    end
  end

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
      current_user.try(:admin?)
    nil
  end
end

