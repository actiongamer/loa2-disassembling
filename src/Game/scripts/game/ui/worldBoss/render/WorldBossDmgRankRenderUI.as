package game.ui.worldBoss.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class WorldBossDmgRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="224" height="18">
			  <Label text="角色名六个字" autoSize="left" x="55" y="0" color="0xf7d739" width="104" height="18" var="txt_name" style="普通说明"/>
			  <Label text="9999999999" autoSize="left" x="136" y="0" color="0xf7d739" width="84" height="18" var="txt_value" style="普通说明"/>
			  <Label text="1" autoSize="none" x="4" y="0" color="0xf7d739" width="46" height="18" var="txt_rank" align="center" style="普通说明"/>
			  <Image skin="png.a5.commonImgs.1ST" x="26" y="8" scale=".8" smoothing="true" anchorX="0.5" anchorY=".5" var="img_rank"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_rank:Label = null;
      
      public var img_rank:Image = null;
      
      public function WorldBossDmgRankRenderUI()
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
