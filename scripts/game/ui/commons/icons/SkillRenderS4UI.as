package game.ui.commons.icons
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SkillRenderS4UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="92" height="32">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS5_1" var="img_quality" x="-1" y="-1"/>
			  <Image skin="png.comp.image" width="28" height="28" var="img_icon" x="2" y="2"/>
			  <Label text="Lv.99" autoSize="none" x="23" y="18" width="51" height="18" align="right" var="txt_level" bold="false" style="重要提示绿"/>
			  <Label text="天谴怒击" autoSize="none" x="37" y="0" height="18" align="right" var="txt_name" bold="false" style="重要提示橘黄" size="13"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public function SkillRenderS4UI()
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
