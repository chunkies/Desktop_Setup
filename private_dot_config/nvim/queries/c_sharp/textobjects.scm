;; Treat method declarations as functions
(method_declaration) @function.outer
(method_declaration
  body: (block) @function.inner)

(class_declaration) @class.outer
(class_declaration
  body: (declaration_list) @class.inner)

(parameter) @parameter.inner
(parameter_list) @parameter.outer

