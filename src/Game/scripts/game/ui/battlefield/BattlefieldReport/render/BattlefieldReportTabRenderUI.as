package game.ui.battlefield.BattlefieldReport.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldReportTabRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="86" height="97" buttonMode="true" mouseChildren="false" mouseEnabled="true">
			  <Image skin="png.a5.comps.img_block" x="16" y="46" anchorX="0.5" anchorY="0.5" smoothing="true" var="img_bg" scale="0.9"/>
			  <Image skin="png.a5.comps.img_block" x="26" y="50" anchorX="0.5" anchorY="0.5" smoothing="true" var="img_icon" autoSize="false" scale="0.9"/>
			  <Label text="红魔" autoSize="none" x="-30" y="60" style="渐变1" width="114" align="center" height="24" var="txt_teamName"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_teamName:Label = null;
      
      public function BattlefieldReportTabRenderUI()
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
