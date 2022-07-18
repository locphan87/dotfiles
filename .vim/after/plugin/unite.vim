if exists('*unite#custom#profile')
  call unite#custom#profile('source/vim_bookmarks', 'context', {
    \   'winheight': 13,
    \   'direction': 'botright',
    \   'start_insert': 0,
    \   'keep_focus': 1,
    \   'no_quit': 1,
    \ })
endif
