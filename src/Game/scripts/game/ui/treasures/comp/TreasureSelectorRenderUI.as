package game.ui.treasures.comp
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.treasures.render.RuneRenderUI;
   
   public class TreasureSelectorRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="200" height="113" buttonMode="true">
			  <Image skin="png.uiTreasure.放道具框" x="9" y="-1" name="renderBg" var="img_bg"/>
			  <Image skin="png.uiTreasure.放道具框选中效果" x="6" y="-6" var="img_bgSelected" name="selectBox1" mouseEnabled="false"/>
			  <Box x="22" y="17" var="box_equip" width="72" height="72">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="22" var="img_quality" sizeGrid="24,24,24,24" anchorX="0.5" anchorY="0.5" width="50" height="50" y="22"/>
			    <Image skin="png.a5.commonImgs.img_equipRenderBgSmall1" x="1" y="1" var="img_equipIcon"/>
			    <Image skin="png.comp.image" var="img_icon" width="44" height="44" x="0" y="0"/>
			    <Image skin="png.a5.commonImgs.加号" x="11" y="11" var="img_plus"/>
			    <Image skin="png.a5.commonImgs.img_redPoint" x="36" y="-7" var="img_redPoint"/>
			  </Box>
			  <Label text="创世之矛\n创世之矛" autoSize="none" x="12" y="62" color="0xf9bd77" size="11" var="txt_name" width="103" align="left" mouseEnabled="false" multiline="true" wordWrap="true" mouseChildren="false" height="42" leading="-5"/>
			  <Label text="刻印10阶9星" autoSize="none" x="12" y="86" var="txt_fuwenkeyin" width="93" height="18" align="left" mouseEnabled="false" style="提示绿" mouseChildren="false" size="11"/>
			  <Label text="强化+88" autoSize="none" y="16" var="txt_stren" width="79" height="18" align="left" mouseEnabled="false" style="提示绿" mouseChildren="false" lgx="78,78,78,78,78,78,78,80" lgy="16,16,16,16,16,16,16,2" language="ru" x="98"/>
			  <List x="113" y="48" repeatX="3" repeatY="2" spaceY="5" spaceX="5" var="list_rune">
			    <RuneRender name="render" runtime="game.ui.treasures.render.RuneRenderUI"/>
			  </List>
			  <Box x="164" y="179" lgx="130,130,130,130,130,130,130,78" lgy="16,16,16,16,16,16,16,20" language="ru">
			    <List y="2" repeatX="5" spaceX="-10" var="list_stars" scale="0.35">
			      <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			    </List>
			    <Box x="25" var="box_starCnt">
			      <Label text="x6" autoSize="none" x="12" var="txt_starCnt" width="79" height="18" align="left" mouseEnabled="false" style="提示绿" mouseChildren="false"/>
			      <Image skin="png.a5.commonImgs.upstar.star_light" var="img_starL" y="4" smoothing="true" scale=".35"/>
			    </Box>
			  </Box>
			</WealthRender>;
       
      
      public var img_bg:Image = null;
      
      public var img_bgSelected:Image = null;
      
      public var box_equip:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_equipIcon:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_plus:Image = null;
      
      public var img_redPoint:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_fuwenkeyin:Label = null;
      
      public var txt_stren:Label = null;
      
      public var list_rune:List = null;
      
      public var list_stars:List = null;
      
      public var box_starCnt:Box = null;
      
      public var txt_starCnt:Label = null;
      
      public var img_starL:Image = null;
      
      public function TreasureSelectorRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.treasures.render.RuneRenderUI"] = RuneRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
