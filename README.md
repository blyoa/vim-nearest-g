# vim-nearest-g

vim-nearest-g is a plugin to jump to nearest \<count\> line from cursor.
\<count\> matches from lower digits.

## Example
When your text has 10000 lines,

1. if your cursor is in line 123,
    - 1<Plug>(nearest-g:neighbor) makes your cursor jump to line 121.
    - 9<Plug>(nearest-g:neighbor) makes your cursor jump to line 119.
    - 10<Plug>(nearest-g:neighbor) makes your cursor jump to line 110.
    - 90<Plug>(nearest-g:neighbor) makes your cursor jump to line 90.
2. if your cursor is in line 1234,
    - 1<Plug>(nearest-g:neighbor) makes your cursor jump to line 1231.
    - 9<Plug>(nearest-g:neighbor) makes your cursor jump to line 1229.
    - 10<Plug>(nearest-g:neighbor) makes your cursor jump to line 1210.
    - 90<Plug>(nearest-g:neighbor) makes your cursor jump to line 1190.
    - 100<Plug>(nearest-g:neighbor) makes your cursor jump to line 1100.
    - 900<Plug>(nearest-g:neighbor) makes your cursor jump to line 900.

## Provided key mappings

```VimL
<Plug>(nearest-g:neighbor)
<Plug>(nearest-g:backward)
<Plug>(nearest-g:forward)
<Plug>(nearest-g:visible-neighbor)
<Plug>(nearest-g:visible-backward)
<Plug>(nearest-g:visible-forward)
```

## License
MIT

## Acknowledgement
This plugin inspired by 
[this code](http://lingr.com/room/vim/archives/2015/09/05#message-22407925)

