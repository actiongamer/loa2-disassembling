package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ArenaFightValueTagUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="22">
			  <Label text="\l50200022" autoSize="none" x="-56" y="0" style="二级框标题" var="txt_name" width="163" height="28" align="right"/>
			  <Label text="22222222222222222" autoSize="none" x="109" y="0" style="渐变1" width="135" height="22" align="left" var="txt_value" size="16"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function ArenaFightValueTagUI()
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
