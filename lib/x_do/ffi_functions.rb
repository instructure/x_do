require 'ffi'

# :nodoc: namespace
class XDo

# :nodoc: function attachments
module FFILib
  def self.alias_class_method(target, source)
    singleton_class.send(:alias_method, target, source)
  end

  attach_function :xdo_new, [:string], :pointer
  attach_function :xdo_version, [], :string
  attach_function :xdo_free, [:pointer], :void
  attach_function :xdo_get_active_window, [:pointer, :pointer],
                                          XDo::FFILib::Status
  attach_function :xdo_get_focused_window, [:pointer, :pointer],
                                         XDo::FFILib::Status
  attach_function :xdo_get_focused_window_sane, [:pointer, :pointer],
                                              XDo::FFILib::Status

  attach_function :xdo_get_pid_window, [:pointer, :window], :int

  attach_function :xdo_search_windows, [:pointer, :pointer, :pointer, :pointer],
                                      XDo::FFILib::Status

  attach_function :xdo_activate_window, [:pointer, :window], XDo::FFILib::Status
  attach_function :xdo_focus_window, [:pointer, :window], XDo::FFILib::Status
  attach_function :xdo_raise_window, [:pointer, :window], XDo::FFILib::Status

  attach_function :xdo_get_window_name, [:pointer, :window, :pointer, :pointer,
                                         :pointer], XDo::FFILib::Status
  attach_function :xdo_get_window_location, [:pointer, :window, :pointer,
                                             :pointer, :pointer],
                                            XDo::FFILib::Status
  attach_function :xdo_get_window_size, [:pointer, :window, :pointer, :pointer],
                                        XDo::FFILib::Status
  attach_function :xdo_move_window, [:pointer, :window, :int, :int],
                                    XDo::FFILib::Status
  attach_function :xdo_set_window_size, [:pointer, :window, :int, :int, :int],
                                       XDo::FFILib::Status
  attach_function :xdo_get_mouse_location, [:pointer, :pointer, :pointer, :pointer],
                                      XDo::FFILib::Status
  attach_function :xdo_move_mouse, [:pointer, :int, :int, :int],
                                  XDo::FFILib::Status
  attach_function :xdo_move_mouse_relative, [:pointer, :int, :int],
                                           XDo::FFILib::Status
  attach_function :xdo_wait_for_mouse_move_from, [:pointer, :int, :int],
                                                 XDo::FFILib::Status
  attach_function :xdo_wait_for_mouse_move_to, [:pointer, :int, :int],
                                               XDo::FFILib::Status

  attach_function :xdo_move_mouse_relative_to_window, [:pointer, :window, :int,
                                                      :int], XDo::FFILib::Status
  attach_function :xdo_mouse_down, [:pointer, :window, :int], XDo::FFILib::Status
  attach_function :xdo_mouse_up, [:pointer, :window, :int], XDo::FFILib::Status
  attach_function :xdo_click_window, [:pointer, :window, :int], XDo::FFILib::Status

  attach_function :xdo_enter_text_window, [:pointer, :window, :string, :int],
                             XDo::FFILib::Status
  attach_function :xdo_send_keysequence_window, [:pointer, :window, :string, :int],
                                    XDo::FFILib::Status
  attach_function :xdo_send_keysequence_window_down, [:pointer, :window, :string, :int],
                                         XDo::FFILib::Status
  attach_function :xdo_send_keysequence_window_up, [:pointer, :window, :string, :int],
                                       XDo::FFILib::Status

  alias_class_method :xdo_window_get_active, :xdo_get_active_window
  alias_class_method :xdo_window_get_focus, :xdo_get_focused_window
  alias_class_method :xdo_window_sane_get_focus, :xdo_get_focused_window_sane
  alias_class_method :xdo_window_search, :xdo_search_windows
  alias_class_method :xdo_mouselocation, :xdo_get_mouse_location
  alias_class_method :xdo_mouse_wait_for_move_to, :xdo_wait_for_mouse_move_to
  alias_class_method :xdo_mouse_wait_for_move_from, :xdo_wait_for_mouse_move_from
  alias_class_method :xdo_mousemove, :xdo_move_mouse
  alias_class_method :xdo_window_get_pid, :xdo_get_pid_window
  alias_class_method :xdo_window_active, :xdo_activate_window
  alias_class_method :xdo_window_focus, :xdo_focus_window
  alias_class_method :xdo_window_raise, :xdo_raise_window
  alias_class_method :xdo_window_move, :xdo_move_window
  alias_class_method :xdo_window_setsize, :xdo_set_window_size
  alias_class_method :xdo_mousemove_relative, :xdo_move_mouse_relative
  alias_class_method :xdo_mousemove_relative_to_window, :xdo_move_mouse_relative_to_window
  alias_class_method :xdo_mousedown, :xdo_mouse_down
  alias_class_method :xdo_mouseup, :xdo_mouse_up
  alias_class_method :xdo_click, :xdo_click_window
  alias_class_method :xdo_type, :xdo_enter_text_window
  alias_class_method :xdo_keysequence, :xdo_send_keysequence_window
  alias_class_method :xdo_keysequence_down, :xdo_send_keysequence_window_down
  alias_class_method :xdo_keysequence_up, :xdo_send_keysequence_window_up

end  # module XDo::FFILib

end  # namespace XDo
