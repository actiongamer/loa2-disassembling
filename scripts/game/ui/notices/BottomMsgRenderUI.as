package game.ui.notices
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class BottomMsgRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="33" height="33">
			  <Image skin="png.a5.comps.img_block" width="33" height="33" var="img_icon"/>
			  <RedPointNum x="20" y="-8" var="redPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var redPoint:RedPointNumUI = null;
      
      public function BottomMsgRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
