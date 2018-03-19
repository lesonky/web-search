# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google        "https://www.google.com/search?q="
    bing          "https://www.bing.com/search?q="
    duckduckgo    "https://www.duckduckgo.com/?q="
    github        "https://github.com/search?q="
    baidu         "https://www.baidu.com/s?wd="
    zhihu         "https://www.zhihu.com/search?type=content&q="
    mdn           "https://developer.mozilla.org/zh-CN/search?q="
    readfree      "http://readfree.me/search/?q="
    book          "https://book.douban.com/subject_search?search_text="
    stackoverflow "https://stackoverflow.com/search?q="
    segmentfault  "https://segmentfault.com/search?q="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  # for WSL use,you can first `export BROWSER="chrome.exe"` then
  # $BROWSER "$url"
  open_command "$url"
}


alias bing='web_search bing'
alias google='web_search google'
alias ddg='web_search duckduckgo'
alias github='web_search github'
alias baidu='web_search baidu'

alias zhihu='web_search zhihu'
alias mdn='web_search mdn'
alias readfree='web_search readfree'
alias book='web_search book'
alias sof='web_search stackoverflow'
alias sf='web_search segmentfault'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'
alias web-search-config='code ~/Users/jacshao/.oh-my-zsh/custom/plugins/web-search.plugin.zsh'
