package game.ui.commons.icons
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SkillRenderS5UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="32" height="32">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS5_1" x="-1" y="-1" var="img_quality" sizeGrid="8,8,8,8"/>
			  <Image skin="png.comp.image" x="1" y="1" width="30" height="30" var="img_icon"/>
			  <Label text="Lv.99" autoSize="none" x="-12" y="16" color="0xc2beaf" size="12" width="51" height="18" align="right" var="txt_level" bold="false"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public function SkillRenderS5UI()
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
