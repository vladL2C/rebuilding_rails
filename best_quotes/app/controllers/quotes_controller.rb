class QuotesController < Rulers::Controller
  def a_quote
    @one = "first instance variable"
    @two = "another instance variable"
    render(:a_quote, {noun: :winking, name: "example"})
  end

  def exception
    raise "It's a bad one!"
  end
end
