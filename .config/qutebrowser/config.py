config.load_autoconfig(False)
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.auto_save.session = True
c.colors.webpage.darkmode.enabled = True
c.content.cookies.accept = 'all'
c.content.proxy = 'http://127.0.0.1:8080'
c.statusbar.show = 'never'
c.tabs.last_close = 'close'
c.tabs.max_width = 120
c.tabs.show = 'switching'
c.url.default_page = 'https://google.com'
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
c.url.start_pages = ['https://google.com']
