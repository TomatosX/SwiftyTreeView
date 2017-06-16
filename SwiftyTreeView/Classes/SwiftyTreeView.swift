//
//  SwiftyTreeView.swift
//  Pods
//
//  Created by 吴家锋 on 2017/6/16.
//
//

import UIKit

public enum SwiftyTreeViewStyle {
    case plain
    case grouped
}

public enum SwiftyTreeViewCellSeparatorStyle {
    case none
    case singleLine
    case singleLineEtched
}

public enum SwiftyTreeViewScrollPosition {
    case none
    case top
    case middle
    case bottom
}

public enum SwiftyTreeViewRowAnimation {
    case fade
    case right
    case left
    case top
    case bottom
    case none
    case middle
    case automatic
}

@objc public protocol SwiftyTreeViewDelegate: class {
    
    ///------------------------------------------------
    /// Configuring Rows for the Tree View
    ///------------------------------------------------
    
    /**
     *  Asks the delegate for the height to use for a row for a specified item.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a cell in tree view.
     *
     *  @return A nonnegative floating-point value that specifies the height (in points) that row should be.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, heightForRowForItem item: Any) -> CGFloat
    
    
    /**
     *  Asks the delegate for the estimated height of a row for a specified item.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a cell in tree view.
     *
     *  @return A nonnegative floating-point value that specifies the height (in points) of the header for section.
     */
    @objc @available(iOS 7.0, *)
    optional func treeView(_ treeView: SwiftyTreeView, estimatedHeightForRowForItem item: Any) -> CGFloat
    
    
    /**
     *  Asks the delegate to return the level of indentation for a row for a specified item.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a cell in tree view.
     *
     *  @return Returns the depth of the specified row to show its hierarchical position.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, indentationLevelForRowForItem item: Any) -> Int
    
    
    /**
     *  Tells the delegate the tree view is about to draw a cell for a particular item.
     *
     *  @param treeView     The tree-view object informing the delegate of this impending event.
     *  @param cell         A table-view cell object that tableView is going to use when drawing the row.
     *  @param item         An item identifying a cell in tree view.
     */
    @objc @available(iOS 2.0, *)
    optional func treeView(_ treeView: SwiftyTreeView, willDisplay cell: UITableViewCell, forItem item: Any)
    
    
    ///------------------------------------------------
    /// @name Managing Accessory Views
    ///------------------------------------------------
    
