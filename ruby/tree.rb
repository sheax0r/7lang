class Tree
  attr_accessor :name, :children
  def initialize(hash)
    puts "new tree: #{hash}"
    @name = hash.keys.first
    @children = hash.values.map{
      |v| v.map do |k, v|
        Tree.new({k=>v})
      end
    }.flatten
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end
