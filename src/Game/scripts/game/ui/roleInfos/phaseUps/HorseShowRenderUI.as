package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   
   public class HorseShowRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="434" height="16">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" fillColor="0x0" width="434" height="16" var="horseLampBg" y="0"/>
			  <Label text="普通说明" autoSize="none" x="0" y="-1" style="普通说明" width="433" var="txt"/>
			</View>;
       
      
      public var horseLampBg:GRect = null;
      
      public var txt:Label = null;
      
      public function HorseShowRenderUI()
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
