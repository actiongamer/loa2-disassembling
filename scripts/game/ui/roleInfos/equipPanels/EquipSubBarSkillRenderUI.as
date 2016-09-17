package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   
   public class EquipSubBarSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="45" height="45">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgSkillS1" x="-0.5" y="-0.5" sizeGrid="22,22,22,22" width="45" height="45"/>
			  <Image skin="png.comp.image" x="3" y="3" width="40" height="40" var="img_icon"/>
			</SkillRender>;
       
      
      public var img_icon:Image = null;
      
      public function EquipSubBarSkillRenderUI()
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
