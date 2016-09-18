package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class RecSelectRebornTreasureRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="242" height="100" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" x="2" y="2"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="15" y="11" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="18" y="14" var="img_icon" width="54" height="54"/>
			  <Image skin="png.uiRecycle.小框分割线" x="81" y="29"/>
			  <Box x="6" y="12" mouseChildren="false" mouseEnabled="false">
			    <Label text="普罗米修斯" autoSize="left" x="78" style="普通说明" width="140" height="18" var="txt_name" mouseEnabled="false"/>
			    <Label text="等级" autoSize="left" x="79" y="23" style="普通说明" width="75" height="18" var="txt_lvl" mouseEnabled="false"/>
			  </Box>
			  <Button label="选择" x="158" y="70" style="按钮小红" var="btn_select"/>
			  <List y="56" repeatX="5" spaceX="-10" var="list_stars" scale="0.31" x="17">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_star_cnt" width="46" align="left" x="47" y="55" style="普通说明"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var btn_select:Button = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function RecSelectRebornTreasureRenderUI()
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
