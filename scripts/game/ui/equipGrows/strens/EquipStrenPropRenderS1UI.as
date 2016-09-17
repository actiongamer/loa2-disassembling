package game.ui.equipGrows.strens
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class EquipStrenPropRenderS1UI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="92" height="20">
			  <HBox>
			    <Label text="战斗初始怒气" autoSize="none" color="0xf9bd77" var="txt_name" x="0" y="0" width="80" height="20" align="right"/>
			    <Label text="+99999" autoSize="left" color="0x3cff00" x="55" y="0" var="txt_value"/>
			  </HBox>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="140" y="2" var="img_arrowUp" visible="false"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var img_arrowUp:Image = null;
      
      public function EquipStrenPropRenderS1UI()
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
