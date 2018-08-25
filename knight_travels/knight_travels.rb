class KnightPosition

  def initialize(pos=[0,0])
    @pos = pos
  end

  def all_valid_moves
    resultant_moves = []
    adds = [1,2,-1,-2].permutation(2).to_a.select{|arr|arr.first.abs!=arr.last.abs}
    adds.each do |pos|
      resultant_moves << [ (pos[0]+@pos[0]) , (pos[1]+@pos[1]) ]
    end
    resultant_moves.select{|pos| (0..7).include?(pos[0]) && (0..7).include?(pos[1])}
  end
end


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
        return search if search
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

k = KnightPosition.new
p = PolyTreeNode.new(k)
