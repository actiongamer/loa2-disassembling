package game.ui.BagModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   
   public class YIYEViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="380" height="260">
			  <PanelBgS3 width="380" height="260" panelDragEnabled="true" showImgTitle1="false"/>
			  <Button label="确 定" style="按钮中红" var="btn_ok" x="216" y="212"/>
			  <Button label="取 消" x="85" style="按钮中蓝" var="btn_cancel" y="212"/>
			  <Label text="肄业合作道具" autoSize="none" x="93" y="86" style="普通说明" size="15" width="141" height="33" align="right"/>
			</PopModuleView>;
       
      
      public var btn_ok:Button = null;
      
      public var btn_cancel:Button = null;
      
      public function YIYEViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
