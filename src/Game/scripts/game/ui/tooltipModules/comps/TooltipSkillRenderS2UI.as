package game.ui.tooltipModules.comps
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipSkillRenderS2UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="277" height="100">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="-1" y="2" sizeGrid="6,6,6,6" width="50" height="50" var="img_quality"/>
			  <Image skin="png.a5.comps.img_block" x="2" y="5" width="44" height="44" var="img_icon"/>
			  <Label text="文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能" autoSize="left" x="52" y="0" bold="false" var="txt_desc" size="12" multiline="true" wordWrap="true" width="225" style="普通说明" leading="2" isHtml="true"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_desc:Label = null;
      
      public function TooltipSkillRenderS2UI()
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
