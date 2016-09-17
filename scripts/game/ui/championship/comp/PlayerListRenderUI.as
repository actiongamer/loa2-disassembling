package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PlayerListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="134" height="46">
			  <Image skin="png.uiChampionship.透明底框" var="img_Bg"/>
			  <Image skin="png.uiChampionship.透明底框-自己" var="img_bgSelf"/>
			  <Label text="下划线黄色的S123" autoSize="left" x="24" y="15" style="下划线黄色" width="106" height="18" var="txt_name"/>
			</View>;
       
      
      public var img_Bg:Image = null;
      
      public var img_bgSelf:Image = null;
      
      public var txt_name:Label = null;
      
      public function PlayerListRenderUI()
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
