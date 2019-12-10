class Misc

  def self.not_yet_implemented
    "<br> <strong>#{Date.current.to_formatted_s(:rfc822)}: NOT YET IMPLEMENTED</strong>"
  end

  def self.enumerate_print_list(klass)
    klass.list.map{ |v| "'#{v}' = #{klass.t(v)}" }.to_sentence
  end
  
end