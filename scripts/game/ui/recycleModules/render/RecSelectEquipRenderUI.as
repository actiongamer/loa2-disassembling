package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class RecSelectEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="242" height="89" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" x="2" y="1" width="240" height="88" sizeGrid="80,40,80,40"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="15" y="16" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="18" y="19" var="img_icon" width="54" height="54"/>
			  <CheckBox x="202" y="51" style="CheckBox普通" var="selectedFlag" buttonMode="false" mouseEnabled="false"/>
			  <Image skin="png.uiRecycle.小框分割线" x="81" y="28"/>
			  <Box x="84" y="11" mouseChildren="false" mouseEnabled="false">
			    <Label text="普罗米修斯" autoSize="left" style="普通说明" width="142" height="18" var="txt_name" mouseEnabled="false"/>
			    <Label text="等级" autoSize="left" x="1" y="26" style="普通说明" width="112" height="18" var="txt_stren" mouseEnabled="false"/>
			    <Label text="突破" autoSize="left" x="1" y="44" style="普通说明" width="114" height="19" var="txt_jinlian" mouseEnabled="false"/>
			  </Box>
			  <List y="60" repeatX="5" spaceX="-10" var="list_stars" scale="0.31" x="17">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_star_cnt" width="46" align="left" x="47" y="59" style="普通说明"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var selectedFlag:CheckBox = null;
      
      public var txt_name:Label = null;
      
      public var txt_stren:Label = null;
      
      public var txt_jinlian:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function RecSelectEquipRenderUI()
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
