package game.ui.commons.icons
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SkillRenderS9UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="56" height="74">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="0" y="0" sizeGrid="6,6,6,6" var="img_quality"/>
			  <Image skin="png.comp.image" x="3" y="3" width="50" height="50" var="img_icon"/>
			  <Label text="Lv.99" autoSize="none" x="4" y="35" size="12" width="51" height="18" align="right" var="txt_level" bold="false" style="普通说明" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="技能名字" x="-36.5" y="59" size="12" width="129" height="18" align="center" var="txt_name" bold="false" style="随品质变化"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public function SkillRenderS9UI()
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
