class EmptyStack{
  return_head() : String {{abort(); "";}};
  return_tail() : EmptyStack {{abort(); self;}};
  isNil() : Bool{true};
  add(head:String) : EmptyStack {
    (new Stack).init(head, self)
  };
};


class Stack inherits EmptyStack{
  head : String;
  tail : EmptyStack;
  return_head() : String {head};
  return_tail() : EmptyStack {tail};
  isNil() : Bool {false};

  init(h:String, t:EmptyStack) : EmptyStack{
    {
      head <- h;
      tail <- t;
      self;
    }
  };
};


class Main inherits IO{
  commands : EmptyStack;
  new_command : String;

  print_stack(stack: EmptyStack) : Object{
    if stack.isNil() then out_string(">")
    else{
      out_string(stack.return_head());
      out_string("\n");
      print_stack(stack.return_tail());
      }
    fi
    };
  main() : Object{
    {
      commands <- new EmptyStack.add("o");
      while(not new_command = "x") loop{
        out_string(">");
        new_command <- in_string();
        commands <- commands.add(new_command);
      }
      pool;
      print_stack(commands);
    }
  };
};
