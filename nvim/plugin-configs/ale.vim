let g:ale_completion_enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_list_window_size = 5
let g:ale_fixers = {
  \'*':      ['remove_trailing_lines', 'trim_whitespace'],
  \'python': ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'autopep8', 'isort'],
  \'tf':     ['remove_trailing_lines', 'trim_whitespace', 'terraform'],
  \'json':   ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
  \'yaml':   ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
  \'ruby':   ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'rufo'],
  \'go':     ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_linters = {
  \'dockerfile': ['hadolint'],
  \'python':     ['pylint'],
  \'tf':         ['tflint'],
  \'ruby':       ['reek', 'standardrb', 'rubocop'],
  \'yaml':       ['yamllint']
\}
