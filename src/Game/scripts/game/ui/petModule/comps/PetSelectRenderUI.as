package game.ui.petModule.comps
{
   import morn.customs.components.PetRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class PetSelectRenderUI extends PetRender
   {
      
      protected static var uiView:XML = <PetRender width="50" height="65" buttonMode="true">
			  <Image x="0" y="0" var="img_quality" skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" width="50" height="50"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="四字装备" autoSize="center" var="txt_name" centerX="0" x="-1" y="47"/>
			  <List y="37" repeatX="5" spaceX="-12" var="list_stars" scale="0.27" x="2" mouseEnabled="false" mouseChildren="false">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="30" y="34" style="普通说明" var="txt_star_cnt" text="haha"/>
			</PetRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function PetSelectRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
