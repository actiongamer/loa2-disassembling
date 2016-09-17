package game.ui.heroCompare.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class HCCellRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="156" height="30">
			  <Label autoSize="none" x="7" y="5" width="144" var="txt_value" text="11" align="center" style="普通说明"/>
			  <RedPoint x="140" y="0" var="img_rp" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</View>;
       
      
      public var txt_value:Label = null;
      
      public var img_rp:RedPointUI = null;
      
      public function HCCellRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
