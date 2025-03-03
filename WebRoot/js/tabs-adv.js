Ext.Loader.setConfig({enabled: true});

Ext.Loader.setPath('Ext.ux', 'js/ext/ux/');

Ext.require([
    'Ext.tab.*',
    'Ext.ux.TabCloseMenu'
]);

Ext.onReady(function() {
    var currentItem;

    var tabs = Ext.widget('tabpanel', {
        renderTo: 'tabs',
        resizeTabs: true,
        enableTabScroll: true,
        width: '100%',
        height: 400,
        defaults: {
            autoScroll: true,
            bodyPadding: 10
        },/*
        items: [{
            title: 'Tab 1',
            iconCls: 'tabs',
            html: 'Tab Body<br/><br/>' + Ext.example.bogusMarkup,
            closable: true
        }],*/
        plugins: Ext.create('Ext.ux.TabCloseMenu', {
            extraItemsTail: [
                '-',
                {
                    text: 'Closable',
                    checked: true,
             //       hideOnClick: true,
                    handler: function (item) {
                        currentItem.tab.setClosable(item.checked);
                    }
                },
                '-',
                {
                    text: 'Enabled',
                    checked: true,
              //      hideOnClick: true,
                    handler: function(item) {
                        currentItem.tab.setDisabled(!item.checked);
                    }
                }
            ],
            listeners: {
                aftermenu: function () {
                    currentItem = null;
                },
                beforemenu: function (menu, item) {
                    menu.child('[text="Closable"]').setChecked(item.closable);
                    menu.child('[text="Enabled"]').setChecked(!item.tab.isDisabled());

                    currentItem = item;
                }
            }
        })
    });

    // tab generation code
    var index = 0;

 //   while(index < 3) {
//        addTab(index % 2);
 //   }

    function addTab (closable) {
        ++index;
        tabs.add({
            closable: !!closable,
           // html: '<iframe style="width:100%;height:100%;" src="http://localhost:7070/bicenterfin/RegularReport?op=license"/>' ,
            html: '<iframe style="width:100%;height:300px;display:block;" src="RegularReport?_type=testSuit/test.static.xls"></ifrmae>' ,
            iconCls: 'tabs',
            title: 'New Tab ' + index
        }).show();
    }

    Ext.widget('button', {
        iconCls: 'new-tab',
        renderTo: 'addButtonCt',
        text: 'Add Closable Tab',
        handler: function () {
            addTab(true);
        }
    });

    Ext.widget('button', {
        iconCls:'new-tab',
        renderTo: 'addButtonCt',
        style: 'margin-left: 8px;',
        text: 'Add Unclosable Tab',
        handler: function () {
            addTab(false);
        }
    });
});