    /**
     *  Tells the delegate that the user tapped the accessory (disclosure) view associated with a row for a given item.
     *
     *  @param treeView     The tree-view object informing the delegate of this event.
     *  @param item         An item identifying a cell in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, accessoryButtonTappedForRowForItem item: Any)
    
    
    ///------------------------------------------------
    /// @name Expanding and Collapsing Tree View rows
    ///------------------------------------------------
    
    /**
     *  Asks delegate whether a row for a specified item should be expanded.
     *
     *  @param treeView       The tree-view object requesting this information.
     *  @param item           An item identifying a row in tree view.
     *
     *  @return YES if the background of the row should be expanded, otherwise NO.
     *  @discussion If the delegate does not implement this method, the default is YES.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, shouldExpandRowForItem item: Any) -> Bool
    
    
    /**
     *  Asks delegate whether a row for a specified item should be collapsed.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return YES if the background of the row should be expanded, otherwise NO.
     *  @discussion If the delegate does not implement this method, the default is YES.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, shouldCollapaseRowForItem item: Any) -> Bool
    
    
    /**
     *  Tells the delegate that a row for a specified item is about to be expanded.
     *
     *  @param treeView     A tree-view object informing the delegate about the impending expansion.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, willExpandRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that a row for a specified item is about to be collapsed.
     *
     *  @param treeView     A tree-view object informing the delegate about the impending collapse.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, willCollapseRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that the row for a specified item is now expanded.
     *
     *  @param treeView     A tree-view object informing the delegate that new row is expanded.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didExpandRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that the row for a specified item is now collapsed.
     *
     *  @param treeView     A tree-view object informing the delegate that new row is collapsed.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didCollapseRowForItem item: Any)
    
    
    ///------------------------------------------------
    /// @name Managing Selections
    ///------------------------------------------------
    
    /**
     *  Tells the delegate that a row for a specified item is about to be selected.
     *
     *  @param treeView     A tree-view object informing the delegate about the impending selection.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return An id object that confirms or alters the selected row. Return an id object other than item if you want another cell to be selected. Return nil if you don't want the row selected.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, willSelectRowForItem item: Any) -> Any
    
    
    /**
     *  Tells the delegate that the row for a specified item is now selected.
     *
     *  @param treeView     A tree-view object informing the delegate about the new row selection.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didSelectRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that a row for a specified item is about to be deselected.
     *
     *  @param treeView     A tree-view object informing the delegate about the impending deselection.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return An id object that confirms or alters the deselected row. Return an id object other than item if you want another cell to be deselected. Return nil if you don’t want the row deselected.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, willDeselectRowForItem item: Any) -> Any
    
    
    /**
     *  Tells the delegate that the row for a specified item is now deselected.
     *
     *  @param treeView     A tree-view object informing the delegate about the row deselection.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didDeselectRowForItem item: Any)
    
    
    ///------------------------------------------------
    /// @name Editing Tree Rows
    ///------------------------------------------------
    
    /**
     *  Tells the delegate that the tree view is about to go into editing mode.
     *
     *  @param treeView     The tree-view object providing this information.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, willBeginEditingRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that the tree view has left editing mode.
     *
     *  @param treeView     The tree-view object providing this information.
     *  @param item         AAn item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didEndEditingRowForItem item: Any)
    
    
    
    /**
     *  Asks the delegate for the editing style of a row for a specified item.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return The editing style of the cell for the row identified by item.
     *  @discussion This method allows the delegate to customize the editing style of the cell for specified item. If the delegate does not implement this method and the UITableViewCell object is editable (that is, it has its editing property set to YES), the cell has the UITableViewCellEditingStyleDelete style set for it.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, editingStyleForRowForItem item: Any) -> UITableViewCellEditingStyle
    
    
    /**
     *  Changes the default title of the delete-confirmation button.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return A localized string to used as the title of the delete-confirmation button.
     *  @discussion By default, the delete-confirmation button, which appears on the right side of the cell, has the title of “Delete”. The tree view displays this button when the user attempts to delete a row, either by swiping the row or tapping the red minus icon in editing mode. You can implement this method to return an alternative title, which should be localized. Default title string ("Delete") isn't localized.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, titleForDeleteConfirmationButtonForRowForItem item: Any) -> String
    
    
    /**
     *  Asks the delegate whether the background of the row for a specified item should be indented while the tree view is in editing mode.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return YES if the background of the row should be indented, otherwise NO.
     *  @discussion If the delegate does not implement this method, the default is YES.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, shouldIndentWhileEditingRowForItem item: Any) -> Bool
    
    
    /**
     *  Asks the data source for the edit actions for an item. This is an iOS 8 only method.
     *
     *  @praram treeView	The tree-view object requesting this information.
     *  @param item			An item identifying a cell in the tree view.
     *
     *  @return An NSArray of `UITableViewRowAction` objects to show for editing.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, editActionsForItem item: Any) -> [Any]
    
    
    ///------------------------------------------------
    /// @name Tracking the Removal of Views
    ///------------------------------------------------
    
    /**
     *  Tells the delegate that the cell for a specified item was removed from the tree.
     *
     *  @param treeView     The tree-view object that removed the view.
     *  @param cell         The cell that was removed.
     *  @param item         An item identifying a cell in tree view.
     */
    @objc @available(iOS 2.0, *)
    optional func treeView(_ treeView: SwiftyTreeView, didEndDisplaying cell: UITableViewCell, forItem item: Any)
    
    
    ///------------------------------------------------
    /// @name Copying and Pasting Row Content
    ///------------------------------------------------
    
