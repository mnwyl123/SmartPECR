/**
 * @class Ext.ux.DataView.Draggable
 * @extends Object
 * @author 穆楠 Ed Spencer
 *
<pre><code>
Ext.create('Ext.view.View', {
    mixins: {
        draggable: 'Ext.ux.DataView.Draggable'
    },

    initComponent: function() {
        this.mixins.draggable.init(this, {
            ddConfig: {
                ddGroup: 'someGroup'
            }
        });

        this.callParent(arguments);
    }
});
</code></pre>
 *
 */
Ext.define('Ext.ux.DataView.Draggable', {
    requires: 'Ext.dd.DragZone',

    /**
     * @cfg {String} ghostCls The CSS class added to the outermost element of the created ghost proxy
     * (defaults to 'x-dataview-draggable-ghost')
     */
    ghostCls: 'x-dataview-draggable-ghost',

    /**
     * @cfg {Ext.XTemplate/Array} ghostTpl The template used in the ghost DataView
     */
    ghostTpl: [
        '<tpl for=".">',
            '{title}',
        '</tpl>'
    ],

    /**
     * @cfg {Object} ddConfig Config object that is applied to the internally created DragZone
     */

    /**
     * @cfg {String} ghostConfig Config object that is used to configure the internally created DataView
     */

    init: function(dataview, config) {
        /**
         * @property dataview
         * @type Ext.view.View
         * The Ext.view.View instance that this DragZone is attached to
         */
    	/*if(!config){
    		config =  {
                ddConfig: {
                    ddGroup: 'desktopDD'
                },
                ghostTpl: [
                           '<tpl for=".">',
                               '<div class="ux-desktop-shortcut" id="{name}-shortcut">',
                                   '<div class="ux-desktop-shortcut-icon {iconCls}">',
                                       '<img src="',Ext.BLANK_IMAGE_URL,'" title="{name}">',
                                   '</div>',
                                   '<div class="ux-desktop-shortcut-text">',
                                   	'<div class="ux-desktop-shortcut-text-inner">{name}</div>',
                                   '</div>',
                                   //'<span class="ux-desktop-shortcut-text">{name}</span>',
                               '</div>',
                           '</tpl>'
                ]
            };
    	}*/
    	
        this.dataview = dataview;

        dataview.on('render', this.onRender, this);

        Ext.apply(this, {
            itemSelector: dataview.itemSelector,
            ghostConfig : {}
        }, config || {});

        
        Ext.applyIf(this.ghostConfig, {
            itemSelector: 'div.ux-desktop-shortcut',
            cls: this.ghostCls,
            tpl: this.ghostTpl
        });
    },

    /**
     * @private
     * Called when the attached DataView is rendered. Sets up the internal DragZone
     */
    onRender: function() {
        var config = Ext.apply({}, this.ddConfig || {}, {
            dvDraggable: this,
            dataview   : this.dataview,
            getDragData: this.getDragData,
            getTreeNode: this.getTreeNode,
            afterRepair: this.afterRepair,
            getRepairXY: this.getRepairXY
        });

        /**
         * @property dragZone
         * @type Ext.dd.DragZone
         * The attached DragZone instane
         */
        this.dragZone = Ext.create('Ext.dd.DragZone', this.dataview.getEl(), config);
    },

    getDragData: function(e) {
        var draggable = this.dvDraggable,
            dataview  = this.dataview,
            selModel  = dataview.getSelectionModel(),
            target    = e.getTarget(draggable.itemSelector),
            selected, dragData;

        if (target) {
            if (!dataview.isSelected(target)) {
                selModel.select(dataview.getRecord(target));
            }

            selected = dataview.getSelectedNodes();
            dragData = {
                copy: true,
                nodes: selected,
                records: selModel.getSelection(),
                item: true
            };

            if (selected.length == 1) {
                dragData.single = true;
                dragData.ddel = target;
            } else {
                dragData.multi = true;
                dragData.ddel = draggable.prepareGhost(selModel.getSelection()).dom;
            }

            return dragData;
        }

        return false;
    },

    getTreeNode: function() {
        console.log('test');
    },

    afterRepair: function() {
        this.dragging = false;

        var nodes  = this.dragData.nodes,
            length = nodes.length,
            i;

        //FIXME: Ext.fly does not work here for some reason, only frames the last node
        for (i = 0; i < length; i++) {
            Ext.get(nodes[i]).frame('#8db2e3', 1);
        }
    },

    /**
     * @private
     * Returns the x and y co-ordinates that the dragged item should be animated back to if it was dropped on an
     * invalid drop target. If we're dragging more than one item we don't animate back and just allow afterRepair
     * to frame each dropped item.
     */
    getRepairXY: function(e) {
        if (this.dragData.multi) {
            return false;
        } else {
            var repairEl = Ext.get(this.dragData.ddel),
                repairXY = repairEl.getXY();

            //take the item's margins and padding into account to make the repair animation line up perfectly
            repairXY[0] += repairEl.getPadding('t') + repairEl.getMargin('t');
            repairXY[1] += repairEl.getPadding('l') + repairEl.getMargin('l');

            return repairXY;
        }
    },

    /**
     * Updates the internal ghost DataView by ensuring it is rendered and contains the correct records
     * @param {Array} records The set of records that is currently selected in the parent DataView
     * @return {Ext.view.View} The Ghost DataView
     */
    prepareGhost: function(records) {
        var ghost = this.createGhost(records),
            store = ghost.store;

        store.removeAll();
        store.add(records);

        return ghost.getEl();
    },

    /**
     * @private
     * Creates the 'ghost' DataView that follows the mouse cursor during the drag operation. This div is usually a
     * lighter-weight representation of just the nodes that are selected in the parent DataView. Delegates the creation
     * of each selected item's element to {@link createGhostElement}
     */
    createGhost: function(records) {
        if (!this.ghost) {
            var ghostConfig = Ext.apply({}, this.ghostConfig, {
                store: Ext.create('Ext.data.Store', {
                    model: records[0].modelName
                })
            });

            this.ghost = Ext.create('Ext.view.View', ghostConfig);

            this.ghost.render(document.createElement('div'));
        }

        return this.ghost;
    }
});
