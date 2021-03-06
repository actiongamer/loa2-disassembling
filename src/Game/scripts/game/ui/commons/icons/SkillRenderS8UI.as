package game.ui.commons.icons
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SkillRenderS8UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="291" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="0" y="0" sizeGrid="6,6,6,6" width="56" height="56" var="img_quality"/>
			  <Image skin="png.comp.image" x="3" y="3" width="50" height="50" var="img_icon"/>
			  <Label text="Lv.99" autoSize="none" x="4" y="35" size="12" width="51" height="18" align="right" var="txt_level" bold="false" style="普通说明"/>
			  <Label text="技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述" autoSize="none" x="72" y="-1" color="0xc2beaf" size="12" width="219" height="70" align="left" var="txt_desc" bold="false" wordWrap="true" leading="5" style="普通说明"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_desc:Label = null;
      
      public function SkillRenderS8UI()
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
