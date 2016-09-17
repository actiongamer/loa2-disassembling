package game.ui.equipGrows.equipSelectors
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class EquipSelectorRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="202" height="58" disabled="false" buttonMode="true">
			  <Image skin="png.uiEquipGrow.new.放装备底" y="2" x="9" sizeGrid="12,12,12,12" var="img_bg"/>
			  <Image skin="png.uiEquipGrow.new.选中框" x="5" y="-1" name="selectBox1" sizeGrid="10,10,10,10" mouseEnabled="false" mouseChildren="false" var="img_selectedBg"/>
			  <Label text="创世之矛" autoSize="left" x="72" y="5" var="txt_name" width="132" height="18" style="普通绿色" mouseEnabled="false" mouseChildren="false"/>
			  <Box x="17" y="3" var="box_equip">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="21" var="img_quality" sizeGrid="24,24,24,24" anchorX="0.5" anchorY="0.5" width="48" height="48" y="26"/>
			    <Image skin="png.a5.commonImgs.img_equipRenderBgSmall1" y="5" var="img_equipIcon"/>
			    <Image skin="png.comp.image" var="img_icon" width="42" height="42" y="5"/>
			    <Image skin="png.a5.commonImgs.img_redPoint" x="34" var="img_redPoint"/>
			    <Image skin="png.a5.commonImgs.加号" x="10" y="15" var="img_plus" mouseEnabled="false"/>
			  </Box>
			  <Label text="清华+143" autoSize="left" x="72" y="21" var="txt_stren" height="18" style="按钮文字" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="精炼100阶" autoSize="left" x="72" y="37" var="txt_jinlian" height="18" style="按钮文字" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiEquipGrow.upstar.装备-升星-icon-锁" x="9" y="24" var="img_locked" visible="false"/>
			  <List y="39" repeatX="5" spaceX="-10" var="list_stars" scale="0.25" x="15" mouseChildren="false" mouseEnabled="false">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="122" y="5" style="普通说明" width="88" height="19" size="10" var="label_warn" text="\l30006302"/>
			</WealthRender>;
       
      
      public var img_bg:Image = null;
      
      public var img_selectedBg:Image = null;
      
      public var txt_name:Label = null;
      
      public var box_equip:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_equipIcon:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_redPoint:Image = null;
      
      public var img_plus:Image = null;
      
      public var txt_stren:Label = null;
      
      public var txt_jinlian:Label = null;
      
      public var img_locked:Image = null;
      
      public var list_stars:List = null;
      
      public var label_warn:Label = null;
      
      public function EquipSelectorRenderUI()
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
