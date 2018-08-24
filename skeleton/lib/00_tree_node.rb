
class PolyTreeNode

  def initialize(value)
    @value =value
    @children=[]
    @parent = nil
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def children=(children_arr)

    @children.concat(children_arr)
  end

  def add_child(node)
    # self.children << node unless self.children.include?(node)
    node.parent= self
  end

  def parent=(node)

    if @parent

     @parent.children.delete(self)

      node.children=[self]
      # self.add_child(self)
      @parent = node

    else


      if node
        node.children = [self] unless node.children.include?(self)
        # self.add_child()
        @parent = node

      end
    end

  end

  def value
    @value
  end

  def inspect
    "<parent:#{@parent} ,  value: #{@value} , children: #{@children}>"
  end

  def dfs(target)
      return self if self.value == target
      self.children.each do |child|
        search = child.dfs(target)
        return search unless search.nil?
      end
      nil
  end

  def bfs(target)
    queue= [self]
    until queue.empty?
      potential_result = queue.shift
      return potential_result if potential_result.value == target
      potential_result.children.each{|child| queue << child }
    end
    nil

  end


end

# p nod1=PolyTreeNode.new(1)
# p nod2=PolyTreeNode.new(2)
# p nod3=PolyTreeNode.new(3)
# p nod2.parent=nod1
# p nod3.parent=nod1
# p nod2.parent= nod3
