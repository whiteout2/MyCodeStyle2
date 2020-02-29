document.addEventListener("DOMContentLoaded", function(event) {
    // This will be sent to the extension code
    safari.extension.dispatchMessage("Hello World!");
    
    // TEST: Show messagebox from javascript
    // This triggers from onLoad() from a wikipedia.org page.
    // From within this injected script we can e.g. set the styles from page elements
    // But Apple make Safari App Extension development almost impossible without a Developer account:
    // Every time we change something to the code (even a comment), the extension loses its permissions in Safari and
    // we have to rebuild/reinstall/Allow Unsigned Extensions to get Safari to allow the extension. Sucks.
    // More sucks: we cannot set the Scheme to MyCodeStyle2 Extension and run the extension directly in Safari because
    // Safari will not allow unsigned code. Even when we set Allow Unsigned Extensions afterwards.
    // Also we seem to be getting no NSLog messages from the extension in Console.app
    // OKOK: it is a little less painful: everytime we change the code we have to Clean the build folder, Run and then Safari
    // will still allow the extension.
    alert("Hi2! From JS");
                          
    // TEST:
    //var _html = document.getElementsByTagName('pre')[0].innerHTML;
    //console.log(_html);
    //document.getElementsByTagName('pre')[0].innerHTML = "This code is colored by MyCodeStyle2<p>" + _html;
                          
    // Wikipedia: loop
    var elements = document.getElementsByTagName('pre');
    for (var i=0; i<elements.length; i++) {
        //doSomething(elements[i]);
        var _html = document.getElementsByTagName('pre')[i].innerHTML;
        //console.log(_html);
        document.getElementsByTagName('pre')[i].innerHTML = "<span class='c1'>// This code is colored by MyCodeStyle2</span><p>" + _html;
    }
                          
    // Github
     var newHTML = "<pre><span class='mcs2' style='color:green'>// This code is colored by MyCodeStyle2</span></pre>";

     // This is for css files
     var element = document.querySelector('div.file-header');
     if (element) element.insertAdjacentHTML("afterend", newHTML);
                          
     // SHIT: the script gets aborted when we do not have a div.file-header and we never get here. Our selector was OK.
     // Must use if () to check for non-null
     // NOTE: multiclass selector uses . between classes
     var element2 = document.querySelector('div.Box-header.py-2.d-flex.flex-column.flex-shrink-0.flex-md-row.flex-md-items-center');
     if (element2) element2.insertAdjacentHTML("afterend", newHTML);
     //document.querySelector('.Box-header.py-2.d-flex.flex-column.flex-shrink-0.flex-md-row.flex-md-items-center').innerHTML = "QQQ";
                          
                          
});
