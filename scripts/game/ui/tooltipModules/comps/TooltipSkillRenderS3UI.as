package game.ui.tooltipModules.comps
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipSkillRenderS3UI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="300" height="79">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="10" y="1" sizeGrid="6,6,6,6" width="62" height="62" var="img_quality"/>
			  <Image skin="png.a5.comps.img_block" x="14" y="5" width="54" height="54" var="img_icon"/>
			  <Label text="技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能文字描述技能" autoSize="left" x="87" y="23" bold="false" var="txt_des" multiline="true" wordWrap="true" width="200" style="普通说明" height="67" size="12" leading="6"/>
			  <Label text="\l10000001\l:" autoSize="none" y="-1" bold="false" var="txt_name" align="left" x="87" style="技能名标题" size="14"/>
			  <Label autoSize="left" x="191" y="0" bold="false" var="txt_kind" size="12" multiline="true" wordWrap="true" width="96" leading="6" letterSpacing="1" height="17" style="普通说明" text="大招" align="right"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_des:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_kind:Label = null;
      
      public function TooltipSkillRenderS3UI()
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
