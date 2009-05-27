if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim
exec "Snippet sub %=============================================================================<CR>\\subsection{".st."name".et."}<CR>\\label{".st."label".et."}<CR>%=============================================================================<CR>".st.et
exec "Snippet ssub %-----------------------------------------------------------------------------<CR>\\subsection{".st."name".et."}<CR>\\label{".st."label".et."}<CR>%-----------------------------------------------------------------------------<CR>".st.et
exec "Snippet $$ \\[<CR>".st.et."<CR>\\]<CR>".st.et
exec "Snippet itd \\item[".st."desc".et."] ".st.et
exec "Snippet sec %#############################################################################<CR>\\section{".st."name".et."}<CR>\\label{".st."label".et."}<CR>%#############################################################################<CR>".st.et
exec "Snippet fig \\begin{figure}\\begin{center}<CR>\t\\includegraphic[width=".st."width".et."]{". st ."path".et."}<CR>\\caption{".st."caption".et."}<CR>\\label{".st."label".et."}<CR>\\end{center}\\end{figure}<CR>".st.et
