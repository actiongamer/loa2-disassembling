package game.ui.commons.icons
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SkillRenderS2UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="50" height="50" buttonMode="false">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="0" y="0" sizeGrid="6,6,6,6" width="50" height="50" var="img_quality"/>
			  <Image skin="png.comp.image" x="4" y="4" width="42" height="42" var="img_icon"/>
			  <Label text="Lv.99" autoSize="none" x="-3" y="28" color="0xc2beaf" size="12" width="51" height="18" align="right" var="txt_level" bold="false"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public function SkillRenderS2UI()
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
