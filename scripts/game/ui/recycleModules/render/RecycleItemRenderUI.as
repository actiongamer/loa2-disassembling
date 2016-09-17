package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class RecycleItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="124" height="124">
			  <Box x="0" y="25" var="box_content" buttonMode="true" visible="false">
			    <Image skin="png.uiRecycle.名字底" x="-24" y="66"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" y="3" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60" x="25"/>
			    <Image skin="png.comp.image" x="28" y="6" var="img_icon" width="54" height="54"/>
			    <Label text="重要提示橘黄" autoSize="none" y="72" style="重要提示橘黄" width="111" height="18" align="center" var="txt_name" x="0"/>
			    <Button skin="png.uiRecycle.btn_close2" x="54" stateNum="1" var="btn_remove"/>
			    <List y="48" repeatX="5" spaceX="-10" var="list_stars" scale="0.31" x="28">
			      <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			    </List>
			    <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_star_cnt" width="46" align="left" x="62" y="46" style="普通说明"/>
			  </Box>
			  <Image skin="png.uiRecycle.加号(绿)" x="55" y="71" anchorX=".5" anchorY=".5" var="img_plus" buttonMode="true" scaleX=".7" scaleY=".7" smoothing="true"/>
			</WealthRender>;
       
      
      public var box_content:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var btn_remove:Button = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public var img_plus:Image = null;
      
      public function RecycleItemRenderUI()
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
