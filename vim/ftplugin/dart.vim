setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=120
setlocal expandtab

call ale#linter#Define('dart', {
\   'name': 'dart-language-server',
\   'lsp': 'stdio',
\   'executable': 'dart',
\   'command': '%e $DART_SDK/bin/snapshots/analysis_server.dart.snapshot --lsp',
\   'project_root': '/Users/matthi/zhaw/p7/bemyhelp-app',
\})

let b:ale_linters = ['dart-language-server', 'dartanalyzer']
let b:ale_fixers = ['dartfmt']
