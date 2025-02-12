!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof exports?e(require("jquery")):e(jQuery)}(function(m){"use strict";var a;m.support.htmlMenuitem="HTMLMenuItemElement"in window,m.support.htmlCommand="HTMLCommandElement"in window,m.support.eventSelectstart="onselectstart"in document.documentElement,m.ui&&m.widget||(m.cleanData=(a=m.cleanData,function(e){var t,n,o;for(o=0;null!=e[o];o++){n=e[o];try{(t=m._data(n,"events"))&&t.remove&&m(n).triggerHandler("remove")}catch(e){}}a(e)}));var c=null,d=!1,p=m(window),f=0,h={},x={},v={},g={selector:null,appendTo:null,trigger:"right",autoHide:!1,delay:200,reposition:!0,hideOnSecondTrigger:!1,selectableSubMenu:!1,classNames:{hover:"context-menu-hover",disabled:"context-menu-disabled",visible:"context-menu-visible",notSelectable:"context-menu-not-selectable",icon:"context-menu-icon",iconEdit:"context-menu-icon-edit",iconCut:"context-menu-icon-cut",iconCopy:"context-menu-icon-copy",iconPaste:"context-menu-icon-paste",iconDelete:"context-menu-icon-delete",iconAdd:"context-menu-icon-add",iconQuit:"context-menu-icon-quit",iconLoadingClass:"context-menu-icon-loading"},determinePosition:function(e){if(m.ui&&m.ui.position)e.css("display","block").position({my:"center top",at:"center bottom",of:this,offset:"0 5",collision:"fit"}).css("display","none");else{var t=this.offset();t.top+=this.outerHeight(),t.left+=this.outerWidth()/2-e.outerWidth()/2,e.css(t)}},position:function(e,t,n){var o;if(t||n){if("maintain"===t&&"maintain"===n)o=e.$menu.position();else{var a=e.$menu.offsetParent().offset();o={top:n-a.top,left:t-a.left}}var s=p.scrollTop()+p.height(),i=p.scrollLeft()+p.width(),c=e.$menu.outerHeight(),l=e.$menu.outerWidth();o.top+c>s&&(o.top-=c),o.top<0&&(o.top=0),o.left+l>i&&(o.left-=l),o.left<0&&(o.left=0),e.$menu.css(o)}else e.determinePosition.call(this,e.$menu)},positionSubmenu:function(e){if(void 0!==e)if(m.ui&&m.ui.position)e.css("display","block").position({my:"left top-5",at:"right top",of:this,collision:"flipfit fit"}).css("display","");else{var t={top:-9,left:this.outerWidth()-5};e.css(t)}},zIndex:1,animation:{duration:50,show:"slideDown",hide:"slideUp"},events:{show:m.noop,hide:m.noop,activated:m.noop},callback:null,items:{}},s={timer:null,pageX:null,pageY:null},b={abortevent:function(e){e.preventDefault(),e.stopImmediatePropagation()},contextmenu:function(e){var t=m(this);if("right"===e.data.trigger&&(e.preventDefault(),e.stopImmediatePropagation()),!("right"!==e.data.trigger&&"demand"!==e.data.trigger&&e.originalEvent||!(void 0===e.mouseButton||!e.data||"left"===e.data.trigger&&0===e.mouseButton||"right"===e.data.trigger&&2===e.mouseButton)||t.hasClass("context-menu-active")||t.hasClass("context-menu-disabled"))){if(c=t,e.data.build){var n=e.data.build(c,e);if(!1===n)return;if(e.data=m.extend(!0,{},g,e.data,n||{}),!e.data.items||m.isEmptyObject(e.data.items))throw window.console&&(console.error||console.log).call(console,"No items specified to show in contextMenu"),new Error("No Items specified");e.data.$trigger=c,$.create(e.data)}$.show.call(t,e.data,e.pageX,e.pageY)}},click:function(e){e.preventDefault(),e.stopImmediatePropagation(),m(this).trigger(m.Event("contextmenu",{data:e.data,pageX:e.pageX,pageY:e.pageY}))},mousedown:function(e){var t=m(this);c&&c.length&&!c.is(t)&&c.data("contextMenu").$menu.trigger("contextmenu:hide"),2===e.button&&(c=t.data("contextMenuActive",!0))},mouseup:function(e){var t=m(this);t.data("contextMenuActive")&&c&&c.length&&c.is(t)&&!t.hasClass("context-menu-disabled")&&(e.preventDefault(),e.stopImmediatePropagation(),(c=t).trigger(m.Event("contextmenu",{data:e.data,pageX:e.pageX,pageY:e.pageY}))),t.removeData("contextMenuActive")},mouseenter:function(e){var t=m(this),n=m(e.relatedTarget),o=m(document);n.is(".context-menu-list")||n.closest(".context-menu-list").length||c&&c.length||(s.pageX=e.pageX,s.pageY=e.pageY,s.data=e.data,o.on("mousemove.contextMenuShow",b.mousemove),s.timer=setTimeout(function(){s.timer=null,o.off("mousemove.contextMenuShow"),(c=t).trigger(m.Event("contextmenu",{data:s.data,pageX:s.pageX,pageY:s.pageY}))},e.data.delay))},mousemove:function(e){s.pageX=e.pageX,s.pageY=e.pageY},mouseleave:function(e){var t=m(e.relatedTarget);if(!t.is(".context-menu-list")&&!t.closest(".context-menu-list").length){try{clearTimeout(s.timer)}catch(e){}s.timer=null}},layerClick:function(a){var s,i,c=m(this).data("contextMenuRoot"),l=a.button,r=a.pageX,u=a.pageY,d=void 0===r;a.preventDefault(),setTimeout(function(){if(d)null!=c&&null!==c.$menu&&void 0!==c.$menu&&c.$menu.trigger("contextmenu:hide");else{var e,t="left"===c.trigger&&0===l||"right"===c.trigger&&2===l;if(document.elementFromPoint&&c.$layer){if(c.$layer.hide(),(s=document.elementFromPoint(r-p.scrollLeft(),u-p.scrollTop())).isContentEditable){var n=document.createRange(),o=window.getSelection();n.selectNode(s),n.collapse(!0),o.removeAllRanges(),o.addRange(n)}m(s).trigger(a),c.$layer.show()}if(c.hideOnSecondTrigger&&t&&null!==c.$menu&&void 0!==c.$menu)c.$menu.trigger("contextmenu:hide");else{if(c.reposition&&t)if(document.elementFromPoint){if(c.$trigger.is(s))return void c.position.call(c.$trigger,c,r,u)}else if(i=c.$trigger.offset(),e=m(window),i.top+=e.scrollTop(),i.top<=a.pageY&&(i.left+=e.scrollLeft(),i.left<=a.pageX&&(i.bottom=i.top+c.$trigger.outerHeight(),i.bottom>=a.pageY&&(i.right=i.left+c.$trigger.outerWidth(),i.right>=a.pageX))))return void c.position.call(c.$trigger,c,r,u);s&&t&&c.$trigger.one("contextmenu:hidden",function(){m(s).contextMenu({x:r,y:u,button:l})}),null!=c&&null!==c.$menu&&void 0!==c.$menu&&c.$menu.trigger("contextmenu:hide")}}},50)},keyStop:function(e,t){t.isInput||e.preventDefault(),e.stopPropagation()},key:function(e){var t={};c&&(t=c.data("contextMenu")||{}),void 0===t.zIndex&&(t.zIndex=0);var n=0,o=function(e){""!==e.style.zIndex?n=e.style.zIndex:null!==e.offsetParent&&void 0!==e.offsetParent?o(e.offsetParent):null!==e.parentElement&&void 0!==e.parentElement&&o(e.parentElement)};if(o(e.target),!(t.$menu&&parseInt(n,10)>parseInt(t.$menu.css("zIndex"),10))){switch(e.keyCode){case 9:case 38:if(b.keyStop(e,t),t.isInput){if(9===e.keyCode&&e.shiftKey)return e.preventDefault(),t.$selected&&t.$selected.find("input, textarea, select").blur(),void(null!==t.$menu&&void 0!==t.$menu&&t.$menu.trigger("prevcommand"));if(38===e.keyCode&&"checkbox"===t.$selected.find("input, textarea, select").prop("type"))return void e.preventDefault()}else if(9!==e.keyCode||e.shiftKey)return void(null!==t.$menu&&void 0!==t.$menu&&t.$menu.trigger("prevcommand"));break;case 40:if(b.keyStop(e,t),!t.isInput)return void(null!==t.$menu&&void 0!==t.$menu&&t.$menu.trigger("nextcommand"));if(9===e.keyCode)return e.preventDefault(),t.$selected&&t.$selected.find("input, textarea, select").blur(),void(null!==t.$menu&&void 0!==t.$menu&&t.$menu.trigger("nextcommand"));if(40===e.keyCode&&"checkbox"===t.$selected.find("input, textarea, select").prop("type"))return void e.preventDefault();break;case 37:if(b.keyStop(e,t),t.isInput||!t.$selected||!t.$selected.length)break;if(!t.$selected.parent().hasClass("context-menu-root")){var a=t.$selected.parent().parent();return t.$selected.trigger("contextmenu:blur"),void(t.$selected=a)}break;case 39:if(b.keyStop(e,t),t.isInput||!t.$selected||!t.$selected.length)break;var s=t.$selected.data("contextMenu")||{};if(s.$menu&&t.$selected.hasClass("context-menu-submenu"))return t.$selected=null,s.$selected=null,void s.$menu.trigger("nextcommand");break;case 35:case 36:return t.$selected&&t.$selected.find("input, textarea, select").length?void 0:((t.$selected&&t.$selected.parent()||t.$menu).children(":not(."+t.classNames.disabled+", ."+t.classNames.notSelectable+")")[36===e.keyCode?"first":"last"]().trigger("contextmenu:focus"),void e.preventDefault());case 13:if(b.keyStop(e,t),t.isInput){if(t.$selected&&!t.$selected.is("textarea, select"))return void e.preventDefault();break}return void(void 0!==t.$selected&&null!==t.$selected&&t.$selected.trigger("mouseup"));case 32:case 33:case 34:return void b.keyStop(e,t);case 27:return b.keyStop(e,t),void(null!==t.$menu&&void 0!==t.$menu&&t.$menu.trigger("contextmenu:hide"));default:var i=String.fromCharCode(e.keyCode).toUpperCase();if(t.accesskeys&&t.accesskeys[i])return void t.accesskeys[i].$node.trigger(t.accesskeys[i].$menu?"contextmenu:focus":"mouseup")}e.stopPropagation(),void 0!==t.$selected&&null!==t.$selected&&t.$selected.trigger(e)}},prevItem:function(e){e.stopPropagation();var t=m(this).data("contextMenu")||{},n=m(this).data("contextMenuRoot")||{};if(t.$selected){var o=t.$selected;(t=t.$selected.parent().data("contextMenu")||{}).$selected=o}for(var a=t.$menu.children(),s=t.$selected&&t.$selected.prev().length?t.$selected.prev():a.last(),i=s;s.hasClass(n.classNames.disabled)||s.hasClass(n.classNames.notSelectable)||s.is(":hidden");)if((s=s.prev().length?s.prev():a.last()).is(i))return;t.$selected&&b.itemMouseleave.call(t.$selected.get(0),e),b.itemMouseenter.call(s.get(0),e);var c=s.find("input, textarea, select");c.length&&c.focus()},nextItem:function(e){e.stopPropagation();var t=m(this).data("contextMenu")||{},n=m(this).data("contextMenuRoot")||{};if(t.$selected){var o=t.$selected;(t=t.$selected.parent().data("contextMenu")||{}).$selected=o}for(var a=t.$menu.children(),s=t.$selected&&t.$selected.next().length?t.$selected.next():a.first(),i=s;s.hasClass(n.classNames.disabled)||s.hasClass(n.classNames.notSelectable)||s.is(":hidden");)if((s=s.next().length?s.next():a.first()).is(i))return;t.$selected&&b.itemMouseleave.call(t.$selected.get(0),e),b.itemMouseenter.call(s.get(0),e);var c=s.find("input, textarea, select");c.length&&c.focus()},focusInput:function(){var e=m(this).closest(".context-menu-item"),t=e.data(),n=t.contextMenu,o=t.contextMenuRoot;o.$selected=n.$selected=e,o.isInput=n.isInput=!0},blurInput:function(){var e=m(this).closest(".context-menu-item").data(),t=e.contextMenu;e.contextMenuRoot.isInput=t.isInput=!1},menuMouseenter:function(){m(this).data().contextMenuRoot.hovering=!0},menuMouseleave:function(e){var t=m(this).data().contextMenuRoot;t.$layer&&t.$layer.is(e.relatedTarget)&&(t.hovering=!1)},itemMouseenter:function(e){var t=m(this),n=t.data(),o=n.contextMenu,a=n.contextMenuRoot;a.hovering=!0,e&&a.$layer&&a.$layer.is(e.relatedTarget)&&(e.preventDefault(),e.stopImmediatePropagation()),(o.$menu?o:a).$menu.children("."+a.classNames.hover).trigger("contextmenu:blur").children(".hover").trigger("contextmenu:blur"),t.hasClass(a.classNames.disabled)||t.hasClass(a.classNames.notSelectable)?o.$selected=null:t.trigger("contextmenu:focus")},itemMouseleave:function(e){var t=m(this),n=t.data(),o=n.contextMenu,a=n.contextMenuRoot;if(a!==o&&a.$layer&&a.$layer.is(e.relatedTarget))return void 0!==a.$selected&&null!==a.$selected&&a.$selected.trigger("contextmenu:blur"),e.preventDefault(),e.stopImmediatePropagation(),void(a.$selected=o.$selected=o.$node);o&&o.$menu&&o.$menu.hasClass("context-menu-visible")||t.trigger("contextmenu:blur")},itemClick:function(e){var t,n=m(this),o=n.data(),a=o.contextMenu,s=o.contextMenuRoot,i=o.contextMenuKey;if(!(!a.items[i]||n.is("."+s.classNames.disabled+", .context-menu-separator, ."+s.classNames.notSelectable)||n.is(".context-menu-submenu")&&!1===s.selectableSubMenu)){if(e.preventDefault(),e.stopImmediatePropagation(),m.isFunction(a.callbacks[i])&&Object.prototype.hasOwnProperty.call(a.callbacks,i))t=a.callbacks[i];else{if(!m.isFunction(s.callback))return;t=s.callback}!1!==t.call(s.$trigger,i,s,e)?s.$menu.trigger("contextmenu:hide"):s.$menu.parent().length&&$.update.call(s.$trigger,s)}},inputClick:function(e){e.stopImmediatePropagation()},hideMenu:function(e,t){var n=m(this).data("contextMenuRoot");$.hide.call(n.$trigger,n,t&&t.force)},focusItem:function(e){e.stopPropagation();var t=m(this),n=t.data(),o=n.contextMenu,a=n.contextMenuRoot;t.hasClass(a.classNames.disabled)||t.hasClass(a.classNames.notSelectable)||(t.addClass([a.classNames.hover,a.classNames.visible].join(" ")).parent().find(".context-menu-item").not(t).removeClass(a.classNames.visible).filter("."+a.classNames.hover).trigger("contextmenu:blur"),o.$selected=a.$selected=t,o&&o.$node&&o.$node.hasClass("context-menu-submenu")&&o.$node.addClass(a.classNames.hover),o.$node&&a.positionSubmenu.call(o.$node,o.$menu))},blurItem:function(e){e.stopPropagation();var t=m(this),n=t.data(),o=n.contextMenu,a=n.contextMenuRoot;o.autoHide&&t.removeClass(a.classNames.visible),t.removeClass(a.classNames.hover),o.$selected=null}},$={show:function(n,e,t){var o=m(this),a={};if(m("#context-menu-layer").trigger("mousedown"),n.$trigger=o,!1!==n.events.show.call(o,n))if(!1!==$.update.call(o,n)){if(n.position.call(o,n,e,t),n.zIndex){var s=n.zIndex;"function"==typeof n.zIndex&&(s=n.zIndex.call(o,n)),a.zIndex=function(e){for(var t=0,n=e;t=Math.max(t,parseInt(n.css("z-index"),10)||0),(n=n.parent())&&n.length&&!(-1<"html body".indexOf(n.prop("nodeName").toLowerCase())););return t}(o)+s}$.layer.call(n.$menu,n,a.zIndex),n.$menu.find("ul").css("zIndex",a.zIndex+1),n.$menu.css(a)[n.animation.show](n.animation.duration,function(){o.trigger("contextmenu:visible"),$.activated(n),n.events.activated(n)}),o.data("contextMenu",n).addClass("context-menu-active"),m(document).off("keydown.contextMenu").on("keydown.contextMenu",b.key),n.autoHide&&m(document).on("mousemove.contextMenuAutoHide",function(e){var t=o.offset();t.right=t.left+o.outerWidth(),t.bottom=t.top+o.outerHeight(),!n.$layer||n.hovering||e.pageX>=t.left&&e.pageX<=t.right&&e.pageY>=t.top&&e.pageY<=t.bottom||setTimeout(function(){n.hovering||null===n.$menu||void 0===n.$menu||n.$menu.trigger("contextmenu:hide")},50)})}else c=null;else c=null},hide:function(t,e){var n=m(this);if(t||(t=n.data("contextMenu")||{}),e||!t.events||!1!==t.events.hide.call(n,t)){if(n.removeData("contextMenu").removeClass("context-menu-active"),t.$layer){setTimeout((o=t.$layer,function(){o.remove()}),10);try{delete t.$layer}catch(e){t.$layer=null}}var o;c=null,t.$menu.find("."+t.classNames.hover).trigger("contextmenu:blur"),t.$selected=null,t.$menu.find("."+t.classNames.visible).removeClass(t.classNames.visible),m(document).off(".contextMenuAutoHide").off("keydown.contextMenu"),t.$menu&&t.$menu[t.animation.hide](t.animation.duration,function(){t.build&&(t.$menu.remove(),m.each(t,function(e){switch(e){case"ns":case"selector":case"build":case"trigger":return!0;default:t[e]=void 0;try{delete t[e]}catch(e){}return!0}})),setTimeout(function(){n.trigger("contextmenu:hidden")},10)})}},create:function(r,u){function d(e){var t=m("<span></span>");if(e._accesskey)e._beforeAccesskey&&t.append(document.createTextNode(e._beforeAccesskey)),m("<span></span>").addClass("context-menu-accesskey").text(e._accesskey).appendTo(t),e._afterAccesskey&&t.append(document.createTextNode(e._afterAccesskey));else if(e.isHtmlName){if(void 0!==e.accesskey)throw new Error("accesskeys are not compatible with HTML names and cannot be used together in the same item");t.html(e.name)}else t.text(e.name);return t}void 0===u&&(u=r),r.$menu=m('<ul class="context-menu-list"></ul>').addClass(r.className||"").data({contextMenu:r,contextMenuRoot:u}),m.each(["callbacks","commands","inputs"],function(e,t){r[t]={},u[t]||(u[t]={})}),u.accesskeys||(u.accesskeys={}),m.each(r.items,function(n,o){var e=m('<li class="context-menu-item"></li>').addClass(o.className||""),t=null,a=null;if(e.on("click",m.noop),"string"!=typeof o&&"cm_separator"!==o.type||(o={type:"cm_seperator"}),o.$node=e.data({contextMenu:r,contextMenuRoot:u,contextMenuKey:n}),void 0!==o.accesskey)for(var s,i=function(e){for(var t,n=e.split(/\s+/),o=[],a=0;t=n[a];a++)t=t.charAt(0).toUpperCase(),o.push(t);return o}(o.accesskey),c=0;s=i[c];c++)if(!u.accesskeys[s]){var l=(u.accesskeys[s]=o).name.match(new RegExp("^(.*?)("+s+")(.*)$","i"));l&&(o._beforeAccesskey=l[1],o._accesskey=l[2],o._afterAccesskey=l[3]);break}if(o.type&&v[o.type])v[o.type].call(e,o,r,u),m.each([r,u],function(e,t){t.commands[n]=o,!m.isFunction(o.callback)||void 0!==t.callbacks[n]&&void 0!==r.type||(t.callbacks[n]=o.callback)});else{switch("cm_seperator"===o.type?e.addClass("context-menu-separator "+u.classNames.notSelectable):"html"===o.type?e.addClass("context-menu-html "+u.classNames.notSelectable):"sub"!==o.type&&o.type?(t=m("<label></label>").appendTo(e),d(o).appendTo(t),e.addClass("context-menu-input"),r.hasTypes=!0,m.each([r,u],function(e,t){t.commands[n]=o,t.inputs[n]=o})):o.items&&(o.type="sub"),o.type){case"cm_seperator":break;case"text":a=m('<input type="text" value="1" name="" />').attr("name","context-menu-input-"+n).val(o.value||"").appendTo(t);break;case"textarea":a=m('<textarea name=""></textarea>').attr("name","context-menu-input-"+n).val(o.value||"").appendTo(t),o.height&&a.height(o.height);break;case"checkbox":a=m('<input type="checkbox" value="1" name="" />').attr("name","context-menu-input-"+n).val(o.value||"").prop("checked",!!o.selected).prependTo(t);break;case"radio":a=m('<input type="radio" value="1" name="" />').attr("name","context-menu-input-"+o.radio).val(o.value||"").prop("checked",!!o.selected).prependTo(t);break;case"select":a=m('<select name=""></select>').attr("name","context-menu-input-"+n).appendTo(t),o.options&&(m.each(o.options,function(e,t){m("<option></option>").val(e).text(t).appendTo(a)}),a.val(o.selected));break;case"sub":d(o).appendTo(e),o.appendTo=o.$node,e.data("contextMenu",o).addClass("context-menu-submenu"),o.callback=null,"function"==typeof o.items.then?$.processPromises(o,u,o.items):$.create(o,u);break;case"html":m(o.html).appendTo(e);break;default:m.each([r,u],function(e,t){t.commands[n]=o,!m.isFunction(o.callback)||void 0!==t.callbacks[n]&&void 0!==r.type||(t.callbacks[n]=o.callback)}),d(o).appendTo(e)}o.type&&"sub"!==o.type&&"html"!==o.type&&"cm_seperator"!==o.type&&(a.on("focus",b.focusInput).on("blur",b.blurInput),o.events&&a.on(o.events,r)),o.icon&&(m.isFunction(o.icon)?o._icon=o.icon.call(this,this,e,n,o):"string"!=typeof o.icon||"fab "!==o.icon.substring(0,4)&&"fas "!==o.icon.substring(0,4)&&"far "!==o.icon.substring(0,4)&&"fal "!==o.icon.substring(0,4)?"string"==typeof o.icon&&"fa-"===o.icon.substring(0,3)?o._icon=u.classNames.icon+" "+u.classNames.icon+"--fa fa "+o.icon:o._icon=u.classNames.icon+" "+u.classNames.icon+"-"+o.icon:(e.addClass(u.classNames.icon+" "+u.classNames.icon+"--fa5"),o._icon=m('<i class="'+o.icon+'"></i>')),"string"==typeof o._icon?e.addClass(o._icon):e.prepend(o._icon))}o.$input=a,o.$label=t,e.appendTo(r.$menu),!r.hasTypes&&m.support.eventSelectstart&&e.on("selectstart.disableTextSelect",b.abortevent)}),r.$node||r.$menu.css("display","none").addClass("context-menu-root"),r.$menu.appendTo(r.appendTo||document.body)},resize:function(e,t){var n;e.css({position:"absolute",display:"block"}),e.data("width",(n=e.get(0)).getBoundingClientRect?Math.ceil(n.getBoundingClientRect().width):e.outerWidth()+1),e.css({position:"static",minWidth:"0px",maxWidth:"100000px"}),e.find("> li > ul").each(function(){$.resize(m(this),!0)}),t||e.find("ul").addBack().css({position:"",display:"",minWidth:"",maxWidth:""}).outerWidth(function(){return m(this).data("width")})},update:function(i,c){var l=this;void 0===c&&(c=i,$.resize(i.$menu));var r=!1;return i.$menu.children().each(function(){var e,t=m(this),n=t.data("contextMenuKey"),o=i.items[n],a=m.isFunction(o.disabled)&&o.disabled.call(l,n,c)||!0===o.disabled;if((e=m.isFunction(o.visible)?o.visible.call(l,n,c):void 0===o.visible||!0===o.visible)&&(r=!0),t[e?"show":"hide"](),t[a?"addClass":"removeClass"](c.classNames.disabled),m.isFunction(o.icon)){t.removeClass(o._icon);var s=o.icon.call(this,l,t,n,o);"string"==typeof s?t.addClass(s):t.prepend(s)}if(o.type)switch(t.find("input, select, textarea").prop("disabled",a),o.type){case"text":case"textarea":o.$input.val(o.value||"");break;case"checkbox":case"radio":o.$input.val(o.value||"").prop("checked",!!o.selected);break;case"select":o.$input.val((0===o.selected?"0":o.selected)||"")}o.$menu&&($.update.call(l,o,c)&&(r=!0))}),r},layer:function(e,t){var n=e.$layer=m('<div id="context-menu-layer"></div>').css({height:p.height(),width:p.width(),display:"block",position:"fixed","z-index":t,top:0,left:0,opacity:0,filter:"alpha(opacity=0)","background-color":"#000"}).data("contextMenuRoot",e).insertBefore(this).on("contextmenu",b.abortevent).on("mousedown",b.layerClick);return void 0===document.body.style.maxWidth&&n.css({position:"absolute",height:m(document).height()}),n},processPromises:function(e,t,n){function o(e,t,n){void 0===n?(n={error:{name:"No items and no error item",icon:"context-menu-icon context-menu-icon-quit"}},window.console&&(console.error||console.log).call(console,'When you reject a promise, provide an "items" object, equal to normal sub-menu items')):"string"==typeof n&&(n={error:{name:n}}),a(e,t,n)}function a(e,t,n){void 0!==t.$menu&&t.$menu.is(":visible")&&(e.$node.removeClass(t.classNames.iconLoadingClass),e.items=n,$.create(e,t,!0),$.update(e,t),t.positionSubmenu.call(e.$node,e.$menu))}e.$node.addClass(t.classNames.iconLoadingClass),n.then(function(e,t,n){void 0===n&&o(void 0),a(e,t,n)}.bind(this,e,t),o.bind(this,e,t))},activated:function(e){var t=e.$menu,n=t.offset(),o=m(window).height(),a=m(window).scrollTop(),s=t.height();o<s?t.css({height:o+"px","overflow-x":"hidden","overflow-y":"auto",top:a+"px"}):(n.top<a||n.top+s>a+o)&&t.css({top:a+"px"})}};function l(e){return e.id&&m('label[for="'+e.id+'"]').val()||e.name}m.fn.contextMenu=function(e){var t=this,n=e;if(0<this.length)if(void 0===e)this.first().trigger("contextmenu");else if(void 0!==e.x&&void 0!==e.y)this.first().trigger(m.Event("contextmenu",{pageX:e.x,pageY:e.y,mouseButton:e.button}));else if("hide"===e){var o=this.first().data("contextMenu")?this.first().data("contextMenu").$menu:null;o&&o.trigger("contextmenu:hide")}else"destroy"===e?m.contextMenu("destroy",{context:this}):m.isPlainObject(e)?(e.context=this,m.contextMenu("create",e)):e?this.removeClass("context-menu-disabled"):e||this.addClass("context-menu-disabled");else m.each(x,function(){this.selector===t.selector&&(n.data=this,m.extend(n.data,{trigger:"demand"}))}),b.contextmenu.call(n.target,n);return this},m.contextMenu=function(e,t){"string"!=typeof e&&(t=e,e="create"),"string"==typeof t?t={selector:t}:void 0===t&&(t={});var n=m.extend(!0,{},g,t||{}),o=m(document),a=o,s=!1;switch(n.context&&n.context.length?(a=m(n.context).first(),n.context=a.get(0),s=!m(n.context).is(document)):n.context=document,e){case"update":if(s)$.update(a);else for(var i in x)x.hasOwnProperty(i)&&$.update(x[i]);break;case"create":if(!n.selector)throw new Error("No selector specified");if(n.selector.match(/.context-menu-(list|item|input)($|\s)/))throw new Error('Cannot bind to selector "'+n.selector+'" as it contains a reserved className');if(!n.build&&(!n.items||m.isEmptyObject(n.items)))throw new Error("No Items specified");if(f++,n.ns=".contextMenu"+f,s||(h[n.selector]=n.ns),(x[n.ns]=n).trigger||(n.trigger="right"),!d){var c="click"===n.itemClickEvent?"click.contextMenu":"mouseup.contextMenu",l={"contextmenu:focus.contextMenu":b.focusItem,"contextmenu:blur.contextMenu":b.blurItem,"contextmenu.contextMenu":b.abortevent,"mouseenter.contextMenu":b.itemMouseenter,"mouseleave.contextMenu":b.itemMouseleave};l[c]=b.itemClick,o.on({"contextmenu:hide.contextMenu":b.hideMenu,"prevcommand.contextMenu":b.prevItem,"nextcommand.contextMenu":b.nextItem,"contextmenu.contextMenu":b.abortevent,"mouseenter.contextMenu":b.menuMouseenter,"mouseleave.contextMenu":b.menuMouseleave},".context-menu-list").on("mouseup.contextMenu",".context-menu-input",b.inputClick).on(l,".context-menu-item"),d=!0}switch(a.on("contextmenu"+n.ns,n.selector,n,b.contextmenu),s&&a.on("remove"+n.ns,function(){m(this).contextMenu("destroy")}),n.trigger){case"hover":a.on("mouseenter"+n.ns,n.selector,n,b.mouseenter).on("mouseleave"+n.ns,n.selector,n,b.mouseleave);break;case"left":a.on("click"+n.ns,n.selector,n,b.click);break;case"touchstart":a.on("touchstart"+n.ns,n.selector,n,b.click)}n.build||$.create(n);break;case"destroy":var r;if(s){var u=n.context;m.each(x,function(e,t){if(!t)return!0;if(!m(u).is(t.selector))return!0;(r=m(".context-menu-list").filter(":visible")).length&&r.data().contextMenuRoot.$trigger.is(m(t.context).find(t.selector))&&r.trigger("contextmenu:hide",{force:!0});try{x[t.ns].$menu&&x[t.ns].$menu.remove(),delete x[t.ns]}catch(e){x[t.ns]=null}return m(t.context).off(t.ns),!0})}else if(n.selector){if(h[n.selector]){(r=m(".context-menu-list").filter(":visible")).length&&r.data().contextMenuRoot.$trigger.is(n.selector)&&r.trigger("contextmenu:hide",{force:!0});try{x[h[n.selector]].$menu&&x[h[n.selector]].$menu.remove(),delete x[h[n.selector]]}catch(e){x[h[n.selector]]=null}o.off(h[n.selector])}}else o.off(".contextMenu .contextMenuAutoHide"),m.each(x,function(e,t){m(t.context).off(t.ns)}),h={},f=0,d=!(x={}),m("#context-menu-layer, .context-menu-list").remove();break;case"html5":(!m.support.htmlCommand&&!m.support.htmlMenuitem||"boolean"==typeof t&&t)&&m('menu[type="context"]').each(function(){this.id&&m.contextMenu({selector:"[contextmenu="+this.id+"]",items:m.contextMenu.fromMenu(this)})}).css("display","none");break;default:throw new Error('Unknown operation "'+e+'"')}return this},m.contextMenu.setInputValues=function(e,n){void 0===n&&(n={}),m.each(e.inputs,function(e,t){switch(t.type){case"text":case"textarea":t.value=n[e]||"";break;case"checkbox":t.selected=!!n[e];break;case"radio":t.selected=(n[t.radio]||"")===t.value;break;case"select":t.selected=n[e]||""}})},m.contextMenu.getInputValues=function(e,n){return void 0===n&&(n={}),m.each(e.inputs,function(e,t){switch(t.type){case"text":case"textarea":case"select":n[e]=t.$input.val();break;case"checkbox":n[e]=t.$input.prop("checked");break;case"radio":t.$input.prop("checked")&&(n[t.radio]=t.value)}}),n},m.contextMenu.fromMenu=function(e){var t={};return function s(i,e,c){return c||(c=0),e.each(function(){var e,t,n=m(this),o=this,a=this.nodeName.toLowerCase();switch("label"===a&&n.find("input, textarea, select").length&&(e=n.text(),a=(o=(n=n.children().first()).get(0)).nodeName.toLowerCase()),a){case"menu":t={name:n.attr("label"),items:{}},c=s(t.items,n.children(),c);break;case"a":case"button":t={name:n.text(),disabled:!!n.attr("disabled"),callback:function(){n.get(0).click()}};break;case"menuitem":case"command":switch(n.attr("type")){case void 0:case"command":case"menuitem":t={name:n.attr("label"),disabled:!!n.attr("disabled"),icon:n.attr("icon"),callback:function(){n.get(0).click()}};break;case"checkbox":t={type:"checkbox",disabled:!!n.attr("disabled"),name:n.attr("label"),selected:!!n.attr("checked")};break;case"radio":t={type:"radio",disabled:!!n.attr("disabled"),name:n.attr("label"),radio:n.attr("radiogroup"),value:n.attr("id"),selected:!!n.attr("checked")};break;default:t=void 0}break;case"hr":t="-------";break;case"input":switch(n.attr("type")){case"text":t={type:"text",name:e||l(o),disabled:!!n.attr("disabled"),value:n.val()};break;case"checkbox":t={type:"checkbox",name:e||l(o),disabled:!!n.attr("disabled"),selected:!!n.attr("checked")};break;case"radio":t={type:"radio",name:e||l(o),disabled:!!n.attr("disabled"),radio:!!n.attr("name"),value:n.val(),selected:!!n.attr("checked")};break;default:t=void 0}break;case"select":t={type:"select",name:e||l(o),disabled:!!n.attr("disabled"),selected:n.val(),options:{}},n.children().each(function(){t.options[this.value]=m(this).text()});break;case"textarea":t={type:"textarea",name:e||l(o),disabled:!!n.attr("disabled"),value:n.val()};break;case"label":break;default:t={type:"html",html:n.clone(!0)}}t&&(i["key"+ ++c]=t)}),c}(t,m(e).children()),t},m.contextMenu.defaults=g,m.contextMenu.types=v,m.contextMenu.handle=b,m.contextMenu.op=$,m.contextMenu.menus=x});
//# sourceMappingURL=jquery.contextMenu.min.js.map



