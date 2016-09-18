package game.ui.roleTeam.render
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   
   public class RoleSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="31.5" height="31.5">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="-0.5" y="-0.5" sizeGrid="22,22,22,22" width="32" height="32" var="img_quality"/>
			  <Image skin="png.comp.image" x="3" y="3" width="26" height="26" var="img_icon"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function RoleSkillRenderUI()
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
