package game.ui.battleResults
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattleLossRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="103" height="108" buttonMode="true" mouseChildren="false">
			  <Image skin="png.a5.comps.img_block" width="104" height="108" var="img_bg"/>
			  <Label width="205" style="TAB亮" text="招募英雄" align="center" x="-51" y="83" size="15" var="txt_name" height="25"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public function BattleLossRenderUI()
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
