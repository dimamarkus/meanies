# NumberMover is a module to manage the :number
# attribute of a model.
# Put in the "/lib" folder and include it in any class 
# (with a :number column) using "include NumberMover".
# NB: Plug-ins such as "acts_as_list" offer additional 
# functionality and better performance.
module NumberMover
  
  # <tt>move_to_number</tt> is an instance method that 
  # will move a list item to a new number, but also 
  # increment/decrement the positions of the other list items
  # as necessary.
  # 
  # Send nil as the value for new_number to remove 
  # the item from the list.
  # 
  
  def hello
    flash[:notice] = 'wowwwwwwwwww'
  end

  def move_to_number(new_number)
    max_number = self.class.where(number_scope).count
    # ensure new_number is an integer in 1..max_number
    unless new_number.nil?
      new_number = [[1, new_number.to_i].max, max_number].min
    end
    
    if number == new_number # do nothing
      return true
    elsif number.nil? # not in list yet
      increment_items(new_number, 1000000)
    elsif new_number.nil? # remove from list
      decrement_items(number+1, 1000000)
    elsif new_number < number # shift lower items up
      increment_items(new_number, number-1)
    elsif new_number > number # shift higher items down
      decrement_items(number+1, new_number)
    end
    return update_attribute(:number, new_number)
  end
  
  private
  
  # <tt>number_scope</tt> defines an SQL fragment used for 
  # narrowing the scope of queries related to number.
  #
  # Often it is not desirable to manage positions for all items 
  # in a class, but instead to narrow the scope based on a 
  # parent class. For example, if subject1 has 3 pages and
  # subject2 has 4 pages, you would want to narrow the scope of 
  # number so that when working with subject1's pages only 
  # positions 1-3 under that subject are reordered. The positions
  # of subject2's pages should be unchanged. And each subject 
  # should be able to have a page at number 1.
  #
  # To narrow the scope, override this method in your model 
  # with the SQL that should be used to narrow the scope. 
  # (NB: Must come after "include NumberMover".)
  # 
  # Example:
  # class Page < ActiveRecord::Base
  #   include NumberMover
  #   def number_scope
  #     "pages.subject_id = #{subject_id.to_i}"
  #   end
  # end
  def number_scope
    # default is always true
    # won't affect SQL conditions or narrow scope
    "1=1"
  end
  
  def increment_items(first, last)
    items = self.class.where(["number >= ? AND number <= ? AND #{number_scope}", first, last])
    items.each {|i| i.update_attribute(:number, i.number + 1) }
  end

  def decrement_items(first, last)
    items = self.class.where(["number >= ? AND number <= ? AND #{number_scope}", first, last])
    items.each {|i| i.update_attribute(:number, i.number - 1) }
  end
  
end
