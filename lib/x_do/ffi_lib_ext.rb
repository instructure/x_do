# Extensions to the structures in ffi_lib.

# :nodoc: namespace
class XDo

# :nodoc: namespace
module FFILib

# :nodoc: extending with better constructor
class XDoSearch
  # Creates an XDoSearch structure from options passed to XDo#find_window.
  def self.from_options(options = {})
    search = self.new
    search[:max_depth] = (options[:depth] || -1).to_i
    
    # SEARCH_ANY vs SEARCH_ALL in xdo.h
    search[:require] = (options[:require] == :any) ? 0 : 1

    search[:searchmask] = 0
    [
      [:title, :title, XDo::FFILib::Consts::SEARCH_TITLE],
      [:name, :winname, XDo::FFILib::Consts::SEARCH_NAME],
      [:class, :winclass, XDo::FFILib::Consts::SEARCH_CLASS],
      [:class_name, :winclassname, XDo::FFILib::Consts::SEARCH_CLASSNAME]
    ].each do |option, struct_key, bit|
      if options[option]
        search[:searchmask] |= bit

        c_string = FFI::MemoryPointer.new options[option].length + 1
        c_string.put_string 0, options[option]
        search[struct_key] = c_string
      else
        search[struct_key] = nil
      end
    end
    
    if options[:visible]
      search[:searchmask] |= XDo::FFILib::Consts::SEARCH_ONLYVISIBLE
      search[:only_visible] = 1
    else
      search[:only_visible] = 0
    end
    
    [
      [:pid, :pid, XDo::FFILib::Consts::SEARCH_PID],
      [:screen, :screen, XDo::FFILib::Consts::SEARCH_SCREEN],
      [:desktop, :desktop, XDo::FFILib::Consts::SEARCH_DESKTOP]

    ].each do |option, struct_key, bit|
      if options[option]
        search[:searchmask] |= bit
        search[struct_key] = options[option].to_i
      else
        search[struct_key] = 0
      end
    end
    
    search[:limit] = options[:limit].to_i || 0
    
    search
  end
end  # class XDo::FFILib::XDoSearch

end  # module XDo::FFILib

end  # namespace XDo
