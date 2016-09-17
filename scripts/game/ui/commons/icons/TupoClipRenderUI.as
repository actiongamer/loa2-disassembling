package game.ui.commons.icons
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   
   public class TupoClipRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="21" height="19">
			  <ClipList value="0" clipWidth="21" align="left" url="png.a5.comps.clipList.clipList_tupo" x="-1" y="0" var="clipList"/>
			</View>;
       
      
      public var clipList:ClipList = null;
      
      public function TupoClipRenderUI()
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
