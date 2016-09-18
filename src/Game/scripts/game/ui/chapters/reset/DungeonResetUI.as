package game.ui.chapters.reset
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class DungeonResetUI extends View
   {
      
      protected static var uiView:XML = <View width="372" height="267">
			  <Label text="\l4040008" x="79.5" y="90" width="217" height="63" color="0xccc1a4" size="14" multiline="false" wordWrap="true" bold="false" align="center" leading="20" var="txt_reset" isHtml="true"/>
			  <Image skin="png.uiChapter.dungeonReset.img_line" x="25" y="187" width="314" height="1"/>
			  <Image skin="png.a5.comps.img_block" x="160" y="82" autoSize="false" var="img_diamond" width="32" height="32"/>
			</View>;
       
      
      public var txt_reset:Label = null;
      
      public var img_diamond:Image = null;
      
      public function DungeonResetUI()
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
