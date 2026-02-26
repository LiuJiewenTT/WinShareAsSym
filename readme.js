function add_script(src) {
    var script = document.createElement('script');
    script.src = src;
    script.async = false;
    document.head.appendChild(script);
}

// add_script('https://code.jquery.com/jquery-3.6.0.min.js');
// add_script('docs/res/js/go_to_top.js'); 

function loadScript_Promise(src, async_flag=true) {
  return new Promise((resolve, reject) => {
    const script = document.createElement('script');
    script.src = src;
    script.async = async_flag;
    script.onload = () => resolve(script);
    script.onerror = () => reject(new Error(`Failed to load script: ${src}`));
    document.head.appendChild(script);
  });
}

async function await_add_scripts() {
    await loadScript_Promise('https://code.jquery.com/jquery-3.6.0.min.js');
    loadScript_Promise('docs/res/js/go_to_top.js');
    await loadScript_Promise('docs/res/js/github-markdown-alert-reproduce.js');
}

function dom_edit() {
    process_blockquote_to_markdown_alert();
    // document.body.prepend(process_blockquote_to_markdown_alert);
}

(async () => {
    await await_add_scripts();
    dom_edit();
})();

