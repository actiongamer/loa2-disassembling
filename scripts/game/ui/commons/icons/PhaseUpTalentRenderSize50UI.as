package game.ui.commons.icons
{
   import morn.customs.components.PhaseUpTalentRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PhaseUpTalentRenderSize50UI extends PhaseUpTalentRender
   {
      
      protected static var uiView:XML = <PhaseUpTalentRender width="50" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS1_5" x="0" y="0" var="img_quality"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="44" height="44" var="img_icon"/>
			  <Label text="LV.13" x="0" y="32" size="12" width="50" height="18" align="right" var="txt_level" bold="false" style="重要提示绿"/>
			</PhaseUpTalentRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public function PhaseUpTalentRenderSize50UI()
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
