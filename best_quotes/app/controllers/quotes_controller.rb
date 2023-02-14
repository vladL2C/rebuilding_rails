class QuotesController < Rulers::Controller
  def a_quote
    @one = "first instance variable"
    @two = "another instance variable"
    render(:a_quote, {noun: :winking, name: "example"})
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render(:quote, {obj: quote_1})
  end

  def index
    quotes = FileModel.all
    render(:index, {quotes: quotes})
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }

    m = FileModel.create(attrs)

    render(:quote, {obj: m})
  end

  def from_me
    attrs = {
      attribution: "Me"
    }

    p FileModel.where(attrs)
  end

  def exception
    raise "It's a bad one!"
  end
end
