package game.ui.commons.icons
{
   import morn.customs.components.PetRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class PetRenderUI extends PetRender
   {
      
      protected static var uiView:XML = <PetRender width="56" height="74" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="0" y="0" sizeGrid="6,6,6,6" var="img_quality"/>
			  <Image skin="png.comp.image" x="3" y="3" width="50" height="50" var="img_icon"/>
			  <Label text="名字" x="2" y="57" size="12" var="txt_name" bold="false" style="随品质变化" mouseEnabled="false" mouseChildren="false" autoSize="center" centerX="0"/>
			  <List y="42" repeatX="5" spaceX="-12" var="list_stars" scale="0.27" x="-2" mouseEnabled="false" mouseChildren="false">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="26" y="39" style="普通说明" var="txt_star_cnt" text="haha" mouseEnabled="false" mouseChildren="false"/>
			</PetRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function PetRenderUI()
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
