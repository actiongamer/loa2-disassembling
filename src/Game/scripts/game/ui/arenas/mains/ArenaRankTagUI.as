package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ArenaRankTagUI extends View
   {
      
      protected static var uiView:XML = <View width="134" height="21">
			  <Label text="排名:" autoSize="none" x="0" y="0" style="二级框标题" width="51" height="20" align="left" var="txt_name"/>
			  <Label text="789" autoSize="none" x="38" y="1" style="渐变2" width="94" height="20" align="left" var="txt_value"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function ArenaRankTagUI()
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
