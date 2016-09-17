package game.ui.horseModules.horseChange
{
   import morn.customs.components.HorseRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HorsePreRenderUI extends HorseRender
   {
      
      protected static var uiView:XML = <HorseRender width="130" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_4" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="48" height="48"/>
			  <Label text="\l30300040" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="left" x="58" y="2" letterSpacing="1" width="100" height="36" align="left" style="普通说明" multiline="true" wordWrap="true"/>
			  <Label text="已激活" stroke="0xffffff" mouseEnabled="false" var="txt_state" backgroundColor="0xcfbeaf" autoSize="none" align="left" x="59" y="36" height="16" style="重要提示绿"/>
			</HorseRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_state:Label = null;
      
      public function HorsePreRenderUI()
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
