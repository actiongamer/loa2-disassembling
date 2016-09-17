package game.ui.roleInfos.tupos
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TupoUnlockSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="122" height="42">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" var="img_quality" width="32" height="32" x="90" y="0"/>
			  <Image skin="png.comp.image" width="28" height="28" var="img_icon" x="92" y="2"/>
			  <Label text="天谴怒击" autoSize="none" x="0" y="15" height="22" align="left" var="txt_name" bold="false" style="重要提示橘黄" size="13"/>
			  <Label text="\l30100408" autoSize="none" x="0" y="-3" height="18" align="left" bold="false" style="普通说明" size="13"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function TupoUnlockSkillRenderUI()
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