// 메인 개인화 전체 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 45;
	$(".main_section").css("height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 45;
		$(".main_section").css("height", set_h);
});


// 메인 개인화 컨텐츠 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 115;
	$(".main_container").css("height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 115;
		$(".main_container").css("height", set_h);
});

// 메인 환자개인화 컨텐츠 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 115;
	$(".main_person_container").css("height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 115;
		$(".main_person_container").css("height", set_h);
});


// 채팅 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 135;
	$(".chat_scrollbox").css("height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 135;
		$(".chat_scrollbox").css("height", set_h);
});


// 서브 우측 타일 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 80;
	$(".rit_wrapper_w").css("min-height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 80;
		$(".rit_wrapper_w").css("min-height", set_h);
});




//메뉴 열고 닫기
$( document ).ready(function() {
	$( "#btn_close_menu" ).on( "click", function() {
	if($("#flag_view").val() == "Y") {
		$('.common_wrapper').addClass('close_menu');
		$( "#btn_close_menu" ).children("img").attr("src","../images/sub_common/btn_open.png");
		$("#flag_view").val("N");
	} else {
		$('.common_wrapper').removeClass('close_menu');
		$( "#btn_close_menu" ).children("img").attr("src","../images/sub_common/btn_close.png");
		$("#flag_view").val("Y");
	}
		});


		//사진 첨부
		'use strict';

		;( function ( document, window, index )
		{
			var inputs = document.querySelectorAll( '.inputfile' );
			Array.prototype.forEach.call( inputs, function( input )
			{
				var label	 = input.nextElementSibling,
					labelVal = label.innerHTML;

				input.addEventListener( 'change', function( e )
				{
					var fileName = '';
					if( this.files && this.files.length > 1 )
						fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
					else
						fileName = e.target.value.split( '\\' ).pop();

					if( fileName )
						label.querySelector( 'span' ).innerHTML = fileName;
					else
						label.innerHTML = labelVal;
				});

				// Firefox bug fix
				input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
				input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
			});
		}( document, window, 0 ));


});


