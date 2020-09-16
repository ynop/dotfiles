setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=120
setlocal expandtab

" https://github.com/dense-analysis/ale/pull/3069
function! dart#GetProjectRoot(buffer) abort
    let l:pubspec = ale#path#FindNearestFile(a:buffer, 'pubspec.yaml')
    return !empty(l:pubspec) ? fnamemodify(l:pubspec, ':h:h') : ''
endfunction

call ale#linter#Define('dart', {
\   'name': 'dart-language-server',
\   'lsp': 'stdio',
\   'executable': 'dart',
\   'command': '%e $DART_SDK/bin/snapshots/analysis_server.dart.snapshot --lsp',
\   'project_root': function('dart#GetProjectRoot'),
\})

let b:ale_linters = ['dart-language-server', 'dartanalyzer']
let b:ale_fixers = ['dartfmt']
