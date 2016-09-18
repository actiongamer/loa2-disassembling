package game.ui.roleInfos.phaseUps.talents
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PhaseUpTalentWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="134" height="25">
			  <Image skin="png.a5.comps.img_block" autoSize="false" width="25" height="25" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="28" y="4" size="12" var="txt_num" letterSpacing="1" style="随品质变化" buttonMode="true" width="105" height="18"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function PhaseUpTalentWealthRenderUI()
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