//로딩바
setTimeout(function() {
   $('.loading_div').fadeOut();
}, 1000);


//검색메뉴
$( document ).ready(function() {
	$( ".btn_search_open" ).on( "click", function() {
	if($("#search_view").val() == "Y") {
		$('.search_board_form').addClass('add_view_search');
		$( ".btn_search_open" ).children("img").attr("src","../images/sub_common/btn_close1.png");
		$("#search_view").val("N");
	} else {
		$('.search_board_form').removeClass('add_view_search');
		$( ".btn_search_open" ).children("img").attr("src","../images/sub_common/btn_open1.png");
		$("#search_view").val("Y");
	}
		});
});






// 메인 개인화 컨텐츠 높이 계산
$(window).resize(function () {
	var d_h = $(window).height();
	set_h = d_h - 660;
	$(".widget_secton .widget_secton_ul > li").css("height", set_h);
}).resize();

$(document).ready(function () {
		var d_h = $(window).height();
		set_h = d_h - 660;
		$(".widget_secton .widget_secton_ul > li").css("height", set_h);
});



$(document).ready(function () {
	$(".btn_full").click(function(){
	  $(this).parents("li").toggleClass("clicked");
	});

	$(".btn_full_cal").click(function(){
	  $(this).parents(".bottom_rit_main_container").toggleClass("clicked");
	});


	$(".btn_sitemap, #btn_close_menu1").click(function(){
		$('body').toggleClass("on_sitemap");
	});

	$(".btn_chat_close, .btn_on_chat").click(function(){
		$('body').toggleClass("on_chat");
	});

	$(".btn_fav_close, .btn_on_fav").click(function(){
		$('body').toggleClass("on_fav");
	});

		$(".btn_main_setting").click(function(){
		$('body').toggleClass("on_setting");
	});

});


//탭 오버시 메뉴
$(function () {
	$("ul.tab_sec_menu").hide();
	$("ul.type1_n li").hover(function () {
		$("ul:not(:animated)", this).slideDown("fast");
	},
		function () {
			$("ul", this).slideUp("fast");
		});
});