    /**
     *  Asks the delegate if the editing menu should be shown for a row for a specified item.
     *
     *  @param treeView     The tree-view object that is making this request.
     *  @param item         An item identifying a row in tree view.
     *
     *  @return YES if the editing menu should be shown positioned near the row and pointing to it, otherwise NO. The default value is NO.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, shouldShowMenuForRowForItem item: Any) -> Bool
    
    
    /**
     *  Asks the delegate if the editing menu should omit the Copy or Paste command for a row for a specified item.
     *
     *  @param treeView     The tree-view object that is making this request.
     *  @param action       A selector type identifying the copy: or paste: method of the UIResponderStandardEditActions informal protocol.
     *  @param item         An item identifying a row in tree view.
     *  @param sender       The object that initially sent the copy: or paste: message.
     *
     *  @return YES if the command corresponding to action should appear in the editing menu, otherwise NO. The default value is NO.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, canPerformAction action: Selector, forRowForItem item: Any, withSender sender: Any) -> Bool
    
    
    /**
     *  Tells the delegate to perform a copy or paste operation on the content of a row for a specified item.
     *
     *  @param treeView     The tree-view object that is making this request.
     *  @param action       A selector type identifying the copy: or paste: method of the UIResponderStandardEditActions informal protocol.
     *  @param item         An item identifying a row in tree view.
     *  @param sender       The object that initially sent the copy: or paste: message.
     *  @discussion The tree view invokes this method for a given action if the user taps Copy or Paste in the editing menu.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, performAction action: Selector, forRowForItem item: Any, withSender sender: Any)
    
    
    ///------------------------------------------------
    /// @name Managing Tree View Highlighting
    ///------------------------------------------------
    
    /**
     *  Asks the delegate if the row for a specified item should be highlighted.
     *
     *  @param treeView     The tree-view object that is making this request.
     *  @param treeNodeInfo Object including additional information about item.
     *
     *  @return YES if the row should be highlighted or NO if it should not.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, shouldHighlightRowForItem item: Any) -> Bool
    
    
    /**
     *  Tells the delegate that the row for a specified item was highlighted.
     *
     *  @param treeView     The tree-view object that highlighted the cell.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didHighlightRowForItem item: Any)
    
    
    /**
     *  Tells the delegate that the highlight was removed from the row for a specified item.
     *
     *  @param treeView     The tree-view object that removed the highlight from the cell.
     *  @param item         An item identifying a row in tree view.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, didUnhighlightRowForItem item: Any)
}

@objc public protocol SwiftyTreeViewDataSource: class {
    
    ///------------------------------------------------
    /// Configuring a Tree View
    ///------------------------------------------------
    
    /**
     *  Ask the data source to return the number of child items encompassed by a given item. (required)
     *
     *  @param treeView     The tree-view that sent the message.
     *  @param item         An item identifying a cell in tree view.
     *  @param treeNodeInfo Object including additional information about item.
     *
     *  @return The number of child items encompassed by item. If item is nil, this method should return the number of children for the top-level item.
     */
    func treeView(_ treeView: SwiftyTreeView, numberOfChildrenOfItem item: Any?) -> Int
    
    
    /**
     *  Asks the data source for a cell to insert for a specified item. (required)
     *
     *  @param treeView     A tree-view object requesting the cell.
     *  @param item         An item identifying a cell in tree view.
     *
     *  @return An object inheriting from UITableViewCell that the tree view can use for the specified row. An assertion is raised if you return nil.
     */
    @available(iOS 2.0, *)
    func treeView(_ treeView: SwiftyTreeView, cellForItem item: Any?) -> UITableViewCell
    
    
    /**
     *  Ask the data source to return the child item at the specified index of a given item. (required)
     *
     *  @param treeView The tree-view object requesting child of the item at the specified index.
     *  @param index    The index of the child item from item to return.
     *  @param item     An item identifying a cell in tree view.
     *
     *  @return The child item at index of a item. If item is nil, returns the appropriate child item of the root object.
     */
    func treeView(_ treeView: SwiftyTreeView, child index: Int, ofItem item: Any?) -> Any
    
    
    ///------------------------------------------------
    /// Inserting or Deleting Tree Rows
    ///------------------------------------------------
    
    /**
     *  Asks the data source to commit the insertion or deletion of a row for specified item in the receiver.
     *
     *  @param treeView     The tree-view object requesting the insertion or deletion.
     *  @param editingStyle The cell editing style corresponding to a insertion or deletion requested for the row specified by item. Possible editing styles are `UITableViewCellEditingStyleInsert` or `UITableViewCellEditingStyleDelete`.
     *  @param item         An item identifying a cell in tree view.
     *  @param treeNodeInfo Object including additional information about item.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, commit editingStyle: UITableViewCellEditingStyle, forRowForItem item: Any)
    
    
    /**
     *  Asks the data source to verify that row for given item is editable.
     *
     *  @param treeView     The tree-view object requesting this information.
     *  @param item         An item identifying a cell in tree view.
     *
     *  @return `YES` if the row indicated by indexPath is editable; otherwise, `NO`.
     */
    @objc optional func treeView(_ treeView: SwiftyTreeView, canEditRowForItem item: Any) -> Bool
}

public class SwiftyTreeView: UIView {
    
    weak var delegate: SwiftyTreeViewDelegate?
    weak var dataSource: SwiftyTreeViewDataSource?
    
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100), style: .plain)
    }
    
    public override convenience init(frame: CGRect) {
        self.init(frame: frame, style: .plain)
    }

    public init(frame: CGRect, style: SwiftyTreeViewStyle) {
        super.init(frame: frame)
        let innerFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        self.commonInit(frame: innerFrame, style: style)
    }
    
    func commonInit(frame: CGRect, style: SwiftyTreeViewStyle) {
        
    }
    
    public override func awakeFromNib() {
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

















