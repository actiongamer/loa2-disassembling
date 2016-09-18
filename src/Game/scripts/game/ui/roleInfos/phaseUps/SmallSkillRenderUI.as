package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   
   public class SmallSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="16" height="16">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgSkillS1" x="0" y="0" sizeGrid="22,22,22,22" width="16" height="16"/>
			  <Image skin="png.comp.image" x="1" y="1" width="14" height="14" var="img_icon"/>
			</SkillRender>;
       
      
      public var img_icon:Image = null;
      
      public function SmallSkillRenderUI()
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
